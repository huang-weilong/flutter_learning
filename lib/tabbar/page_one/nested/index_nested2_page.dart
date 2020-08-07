import 'package:flutter/material.dart';

class IndexNested2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: SliverAppBar(
                pinned: true,
                expandedHeight: 300.0, // 这个高度必须比flexibleSpace高度大
                forceElevated: innerBoxIsScrolled,
                bottom: PreferredSize(
                  child: Container(
                    height: 46.0,
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    alignment: Alignment.center,
                    child: Text('滑动时固定的内容'),
                    color: Colors.redAccent[200],
                  ),
                  preferredSize: Size(double.infinity, 46.0),
                ),
                // 46.0为TabBar的高度，也就是tabs.dart中的_kTabHeight值，因为flutter不支持反射所以暂时没法通过代码获取
                flexibleSpace: Container(
                  child: Column(
                    children: <Widget>[
                      AppBar(title: Text("标题Appbar")),
                      Expanded(child: Image.asset("assets/images/img.jpg")),
                    ],
                  ),
                ),
              ),
            ),
          ];
        },
        // Builder不要删
        body: Builder(
          builder: (BuildContext context) {
            return CustomScrollView(
              slivers: <Widget>[
                SliverOverlapInjector(
                  handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                ),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 16.0,
                  ),
                  sliver: SliverFixedExtentList(
                    itemExtent: 200.0,
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8.0,
                          ),
                          child: Text('-----页面内容布局------'),
                        );
                      },
                      childCount: 2,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
