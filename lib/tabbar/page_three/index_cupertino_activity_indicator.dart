import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class IndexCupertinoActivityIndicator extends StatefulWidget {
  @override
  _IndexCupertinoActivityIndicatorState createState() => _IndexCupertinoActivityIndicatorState();
}

class _IndexCupertinoActivityIndicatorState extends State<IndexCupertinoActivityIndicator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('loading动画'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Center(
        child: CupertinoActivityIndicator(),
      ),
    );
  }
}
