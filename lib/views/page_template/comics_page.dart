import 'package:flutter/material.dart';
import 'package:pica_comic/network/eh_network/eh_models.dart';
import 'package:pica_comic/network/hitomi_network/hitomi_models.dart';
import 'package:pica_comic/network/htmanga_network/models.dart';
import 'package:pica_comic/network/jm_network/jm_models.dart';
import 'package:pica_comic/network/nhentai_network/models.dart';
import 'package:pica_comic/network/picacg_network/models.dart';
import 'package:pica_comic/tools/extensions.dart';
import 'package:pica_comic/views/eh_views/eh_widgets/eh_gallery_tile.dart';
import 'package:pica_comic/views/hitomi_views/hi_widgets.dart';
import 'package:pica_comic/views/ht_views/ht_comic_tile.dart';
import 'package:pica_comic/views/jm_views/jm_widgets.dart';
import 'package:pica_comic/views/nhentai/comic_tile.dart';
import 'package:pica_comic/views/pic_views/widgets.dart';
import 'package:pica_comic/views/widgets/appbar.dart';
import 'package:pica_comic/views/widgets/grid_view_delegate.dart';
import 'package:pica_comic/views/widgets/loading.dart';
import 'package:pica_comic/views/widgets/show_error.dart';
import 'package:pica_comic/views/widgets/show_message.dart';
import '../../base.dart';
import '../../foundation/app.dart';
import '../../foundation/ui_mode.dart';
import '../../network/res.dart';
import '../widgets/list_loading.dart';
import 'package:pica_comic/tools/translations.dart';

export 'package:pica_comic/foundation/def.dart';

class ComicsPageLogic<T> extends StateController {
  bool loading = true;

  ///用于正常模式下的漫画数据储存
  List<T>? comics;

  ///用于分页模式下的漫画数据储存
  Map<int, List<T>>? dividedComics;

  ///错误信息, null表示没有错误
  String? message;

  /// 最大页数, 为null表示不知道或者无穷
  int? maxPage;

  ///当前的页面序号
  int current = 1;

  ///是否正在获取数据， 用于在顺序浏览模式下， 避免同时进行多个网络请求
  bool loadingData = false;

  bool showFloatingButton = true;

  void get(Future<Res<List<T>>> Function(int) getComics) async {
    if(loadingData) return;
    loadingData = true;
    if (comics == null) {
      var res = await getComics(1);
      if (res.error) {
        message = res.errorMessage;
      } else {
        comics = res.data;
        dividedComics = {};
        dividedComics![1] = res.data;
        if (res.subData is int) {
          maxPage = res.subData;
        }
        if (res.data.isEmpty) {
          maxPage = 1;
        }
      }
      loading = false;
      update();
    } else {
      var res = await getComics(current);
      if (res.error) {
        message = res.errorMessage;
      } else {
        dividedComics![current] = res.data;
      }
      loading = false;
      update();
    }
    loadingData = false;

  }

  void loadNextPage(Future<Res<List<T>>> Function(int) getComics) async {
    if (maxPage != null && current >= maxPage!) return;
    if (loadingData) return;
    loadingData = true;
    var res = await getComics(current + 1);
    if (res.error) {
      showMessage(App.globalContext, res.errorMessage!);
    } else {
      if (res.data.isEmpty) {
        maxPage = current;
        update();
      } else {
        comics!.addAll(res.data);
        current++;
        update();
      }
    }
    loadingData = false;
  }

  void refresh_() {
    loading = true;
    comics = null;
    message = null;
    update();
  }
}

/// 漫画列表页面
///
/// T为漫画信息模型
abstract class ComicsPage<T> extends StatelessWidget {
  const ComicsPage({super.key});

  ///标题
  String get title;

  ///是否居中标题
  bool get centerTitle => true;

  ///是否使用大标题
  bool get largeTitle => true;

  ///获取图片, 参数为页面序号, **从1开始**
  ///
  /// 返回值Res的subData为页面总数
  Future<Res<List<T>>> getComics(int i);

  ///漫画类型
  ComicType get type;

  ///是否显示标题
  bool get showTitle => true;

  ///是否需要Scaffold
  bool get withScaffold;

  ///显示一个刷新按钮, 需要Scaffold启用
  bool get withRefreshFloatingButton => false;

  String? get tag;

  Widget? get tailing => null;

  Widget? get head => null;

  bool get showBackWhenError => true;

  bool get showPageIndicator => true;

  ///加载时显示返回按钮
  bool get showBackWhenLoading => showTitle;

  ///刷新页面
  void refresh() {
    StateController.find<ComicsPageLogic<T>>(tag: tag).refresh_();
  }

  @override
  Widget build(context) {
    if (appdata.blockingKeyword.contains(tag) ||
        (tag != null &&
            appdata.blockingKeyword.contains(tag!.split(" ").last))) {
      var body = showNetworkError("已屏蔽的关键词", () {}, context,
          showBack: showBackWhenError);
      if (withScaffold) {
        return Scaffold(
          body: body,
        );
      } else {
        return body;
      }
    }
    Widget body = StateBuilder<ComicsPageLogic<T>>(
        init: ComicsPageLogic<T>(),
        tag: tag,
        builder: (logic) {
          if (logic.dividedComics?[logic.current] == null &&
              logic.message == null &&
              appdata.settings[25] != "0") {
            logic.loading = true;
          }
          if (logic.loading) {
            logic.get(getComics);
            return !showBackWhenLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : showLoading(context);
          } else if (logic.message != null){
            return showNetworkError(
                logic.message ?? "网络错误", logic.refresh_, context,
                showBack: showBackWhenError);
          } else {
            if (appdata.settings[25] == "0") {
              var comics = logic.comics!;
              return CustomScrollView(
                slivers: [
                  if (showTitle)
                    if (largeTitle)
                      CustomSliverAppbar(
                        title: Text(title),
                        centerTitle: centerTitle,
                        actions: tailing != null ? [tailing!] : null,
                      )
                    else
                      SliverAppBar(
                        title: Text(title),
                        centerTitle: centerTitle,
                        pinned: true,
                        actions: tailing != null ? [tailing!] : null,
                      ),
                  if (head != null) head!,
                  SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                        childCount: comics.length, (context, i) {
                      if (i == comics.length - 1) {
                        logic.loadNextPage(getComics);
                      }
                      switch (type.index) {
                        case 0:
                          return PicComicTile(comics[i] as ComicItemBrief);
                        case 1:
                          return EhGalleryTile(comics[i] as EhGalleryBrief);
                        case 2:
                          return JmComicTile(comics[i] as JmComicBrief);
                        case 3:
                          if (comics[i] is int) {
                            return HitomiComicTileDynamicLoading(
                                comics[i] as int);
                          } else {
                            return HiComicTile(comics[i] as HitomiComicBrief);
                          }
                        case 4:
                          return HtComicTile(comic: comics[i] as HtComicBrief);
                        case 5:
                          return HtComicTileInFavoritePage(
                              comic: comics[i] as HtComicBrief,
                              refresh: refresh);
                        case 6:
                          return NhentaiComicTile(comics[i] as NhentaiComicBrief);
                        default:
                          throw UnimplementedError();
                      }
                    }),
                    gridDelegate: SliverGridDelegateWithComics(),
                  ),
                  if (logic.current < (logic.maxPage ?? 114514))
                    const SliverToBoxAdapter(
                      child: ListLoadingIndicator(),
                    )
                ],
              );
            } else {
              var comics = logic.dividedComics;
              Widget body = CustomScrollView(
                slivers: [
                  if (showTitle)
                    if (largeTitle)
                      CustomSliverAppbar(
                        title: Text(title),
                        centerTitle: centerTitle,
                        actions: tailing != null ? [tailing!] : null,
                      )
                    else
                      SliverAppBar(
                        title: Text(title),
                        centerTitle: centerTitle,
                        pinned: true,
                        actions: tailing != null ? [tailing!] : null,
                      ),
                  if (head != null) head!,
                  SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                        childCount: comics?[logic.current]!.length,
                            (context, i) {
                          switch (type.index) {
                            case 0:
                              return PicComicTile(
                                  comics?[logic.current]![i] as ComicItemBrief);
                            case 1:
                              return EhGalleryTile(
                                  comics?[logic.current]![i] as EhGalleryBrief);
                            case 2:
                              return JmComicTile(
                                  comics?[logic.current]![i] as JmComicBrief);
                            case 3:
                              if (comics?[logic.current]![i] is int) {
                                return HitomiComicTileDynamicLoading(
                                    comics?[logic.current]![i] as int);
                              } else {
                                return HiComicTile(
                                    comics?[logic.current]![i] as HitomiComicBrief);
                              }
                            case 4:
                              return HtComicTile(
                                  comic:
                                  comics?[logic.current]![i] as HtComicBrief);
                            case 5:
                              return HtComicTileInFavoritePage(
                                  comic: comics?[logic.current]![i] as HtComicBrief,
                                  refresh: refresh);
                            case 6:
                              return NhentaiComicTile(comics?[logic.current]![i] as NhentaiComicBrief);
                            default:
                              throw UnimplementedError();
                          }
                        }),
                    gridDelegate: SliverGridDelegateWithComics(),
                  ),
                  if(showPageIndicator && appdata.settings[64] == "0")
                    buildPageSelector(context, logic),
                  SliverPadding(padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).padding.bottom))
                ],
              );

              body = NotificationListener<ScrollUpdateNotification>(
                onNotification: (notifications){
                  if(notifications.scrollDelta != null){
                    if(notifications.scrollDelta! > 0 && logic.showFloatingButton){
                      logic.showFloatingButton = false;
                      logic.update();
                    } else if((notifications.scrollDelta! < 0
                        || notifications.metrics.pixels == notifications.metrics.minScrollExtent
                        || notifications.metrics.pixels == notifications.metrics.maxScrollExtent)
                        && !logic.showFloatingButton){
                      logic.showFloatingButton = true;
                      logic.update();
                    }
                  }
                  return false;
                },
                child: body,
              );

              if(showPageIndicator && appdata.settings[64] == "1"){
                return Stack(
                  children: [
                    Positioned.fill(
                      child: body,
                    ),
                    Positioned(
                      left: 0,
                      right: 12,
                      top: 0,
                      bottom: 0,
                      child: buildPageSelectorRight(context, logic)
                    )
                  ],
                );
              } else {
                return body;
              }
            }
          }
        });

    if(head != null && UiMode.m1(context)) {
      body = SafeArea(bottom: false,child: body,);
    }

    if (withScaffold) {
      return Scaffold(
        floatingActionButton: withRefreshFloatingButton
            ? FloatingActionButton(
                child: const Icon(Icons.refresh),
                onPressed: () {
                  refresh();
                },
              )
            : null,
        body: body,
      );
    } else {
      return body;
    }
  }

  Widget buildPageSelector(BuildContext context, ComicsPageLogic logic){
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width > 600
                  ? 600
                  : MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  FilledButton(
                      onPressed: () {
                        prevPage(logic);
                      },
                      child: Text("上一页".tl)),
                  const Spacer(),
                  ActionChip(
                    label: Text(
                        "${"页面".tl}: ${logic.current}/${logic.maxPage?.toString() ?? "?"}"),
                    onPressed: () async {
                      selectPage(logic);
                    },
                    elevation: 1,
                    side: BorderSide.none,
                  ),
                  const Spacer(),
                  FilledButton(
                      onPressed: () {
                        nextPage(logic);
                      },
                      child: Text("下一页".tl)),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildPageSelectorRight(BuildContext context, ComicsPageLogic logic){
    return Align(
      alignment: Alignment.centerRight,
      child: AnimatedSlide(
        offset: logic.showFloatingButton ? const Offset(0, 0) : const Offset(1.5, 0),
        duration: const Duration(milliseconds: 200),
        child: Material(
          color: Theme.of(context).colorScheme.secondaryContainer,
          borderRadius: BorderRadius.circular(16),
          elevation: 3,
          child: SizedBox(
            height: 156,
            width: 58,
            child: Column(
              children: [
                Expanded(
                  child: InkWell(
                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
                    onTap: (){
                      prevPage(logic);
                    },
                    child: const SizedBox.expand(
                      child: Center(
                        child: Icon(Icons.keyboard_arrow_left),
                      ),
                    ),
                  ),
                ),
                const Divider(height: 1,),
                Expanded(
                  child: InkWell(
                    onTap: (){
                      selectPage(logic);
                    },
                    child: SizedBox.expand(
                      child: Center(
                        child: Text("${logic.current}/${logic.maxPage?.toString() ?? "?"}"),
                      ),
                    ),
                  )
                ),
                const Divider(height: 1,),
                Expanded(
                  child: InkWell(
                    borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(16), bottomRight: Radius.circular(16)),
                    onTap: (){
                      nextPage(logic);
                    },
                    child: const SizedBox.expand(
                      child: Center(
                        child: Icon(Icons.keyboard_arrow_right),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ));
  }

  void nextPage(ComicsPageLogic logic){
    if (logic.current == logic.maxPage ||
        logic.current == 0) {
      showMessage(App.globalContext, "已经是最后一页了".tl);
    } else {
      logic.current++;
      logic.update();
    }
  }

  void prevPage(ComicsPageLogic logic){
    if (logic.current == 1 ||
        logic.current == 0) {
      showMessage(App.globalContext, "已经是第一页了".tl);
    } else {
      logic.current--;
      logic.update();
    }
  }

  void selectPage(ComicsPageLogic logic) async{
    String res = "";
    await showDialog(
    context: App.globalContext!,
    builder: (dialogContext) {
      var controller =
      TextEditingController();
      return SimpleDialog(
        title: const Text("切换页面"),
        children: [
          const SizedBox(
            width: 300,
          ),
          Padding(
            padding:
            const EdgeInsets.fromLTRB(
                16, 10, 16, 20),
            child: TextField(
              decoration: InputDecoration(
                border:
                const OutlineInputBorder(),
                labelText: "页码".tl,
                suffixText:
                "${"输入范围: ".tl}1-${logic.maxPage?.toString() ?? "?"}",
              ),
              controller: controller,
              onSubmitted: (s) {
                res = s;
                App.globalBack();
              },
            ),
          ),
          Center(
            child: FilledButton(
              child: Text("提交".tl),
              onPressed: () {
                res = controller.text;
                App.globalBack();
              },
            ),
          )
        ],
      );
    });
    if (res.isNum) {
      int i = int.parse(res);
      if (logic.maxPage == null ||
          (i > 0 && i <= logic.maxPage!)) {
        logic.current = i;
        logic.update();
        return;
      }
    }
    if (res != "") {
      showMessage(App.globalContext, "输入的数字不正确");
    }
  }
}
