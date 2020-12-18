import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_learning/tabbar/page_two/charts/widgets/flutter_bar_chart.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class BarChartExample extends StatefulWidget {
  @override
  _BarChartExampleState createState() => _BarChartExampleState();
}

class _BarChartExampleState extends State<BarChartExample> {
  List<charts.Series<DataModel, String>> chartData1 = [];
  List<charts.Series<DataModel, String>> chartData2 = [];
  List<charts.Series<DataModel, String>> chartData3 = [];
  List<charts.Series<DataModel, String>> chartData4 = [];
  List data1 = [
    {'year': '2014年', 'value': 100},
    {'year': '2015年', 'value': 130},
    {'year': '2016年', 'value': 90},
    {'year': '2017年', 'value': 200},
  ];
  List data2 = [
    {'year': '2014年', 'value': 120},
    {'year': '2015年', 'value': 170},
    {'year': '2016年', 'value': 40},
    {'year': '2017年', 'value': 320},
  ];
  List data3 = [
    {'year': '2014年', 'value': 77},
    {'year': '2015年', 'value': 120},
    {'year': '2016年', 'value': 240},
    {'year': '2017年', 'value': 140},
  ];
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
    List<DataModel> _dataModel1 = [];
    List<DataModel> _dataModel2 = [];
    List<DataModel> _dataModel3 = [];
    List<DataModel> _dataModel4 = [];
    final random = Random();
    data1.forEach((element) {
      _dataModel1.add(DataModel(element['year'].toString(), element['value']));
    });
    data2.forEach((element) {
      _dataModel2.add(DataModel(element['year'].toString(), element['value']));
    });
    dataX.forEach((element) {
      _dataModel3.add(DataModel(element['year'].toString(), random.nextInt(200)));
      _dataModel4.add(DataModel(element['year'].toString(), random.nextInt(200)));
    });

    chartData1 = [
      charts.Series<DataModel, String>(
        id: 'A',
        // 填充的颜色
        // fillColorFn: (DataModel sales, _) => charts.Color.fromHex(code: '#ffa0ee'),
        // fillColorFn: (DataModel sales, _) => charts.MaterialPalette.transparent,
        // 有选中效果的颜色
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (DataModel sales, _) => sales.xAxis,
        measureFn: (DataModel sales, _) => sales.value,
        data: _dataModel1,
        // 设置标签访问器以控制条形标签的文本。能够在柱状图显示数值
        labelAccessorFn: (DataModel sales, _) => '${sales.value.toString()}',
      )
    ];
    chartData3 = [
      charts.Series<DataModel, String>(
        id: 'A',
        // 填充的颜色
        // fillColorFn: (DataModel sales, _) => charts.Color.fromHex(code: '#ffa0ee'),
        // fillColorFn: (DataModel sales, _) => charts.MaterialPalette.transparent,
        // 有选中效果的颜色
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (DataModel sales, _) => sales.xAxis,
        measureFn: (DataModel sales, _) => sales.value,
        data: _dataModel1,
        // 柱状图斜纹样式
        fillPatternFn: (DataModel sales, _) => charts.FillPatternType.forwardHatch,
      )
    ];
    chartData2 = [
      charts.Series<DataModel, String>(
        id: 'A',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (DataModel sales, _) => sales.xAxis,
        measureFn: (DataModel sales, _) => sales.value,
        data: _dataModel1,
      ),
      charts.Series<DataModel, String>(
        id: 'B',
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        domainFn: (DataModel sales, _) => sales.xAxis,
        measureFn: (DataModel sales, _) => sales.value,
        data: _dataModel2,
      )
      // ..setAttribute(charts.rendererIdKey, 'customLine')
      // customSeriesRenderers: [
      //   charts.LineRendererConfig(customRendererId: 'customLine'),
      // ],
    ];

    chartData4 = [
      charts.Series<DataModel, String>(
        id: 'A',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (DataModel sales, _) => sales.xAxis,
        measureFn: (DataModel sales, _) => sales.value,
        data: _dataModel1,
      ),
      charts.Series<DataModel, String>(
        id: 'B',
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        domainFn: (DataModel sales, _) => sales.xAxis,
        measureFn: (DataModel sales, _) => sales.value,
        data: _dataModel2,
      ),
      charts.Series<DataModel, String>(
        id: 'C',
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
        domainFn: (DataModel sales, _) => sales.xAxis,
        measureFn: (DataModel sales, _) => sales.value,
        data: _dataModel3,
      ),
      charts.Series<DataModel, String>(
        id: 'D',
        colorFn: (_, __) => charts.MaterialPalette.indigo.shadeDefault,
        domainFn: (DataModel sales, _) => sales.xAxis,
        measureFn: (DataModel sales, _) => sales.value,
        data: _dataModel4,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('柱状图例子'),
        elevation: 0.0,
      ),
      body: ListView(
        children: [
          FlutterBarChart(chartData1, barRendererDecorator: charts.BarLabelDecorator<String>()),
          FlutterBarChart(chartData3, strokeWidthPx: 0.0),
          FlutterBarChart(chartData2, barGroupingType: charts.BarGroupingType.grouped, showLegend: true),
          FlutterBarChart(chartData2, barGroupingType: charts.BarGroupingType.stacked),
          FlutterBarChart(chartData4, barGroupingType: charts.BarGroupingType.stacked, showLegend: true),
        ],
      ),
    );
  }
}
