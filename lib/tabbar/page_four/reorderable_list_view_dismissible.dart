import 'package:flutter/material.dart';

class ReorderableListViewDismissible extends StatefulWidget {
  @override
  _ReorderableListViewDismissibleState createState() => _ReorderableListViewDismissibleState();
}

class LeaveBehindItem {
  LeaveBehindItem({this.index, this.name});

//  LeaveBehindItem.from(LeaveBehindItem item)
//      : index = item.index,
//        name = item.name;

  final int index;
  final String name;
}

class _ReorderableListViewDismissibleState extends State<ReorderableListViewDismissible> {
  List<LeaveBehindItem> leaveBehindItems;

  @override
  void initState() {
    super.initState();
    leaveBehindItems = List<LeaveBehindItem>.generate(16, (int index) {
      return LeaveBehindItem(index: index, name: '第 $index 项');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('拖拽排序 + 滑动删除'),
          centerTitle: true,
          elevation: 0.0,
        ),
        /** Scrollbar 显示滚动条*/
        body: Scrollbar(
          child: ReorderableListView(
            children: leaveBehindItems.map(buildListTile).toList(),
            onReorder: _onReorder,
            scrollDirection: Axis.vertical,
          ),
        ));
  }

  Widget buildListTile(LeaveBehindItem item) {
    return Dismissible(
      key: Key('A${item.index}'),
      onDismissed: (DismissDirection direction) {
        _handleDelete(item);
      },
      background: Text('删除'),
      child: ListTile(
        leading: Icon(Icons.accessibility),
        title: Text('${item.name}'),
      )
    );
  }

  // 拖动排序的方法
  void _onReorder(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) {
        newIndex -= 1;
      }
      final LeaveBehindItem item = leaveBehindItems.removeAt(oldIndex);
      leaveBehindItems.insert(newIndex, item);
    });
  }

  // 滑动删除的方法
  void _handleDelete(LeaveBehindItem item) {
    setState(() {
      leaveBehindItems.remove(item);
    });
  }
}
