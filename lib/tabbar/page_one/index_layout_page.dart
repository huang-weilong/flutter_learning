import 'package:flutter/material.dart';

class IndexLayoutPage extends StatefulWidget {
  @override
  _IndexLayoutPageState createState() => _IndexLayoutPageState();
}

class _IndexLayoutPageState extends State<IndexLayoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('布局'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('暂无更新'),
      ),
    );
  }
}
