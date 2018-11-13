import 'package:flutter/material.dart';

import 'package:charts_flutter/flutter.dart' as charts;

class DonutPieChart extends StatefulWidget {
  @override
  _DonutPieChartState createState() => _DonutPieChartState();
}

class _DonutPieChartState extends State<DonutPieChart> {
  List<charts.Series> seriesList = List();
  bool animate = true;

  @override
  void initState() {
    super.initState();
    seriesList = _createSampleData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('甜甜圈饼图'),
          centerTitle: true,
          elevation: 0.0,
        ),
        body: charts.PieChart(seriesList, animate: animate, defaultRenderer: charts.ArcRendererConfig(arcWidth: 60)));
  }

  List<charts.Series<LinearSales, int>> _createSampleData() {
    final data = [
      LinearSales(0, 100),
      LinearSales(1, 75),
      LinearSales(2, 25),
      LinearSales(3, 5),
    ];

    return [
      charts.Series<LinearSales, int>(
        id: 'Sales',
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }
}

class LinearSales {
  final int year;
  final int sales;

  LinearSales(this.year, this.sales);
}
