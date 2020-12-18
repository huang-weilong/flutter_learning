import 'dart:math';

import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import 'widgets/flutter_line_chart.dart';

class LineExample extends StatefulWidget {
  @override
  _LineExampleState createState() => _LineExampleState();
}

class _LineExampleState extends State<LineExample> {
  List<charts.Series<LinearModel, String>> chartData1 = [];
  List<charts.Series<LinearModel, String>> chartData2 = [];
  List<charts.Series<LinearModel, String>> chartData3 = [];
  List<charts.Series<LinearModel, String>> chartData4 = [];
  List dataX = [
    {'year': '2014年'},
    {'year': '2015年'},
    {'year': '2016年'},
    {'year': '2017年'},
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    List<LinearModel> _dataModel1 = [];
    List<LinearModel> _dataModel2 = [];
    List<LinearModel> _dataModel3 = [];
    List<LinearModel> _dataModel4 = [];
    final random = Random();
    dataX.forEach((element) {
      _dataModel1.add(LinearModel(element['year'], random.nextInt(200)));
    });
    dataX.forEach((element) {
      _dataModel2.add(LinearModel(element['year'], random.nextInt(200)));
    });
    // dataX.forEach((element) {
    //   _dataModel3.add(LinearModel(element['year'], random.nextInt(200)));
    //   _dataModel4.add(LinearModel(element['year'], random.nextInt(200)));
    // });

    chartData1 = [
      charts.Series<LinearModel, String>(
        id: 'A',
        // 填充的颜色
        // fillColorFn: (LinearModel sales, _) => charts.Color.fromHex(code: '#ffa0ee'),
        // fillColorFn: (LinearModel sales, _) => charts.MaterialPalette.transparent,
        // 有选中效果的颜色
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (LinearModel sales, _) => sales.xAxis,
        measureFn: (LinearModel sales, _) => sales.value,
        data: _dataModel1,
        // 设置标签访问器以控制条形标签的文本。能够在柱状图显示数值
        // labelAccessorFn: (LinearModel sales, _) => '${sales.value.toString()}',
      ),
      charts.Series<LinearModel, String>(
        id: 'B',
        // 填充的颜色
        // fillColorFn: (LinearModel sales, _) => charts.Color.fromHex(code: '#ffa0ee'),
        // fillColorFn: (LinearModel sales, _) => charts.MaterialPalette.transparent,
        // 有选中效果的颜色
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        domainFn: (LinearModel sales, _) => sales.xAxis,
        measureFn: (LinearModel sales, _) => sales.value,
        data: _dataModel2,
        // 设置标签访问器以控制条形标签的文本。能够在柱状图显示数值
        // labelAccessorFn: (LinearModel sales, _) => '${sales.value.toString()}',
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('折线图例子'),
        elevation: 0.0,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        children: [
          FlutterLineChart(chartData1, showLegend: true),
        ],
      ),
    );
  }
}
