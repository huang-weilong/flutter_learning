import 'package:flutter/material.dart';

class Test2 extends StatefulWidget {
  @override
  _Test2State createState() => _Test2State();
}

class _Test2State extends State<Test2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('test2'),
          elevation: 0.0,
        ),
        body: Center(
          child: Text('无'),
        ));
  }
}
