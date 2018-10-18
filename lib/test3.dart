import 'package:flutter/material.dart';
import 'widget/click_effect.dart';

class Test3 extends StatefulWidget {
  @override
  _Test3State createState() => _Test3State();
}
class _ListItem {
  _ListItem(this.value, this.checkState);

  final String value;

  bool checkState;
}
class _Test3State extends State<Test3> {
  final List<_ListItem> _items = <String>[
    'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N',
  ].map((String item) => _ListItem(item, false)).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('test3'),
          centerTitle: true,
          elevation: 0.0,
        ),
        body: ReorderableListView(
          header: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Header of the list', style: Theme.of(context).textTheme.headline)),
          onReorder: _onReorder,
          scrollDirection:  Axis.vertical,
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          children: _items.map(buildListTile).toList(),
        )
    );
  }

  Widget buildListTile(_ListItem item) {
    const Widget secondary = Text(
      'Even more additional list item information appears on line three.',
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
