import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ListViewExposurePage extends StatefulWidget {
  const ListViewExposurePage({Key? key}) : super(key: key);

  @override
  State<ListViewExposurePage> createState() => _ListViewExposurePageState();
}

class _ListViewExposurePageState extends State<ListViewExposurePage> {

  @override
  Widget build(BuildContext context) {
    return ListView.custom(
      childrenDelegate: MySliverChildBuilderDelegate(
        (BuildContext context, int index) {
        return Container(
          alignment: Alignment.center,
          height: 200,
          color: Colors.red,
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          width: double.infinity,
          child: Text('$index'),
        );
      }, childCount: 20),
      cacheExtent: 0.0,
    );
  }
}

class MySliverChildBuilderDelegate extends SliverChildBuilderDelegate {
  var arr = [];

  MySliverChildBuilderDelegate(
    Widget Function(BuildContext, int) builder, {
    required int childCount,
    bool addAutomaticKeepAlives = true,
    bool addRepaintBoundaries = true,
  }) : super(
          builder,
          childCount: childCount,
          addAutomaticKeepAlives: addAutomaticKeepAlives,
          addRepaintBoundaries: addRepaintBoundaries,
        );

  @override
  void didFinishLayout(int firstIndex, int lastIndex) {
    if (kDebugMode) {
      if (arr.contains(lastIndex)) return;
      arr.add(lastIndex);
      // print('firstIndex: $firstIndex, lastIndex: $lastIndex');
      print('第$lastIndex张卡片曝光了');
    }
    super.didFinishLayout(firstIndex, lastIndex);
  }
}
