import 'package:flutter/material.dart';

import '../../widget/bar_chart.dart';

class BarChartExample extends StatefulWidget {
  @override
  _BarChartExampleState createState() => _BarChartExampleState();
}

class _BarChartExampleState extends State<BarChartExample> {
  List<List<Map>> data;
  List<Map<String, double>> yRange;
  List<List<String>> xAxis;

  @override
  void initState() {
    super.initState();
    data = [
      [
        {'normal': 2.0, 'abnormal': 0.0, 'offline': 0.0},
        {'normal': 2.0, 'abnormal': 0.0, 'offline': 0.0},
        {'normal': 1.0, 'abnormal': 0.0, 'offline': 0.0},
        {'normal': 1.0, 'abnormal': 0.0, 'offline': 0.0},
      ],
    ];

    yRange = [
      {'min': 0.0, 'max': 12.0}
    ];
    xAxis = [
      ['北京', '上海', '广州', '深圳'],
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('柱状图'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Container(
        margin: EdgeInsets.only(top: 20.0),
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        height: 220.0,
        child: CustomPaint(
          painter: BarChart(data: data[0], yRange: yRange, xAxis: xAxis[0], context: context, horizontalPadding: 10.0),
        ),
      ),
    );
  }
}
