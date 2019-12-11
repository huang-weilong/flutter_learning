import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class SlideDeletePage extends StatefulWidget {
  @override
  _SlideDeletePageState createState() => _SlideDeletePageState();
}

class _SlideDeletePageState extends State<SlideDeletePage> {
  List<String> list = List();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('滑动删除'),
        centerTitle: true,
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
              icon: Text('新增'),
              onPressed: () {
                setState(() {
                  list.add('test${list.length}');
                });
              })
        ],
      ),
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return _buildSlideItem(index);
        },
      ),
    );
  }

  Widget _buildSlideItem(int index) {
    return Slidable(
      actionExtentRatio: 0.20,
      child: Container(
        color: Colors.white,
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.indigoAccent,
            child: Text('$index'),
            foregroundColor: Colors.white,
          ),
          title: Text(list[index]),
          subtitle: Text('小标题'),
        ),
      ),
      closeOnScroll: true,
      actions: <Widget>[
        IconSlideAction(
          caption: 'Delete',
          color: Colors.red,
          icon: Icons.delete,
          onTap: () {
            setState(() {
              list.removeAt(index);
            });
          },
//          closeOnTap: false,
        ),
      ],
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: 'Delete',
          color: Colors.red,
          icon: Icons.delete,
          onTap: () {
            setState(() {
              list.removeAt(index);
            });
          },
        ),
      ],
      actionPane: SlidableDrawerActionPane(),
    );
  }
}
