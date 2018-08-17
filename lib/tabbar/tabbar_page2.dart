import 'package:flutter/material.dart';

class TabbarPage2 extends StatefulWidget {
  @override
  _TabbarPage2State createState() => _TabbarPage2State();
}

class _TabbarPage2State extends State<TabbarPage2> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('我是tabbar2的页面\n没有AppBar'),
    );
  }
}
