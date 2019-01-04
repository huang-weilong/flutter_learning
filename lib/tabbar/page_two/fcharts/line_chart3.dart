import 'package:flutter/material.dart';

import 'package:fcharts/fcharts.dart';

class LineChart3 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('line chart 3'),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[ChartView(charts: null)],
      ),
    );
  }
}
