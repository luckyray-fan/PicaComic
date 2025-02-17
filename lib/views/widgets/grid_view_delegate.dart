import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pica_comic/base.dart';
import 'dart:math' as math;

class SliverGridViewWithFixedItemHeight extends StatelessWidget {
  const SliverGridViewWithFixedItemHeight(
      {required this.delegate,
      required this.maxCrossAxisExtent,
      required this.itemHeight,
      super.key});

  final SliverChildDelegate delegate;

  final double maxCrossAxisExtent;

  final double itemHeight;

  @override
  Widget build(BuildContext context) {
    return SliverLayoutBuilder(
        builder: ((context, constraints) => SliverGrid(
              delegate: delegate,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: maxCrossAxisExtent,
                  childAspectRatio:
                      calcChildAspectRatio(constraints.crossAxisExtent)),
            )));
  }

  double calcChildAspectRatio(double width) {
    var crossItems = width ~/ maxCrossAxisExtent;
    if (width % maxCrossAxisExtent != 0) {
      crossItems += 1;
    }
    final itemWidth = width / crossItems;
    return itemWidth / itemHeight;
  }
}

class SliverGridDelegateWithFixedHeight extends SliverGridDelegate{
  const SliverGridDelegateWithFixedHeight({
        required this.maxCrossAxisExtent,
        required this.itemHeight,
  });

  final double maxCrossAxisExtent;

  final double itemHeight;

  @override
  SliverGridLayout getLayout(SliverConstraints constraints) {
    final width = constraints.crossAxisExtent;
    var crossItems = width ~/ maxCrossAxisExtent;
    if (width % maxCrossAxisExtent != 0) {
      crossItems += 1;
    }
    return SliverGridRegularTileLayout(
      crossAxisCount: crossItems,
      mainAxisStride: itemHeight,
      crossAxisStride: width / crossItems,
      childMainAxisExtent: itemHeight,
      childCrossAxisExtent: width / crossItems,
      reverseCrossAxis: false
    );
  }

  @override
  bool shouldRelayout(covariant SliverGridDelegate oldDelegate) {
    if(oldDelegate is! SliverGridDelegateWithFixedHeight) return true;
    if(oldDelegate.maxCrossAxisExtent != maxCrossAxisExtent
        || oldDelegate.itemHeight != itemHeight){
      return true;
    }
    return false;
  }

}

class SliverGridDelegateWithComics extends SliverGridDelegate{
  SliverGridDelegateWithComics();

  @override
  SliverGridLayout getLayout(SliverConstraints constraints) {
    var setting = appdata.settings[44].split(',');
    if(setting.length == 1){
      setting.add("1.0");
    }
    if(setting[0] == "1" || setting[0] == "2"){
      return getBriefModeLayout(constraints, double.parse(setting[1]));
    } else {
      return getDetailedModeLayout(constraints, double.parse(setting[1]));
    }
  }

  SliverGridLayout getDetailedModeLayout(SliverConstraints constraints, double scale){
    const maxCrossAxisExtent = 650;
    final itemHeight = 164 * scale;
    final width = constraints.crossAxisExtent;
    var crossItems = width ~/ maxCrossAxisExtent;
    if (width % maxCrossAxisExtent != 0) {
      crossItems += 1;
    }
    return SliverGridRegularTileLayout(
        crossAxisCount: crossItems,
        mainAxisStride: itemHeight,
        crossAxisStride: width / crossItems,
        childMainAxisExtent: itemHeight,
        childCrossAxisExtent: width / crossItems,
        reverseCrossAxis: false
    );
  }

  SliverGridLayout getBriefModeLayout(SliverConstraints constraints, double scale){
    final maxCrossAxisExtent = 192.0 * scale;
    const childAspectRatio = 0.62;
    const crossAxisSpacing = 0.0;
    int crossAxisCount = (constraints.crossAxisExtent / (maxCrossAxisExtent + crossAxisSpacing)).ceil();
    // Ensure a minimum count of 1, can be zero and result in an infinite extent
    // below when the window size is 0.
    crossAxisCount = math.max(1, crossAxisCount);
    final double usableCrossAxisExtent = math.max(
      0.0,
      constraints.crossAxisExtent - crossAxisSpacing * (crossAxisCount - 1),
    );
    final double childCrossAxisExtent = usableCrossAxisExtent / crossAxisCount;
    final double childMainAxisExtent = childCrossAxisExtent / childAspectRatio;
    return SliverGridRegularTileLayout(
      crossAxisCount: crossAxisCount,
      mainAxisStride: childMainAxisExtent,
      crossAxisStride: childCrossAxisExtent + crossAxisSpacing,
      childMainAxisExtent: childMainAxisExtent,
      childCrossAxisExtent: childCrossAxisExtent,
      reverseCrossAxis: axisDirectionIsReversed(constraints.crossAxisDirection),
    );
  }

  @override
  bool shouldRelayout(covariant SliverGridDelegate oldDelegate) {
    return true;
  }
}