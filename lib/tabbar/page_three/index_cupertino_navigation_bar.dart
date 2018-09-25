import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class IndexCupertinoNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text('iOS风格的appbar'),
        actionsForegroundColor: Colors.red,//leading及trailing的颜色
//        automaticallyImplyLeading: false,//leading是否为null
//        backgroundColor: Colors.green,//背景颜色
        border: Border.all(color: Colors.red),
      ),
    );
  }
}