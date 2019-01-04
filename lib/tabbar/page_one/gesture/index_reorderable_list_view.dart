import 'package:flutter/material.dart';

class IndexReorderableListView extends StatefulWidget {
  @override
  _IndexReorderableListViewState createState() => _IndexReorderableListViewState();
}

class _ListItem {
  _ListItem(this.value, this.checkState);

  final String value;

  bool checkState;
}

class _IndexReorderableListViewState extends State<IndexReorderableListView> {
  bool _reverseSort = false;
  final List<_ListItem> _items = <String>[
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
  ].map((String item) => _ListItem(item, false)).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ReorderableListView可拖拽排序'),
          centerTitle: true,
          elevation: 0.0,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.sort_by_alpha),
              tooltip: 'Sort',
              onPressed: () {
                setState(() {
                  _reverseSort = !_reverseSort;
                  _items.sort((_ListItem a, _ListItem b) => _reverseSort ? b.value.compareTo(a.value) : a.value.compareTo(b.value));
                });
              },
            ),
          ],
        ),
        /** Scrollbar 显示滚动条*/
        body: Scrollbar(
          child: ReorderableListView(
            children: _items.map(buildListTile).toList(),
            onReorder: _onReorder,
            scrollDirection: Axis.vertical,
          ),
        ));
  }

  Widget buildListTile(_ListItem item) {
    const Widget secondary = Text(
      'ReorderableListView  可拖拽排序',
    );

    return CheckboxListTile(
      key: Key(item.value),
      isThreeLine: true,
      value: item.checkState ?? false,
      onChanged: (bool newValue) {
        setState(() {
          item.checkState = newValue;
        });
      },
      title: Text('序号 ${item.value}.'),
      subtitle: secondary,
      secondary: const Icon(Icons.drag_handle),
    );

    // 返回这个可以使用横向布局。
//    return Container(
//      key: new Key(item.value),
//      height: 100.0,
//      width: 100.0,
//      child: new CircleAvatar(child: new Text(item.value),
//        backgroundColor: Colors.green,
//      ),
//    );
  }

  void _onReorder(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) {
        newIndex -= 1;
      }
      final _ListItem item = _items.removeAt(oldIndex);
      _items.insert(newIndex, item);
    });
  }
}
