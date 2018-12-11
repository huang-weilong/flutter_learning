import 'package:flutter/material.dart';

class Test4 extends StatefulWidget {
  @override
  _Test4State createState() => _Test4State();
}

class _Test4State extends State<Test4> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('test4'),
        elevation: 0.0,
      ),
      body: Center(
        child: Text('暂无测试内容'),
      ),
    );
  }
}
