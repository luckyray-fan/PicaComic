import 'package:pica_comic/foundation/app.dart';
import 'package:flutter/material.dart';
import 'package:pica_comic/foundation/local_favorites.dart';
import 'package:pica_comic/tools/translations.dart';
import 'package:pica_comic/views/main_page.dart';
import 'package:pica_comic/views/pre_search_page.dart';
import 'package:pica_comic/views/widgets/select.dart';
import '../../base.dart';
export 'package:pica_comic/foundation/def.dart';


abstract class ComicTile extends StatelessWidget {
  /// Show a comic brief information. Usually displayed in comic list page.
  const ComicTile({Key? key}) : super(key: key);

  Widget get image;
  Widget? buildSubDescription(BuildContext context) => null;
  String get title;
  String get subTitle;
  String get description;
  String? get badge => null;
  List<String>? get tags => null;
  int get maxLines => 2;

  FavoriteItem? get favoriteItem => null;

  ActionFunc? get read => null;

  bool get enableLongPressed => true;

  int? get pages => null;

  String? get badgeOnImage => null;

  void onLongTap_() {
    bool favorite = false;
    showDialog(
        context: App.globalContext!,
        builder: (context) => StatefulBuilder(builder: (context, setState){
          Widget child;
          if(!favorite){
            child = Dialog(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 400),
                child: Column(
                  key: const Key("1"),
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                      child: SelectableText(
                        title.replaceAll("\n", ""),
                        style: const TextStyle(fontSize: 22),
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      leading: const Icon(Icons.article),
                      title: Text("查看详情".tl),
                      onTap: (){
                        App.globalBack();
                        onTap_();
                      },
                    ),
                    if(favoriteItem != null)
                      ListTile(
                        leading: const Icon(Icons.bookmark_rounded),
                        title: Text("本地收藏".tl),
                        onTap: () {
                          setState((){
                            favorite = true;
                          });
                        },
                      ),
                    if(read != null)
                      ListTile(
                        leading: const Icon(Icons.chrome_reader_mode),
                        title: Text("阅读".tl),
                        onTap: () {
                          App.globalBack();
                          read!();
                        },
                      ),
                    ListTile(
                      leading: const Icon(Icons.search),
                      title: Text("搜索".tl),
                      onTap: () {
                        App.globalBack();
                        MainPage.to(() => PreSearchPage(initialValue: title,));
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                  ],
                ),
              ),
            );
          } else {
            child = buildFavoriteDialog();
          }
          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            child: child,
          );
        }));
  }

  Widget buildFavoriteDialog(){
    String? folder;
    return SimpleDialog(
      title: Text("添加收藏".tl),
      children: [
        ListTile(
          title: Text("收藏夹".tl),
          trailing: Select(
            outline: true,
            width: 156,
            values: LocalFavoritesManager().folderNames,
            initialValue: null,
            whenChange: (i) =>
            folder = LocalFavoritesManager().folderNames[i],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Center(
          child: FilledButton(
            child: const Text("确认"),
            onPressed: () {
              LocalFavoritesManager().addComic(folder!, favoriteItem!);
              App.globalBack();
            },
          ),
        ),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }

  void onTap_();
  void onSecondaryTap_(TapDownDetails details) {
    showMenu(
        context: App.globalContext!,
        position: RelativeRect.fromLTRB(
            details.globalPosition.dx,
            details.globalPosition.dy,
            details.globalPosition.dx,
            details.globalPosition.dy),
        items: [
          PopupMenuItem(
              onTap: () => Future.delayed(
                  const Duration(milliseconds: 200), () => onTap_()),
              child: Text("查看".tl)),
          if(read != null)
          PopupMenuItem(
              onTap: () => Future.delayed(
                  const Duration(milliseconds: 200), () => read!()),
              child: Text("阅读".tl)),
          PopupMenuItem(
              onTap: () => Future.delayed(
                  const Duration(milliseconds: 200),
                      () => MainPage.to(() => PreSearchPage(initialValue: title,))),
              child: Text("搜索".tl)),
          PopupMenuItem(
              onTap: () => Future.delayed(
                  const Duration(milliseconds: 200),
                      () => showDialog(context: App.globalContext!,
                          builder: (context) => buildFavoriteDialog())),
              child: Text("本地收藏".tl)),
        ]);
  }

  @override
  Widget build(BuildContext context) {
    var type = appdata.settings[44].split(',').first;
    if(type == "0" || type == "3"){
      return _buildDetailedMode(context);
    } else {
      return _buildBriefMode(context);
    }
  }

  Widget _buildDetailedMode(BuildContext context){
    return LayoutBuilder(builder: (context, constrains){
      final height = constrains.maxHeight - 16;
      return Material(
        color: Colors.transparent,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: onTap_,
            onLongPress: enableLongPressed ? onLongTap_ : null,
            onSecondaryTapDown: onSecondaryTap_,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 24, 8),
              child: Row(
                children: [
                  Container(
                      width: height * 0.68,
                      height: double.infinity,
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondaryContainer,
                          borderRadius: BorderRadius.circular(8)),
                      clipBehavior: Clip.antiAlias,
                      child: image),
                  SizedBox.fromSize(
                    size: const Size(16, 5),
                  ),
                  Expanded(
                    child: _ComicDescription(
                      //标题中不应出现换行符, 爬虫可能多爬取换行符, 为避免麻烦, 直接在此处删去
                      title: pages == null ? title.replaceAll("\n", "") : "[${pages}P]${title.replaceAll("\n", "")}",
                      user: subTitle,
                      description: description,
                      subDescription: buildSubDescription(context),
                      badge: badge,
                      tags: tags,
                      maxLines: maxLines,
                    ),
                  ),
                  //const Center(
                  //  child: Icon(Icons.arrow_right),
                  //)
                ],
              ),
            )),
      );
    });
  }

  Widget _buildBriefMode(BuildContext context){
    return Material(
      color: Colors.transparent,
      borderRadius: const BorderRadius.all(Radius.circular(16)),
      child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: onTap_,
          onLongPress: enableLongPressed ? onLongTap_ : null,
          onSecondaryTapDown: onSecondaryTap_,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
            child: Column(
              children: [
                Expanded(
                  child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondaryContainer,
                          borderRadius: BorderRadius.circular(12)),
                      clipBehavior: Clip.antiAlias,
                      child: image),
                ),
                const SizedBox(height: 2,),
                Text(title, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 12),),
                Text(subTitle, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 10),)
              ],
            ),
          )),
    );
  }
}

class _ComicDescription extends StatelessWidget {
  const _ComicDescription(
      {required this.title,
      required this.user,
      required this.description,
      this.subDescription,
      this.badge,
      this.maxLines=2,
      this.tags});

  final String title;
  final String user;
  final String description;
  final Widget? subDescription;
  final String? badge;
  final List<String>? tags;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(1.0, 0.0, 0.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14.0,
            ),
            maxLines: maxLines,
            overflow: TextOverflow.ellipsis,
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 1.0)),
          if(user != "")
          Text(
            user,
            style: const TextStyle(fontSize: 10.0),
            maxLines: 1,
          ),
          if(user != "")
          const Padding(padding: EdgeInsets.symmetric(vertical: 1.0)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                const SizedBox(
                  height: 5,
                ),
                if (tags != null)
                  Expanded(
                    child: LayoutBuilder(
                      builder: (context, constraints) => Padding(
                        padding:
                            EdgeInsets.only(bottom: constraints.maxHeight % 23),
                        child: Wrap(
                          runAlignment: WrapAlignment.start,
                          clipBehavior: Clip.antiAlias,
                          crossAxisAlignment: WrapCrossAlignment.end,
                          children: [
                            for (var s in tags!)
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 4, 3),
                                child: Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(3, 1, 3, 3),
                                  decoration: BoxDecoration(
                                    color: s == "Unavailable" ? Theme.of(context)
                                        .colorScheme
                                        .errorContainer : Theme.of(context)
                                        .colorScheme
                                        .secondaryContainer,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(8)),
                                  ),
                                  child: Text(
                                    s,
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                ),
                              )
                          ],
                        ),
                      ),
                    ),
                  ),
                const SizedBox(
                  height: 2,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (subDescription != null) subDescription!,
                          Text(
                            description,
                            style: const TextStyle(
                              fontSize: 12.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (badge != null)
                      Container(
                        padding: const EdgeInsets.fromLTRB(6, 4, 6, 4),
                        decoration: BoxDecoration(
                          color:
                              Theme.of(context).colorScheme.tertiaryContainer,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8)),
                        ),
                        child: Text(badge!, style: const TextStyle(fontSize: 12),),
                      )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
