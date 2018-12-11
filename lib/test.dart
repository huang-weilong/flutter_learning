import 'package:flutter/material.dart';

class DragPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _DragPageState();
  }
}

class _DragPageState extends State<DragPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('test'),
          elevation: 0.0,
        ),
        body: Center(
          child: Text('暂无测试内容'),
        ));
  }
}
