import 'package:flutter/material.dart';

class Test2 extends StatefulWidget {
  @override
  _Test2State createState() => _Test2State();
}

class _Test2State extends State<Test2> {

  List<String> rows = new List<String>()
    ..add('Row 1')
    ..add('Row 2')
    ..add('Row 3')
    ..add('Row 4');

  void _handleAccept(int data, int index) {
    setState(() {
      String imageToMove = rows[data];
      rows.removeAt(data);
      rows.insert(index, imageToMove);
    });
  }

  @override
  Widget build(BuildContext context) {
    final title = 'Sortable ListView';
    return Scaffold(
      appBar: AppBar(
        title: Text("22"),
      ),
      body: ListView(
        children: <Widget>[
          Draggable(
//            data: //数据源,将来可以传递给DragTarget
            // 静止时显示的Widget
            child: DragTarget(
              onAccept: (int data) {
                _handleAccept(data, 1);
              },
              builder: (BuildContext context, List<int> data, List<dynamic> rejects) {
              return Card(
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Text('22222222222'),
                        width: 300.0,
                        height: 60.0,
                        color: Colors.orange,
                      ),
                    ],
                  ));
            },),
            // 拖动时跟随手指滑动的Widget
            feedback: Container(
              child: Text('333333333'),
              width: 300.0,
              height: 60.0,
              color: Colors.orange,
            ),
          ),
          Draggable(
            child: Container(
              child: Text('22222222222'),
              width: 300.0,
              height: 60.0,
              color: Colors.orange,
            ),
            feedback: Container(
              child: Text('ddddddddddd'),
              width: 300.0,
              height: 60.0,
              color: Colors.orange,
            ),
          ),
        ],
      ),
    );
  }
}
