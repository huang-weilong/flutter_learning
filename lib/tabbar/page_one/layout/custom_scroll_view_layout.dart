import 'package:flutter/material.dart';

class CustomScrollViewLayout extends StatefulWidget {
  @override
  _CustomScrollViewLayoutState createState() => _CustomScrollViewLayoutState();
}

class _CustomScrollViewLayoutState extends State<CustomScrollViewLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text('SliverAppBar'),
            pinned: true,
            floating: true,
            snap: false,
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Demo'),
            ),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
              return Card(
                child: Text('AAAAA$index'),
              );
            }, childCount: 10),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              List.generate(20, (int index) {
                return GestureDetector(
                  onTap: () {
                    print("点击$index");
                  },
                  child: Card(
                    child: Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.all(10),
                      child: Text('data $index'),
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
