import 'package:flutter/material.dart';

import '../../widget/circle_progress.dart';

class CircleProgressDemo extends StatefulWidget {
  @override
  _CircleProgressDemoState createState() => _CircleProgressDemoState();
}

class _CircleProgressDemoState extends State<CircleProgressDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('圆形进度条'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ListView(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 2.0,
            child: CircleProgress(
              progress: 0.75,
              primaryColor: Colors.blue,
              secondaryColor: Colors.black12,
            ),
          )
        ],
      ),
    );
  }
}
