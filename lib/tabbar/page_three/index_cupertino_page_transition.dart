import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class IndexCupertinoPageTransition extends StatefulWidget {
  @override
  _IndexCupertinoPageTransitionState createState() => _IndexCupertinoPageTransitionState();
}

class _IndexCupertinoPageTransitionState extends State<IndexCupertinoPageTransition> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('过渡动画'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Center(
        child: Text('暂无'),
      )
    );
  }
}
