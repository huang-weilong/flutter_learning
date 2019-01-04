import 'package:flutter/material.dart';

class IndexDragPage extends StatefulWidget {
  @override
  _IndexDragPageState createState() => _IndexDragPageState();
}

class _IndexDragPageState extends State<IndexDragPage> {
  List<String> rows = List<String>()..add('AAAAAAAAAAAAAA')..add('BBBBBBBBBBBBBB')..add('CCCCCCCCCCCCC')..add('DDDDDDDDDDDDD');

  void _handleAccept(int data, int index) {
    setState(() {
      String imageToMove = rows[data];
      rows.removeAt(data);
      rows.insert(index, imageToMove);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('drag拖拽'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: LayoutBuilder(builder: (context, constraint) {
        return ListView.builder(
          itemCount: rows.length,
          addRepaintBoundaries: true,
          itemBuilder: (context, index) {
            return Draggable(
              key: ObjectKey(index),
              data: index,
              child: DragTarget<int>(
                onAccept: (int data) {
                  _handleAccept(data, index);
                },
                builder: (BuildContext context, List<int> data, List<dynamic> rejects) {
                  return Card(
                      child: Column(
                        children: <Widget>[
                          ListTile(leading: Icon(Icons.photo), title: Text(rows[index])),

                        ],
                      ));
                },
                onLeave: (int data) {
                  // Debug
                  print('$data is Leaving row $index');
                },
                onWillAccept: (int data) {
                  // Debug
                  print('$index will accept row $data');

                  return true;
                },
              ),
              onDragStarted: () {

              },
              onDragCompleted: () {
              },
              feedback: SizedBox(
                  width: constraint.maxWidth,
                  child: Card(
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          leading: Icon(Icons.photo),
                          title: Text(rows[index]),
                        ),
                      ],
                    ),
                    elevation: 18.0,
                  )),
              childWhenDragging: Container(),
            );
          },
        );
      }),
    );
  }
}
