import 'package:flutter/material.dart';

class WrapLayout extends StatefulWidget {
  @override
  _WrapLayoutState createState() => _WrapLayoutState();
}

class _WrapLayoutState extends State<WrapLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('wrap布局'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Wrap(
        children: <Widget>[
          Text('wrap是一个流式布局，一行放不下时会自动换行显示=========================================================================='),
          Text('---------------------------------------------'),
          Text('11'),
          Text('22')
        ],
      ),
    );
  }
}
