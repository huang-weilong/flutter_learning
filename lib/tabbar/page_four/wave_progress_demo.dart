import 'package:flutter/material.dart';

import '../../widget/wave_progress.dart';

class WaveProgressDemo extends StatefulWidget {
  @override
  _WaveProgressDemoState createState() => _WaveProgressDemoState();
}

class _WaveProgressDemoState extends State<WaveProgressDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('波浪进度条'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Container(
        width: 200.0,
        height: 200.0,
        child: WaveProgress(
          percent: 0.8,
          primaryColor: Colors.blue,
          secondaryColor: Colors.grey,
        ),
      ),
    );
  }
}
