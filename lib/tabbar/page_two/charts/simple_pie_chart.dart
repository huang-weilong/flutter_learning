import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'dart:math';

class SimplePieChart extends StatefulWidget {
  @override
  _SimplePieChartState createState() => _SimplePieChartState();
}

class _SimplePieChartState extends State<SimplePieChart> {
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
        title: Text('简单的饼状图'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: charts.PieChart(seriesList, animate: animate),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: (){
          setState(() {
            seriesList = _createRandomData();
          });
        },
      ),
    );
  }

  /// Create one series with sample hard coded data.
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

  List<charts.Series<LinearSales, int>> _createRandomData() {
    final random = Random();

    final data = [
      LinearSales(0, random.nextInt(100)),
      LinearSales(1, random.nextInt(100)),
      LinearSales(2, random.nextInt(100)),
      LinearSales(3, random.nextInt(100)),
    ];

    return [
      charts.Series<LinearSales, int>(
        id: 'Sales',
//        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }
}

/// Sample linear data type.
class LinearSales {
  final int year;
  final int sales;

  LinearSales(this.year, this.sales);
}
