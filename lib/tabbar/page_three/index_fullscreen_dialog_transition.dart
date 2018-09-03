import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class IndexFullscreenDialogTransition extends StatefulWidget {
  @override
  _IndexFullscreenDialogTransitionState createState() => _IndexFullscreenDialogTransitionState();
}

class _IndexFullscreenDialogTransitionState extends State<IndexFullscreenDialogTransition> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('全屏对话框'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Center(
        child: Text('暂无'),
      ),
    );
  }
}
