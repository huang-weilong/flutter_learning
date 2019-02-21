import 'package:flutter/material.dart';

import 'package:charts_flutter/flutter.dart' as charts;

class OrdinalComboChartPage extends StatefulWidget {
  @override
  _OrdinalComboChartPageState createState() => _OrdinalComboChartPageState();
}

class _OrdinalComboChartPageState extends State<OrdinalComboChartPage> {
  List<charts.Series> lineSeriesList = List();
  bool animate = true;

  @override
  void initState() {
    super.initState();
    lineSeriesList = _createLineData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('d'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: charts.OrdinalComboChart(
        lineSeriesList,
        animate: animate,
        behaviors: [charts.PanAndZoomBehavior()],
        defaultRenderer: charts.LineRendererConfig(includePoints: true),
      ),
    );
  }

  List<charts.Series<OrdinalSales, String>> _createLineData() {
    final data = [
      OrdinalSales('2015年', 10),
      OrdinalSales('2016年', 11),
      OrdinalSales('2017年', 12),
      OrdinalSales('2018年', 22),
      OrdinalSales('2019年', 10),
    ];

    return [
      new charts.Series<OrdinalSales, String>(
        id: 'waterInstall',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }
}

class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}
