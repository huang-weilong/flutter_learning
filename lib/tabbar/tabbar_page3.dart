import 'package:flutter/material.dart';

class TabbarPage3 extends StatefulWidget {
  @override
  _TabbarPage3State createState() => _TabbarPage3State();
}

class _TabbarPage3State extends State<TabbarPage3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //Appbar左侧的widget
        leading: Icon(Icons.chevron_left),
        title: Text('我是Appbar'),
        centerTitle: true,//title居中
        //AppBar右侧的widget
        actions: <Widget>[
          IconButton(icon: Icon(Icons.more_horiz), onPressed: (){})
        ],
      ),
      body: Center(
        child: Text('我是tabbar3的页面'),
      ),
    );
  }
}
