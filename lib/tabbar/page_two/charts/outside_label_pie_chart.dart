import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'dart:math';

class OutsideLabelPieChart extends StatefulWidget {
  @override
  _OutsideLabelPieChartState createState() => _OutsideLabelPieChartState();
}

class _OutsideLabelPieChartState extends State<OutsideLabelPieChart> {
  List<charts.Series> seriesList = List();
  bool animate = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    seriesList = _createSampleData();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('描述在图外的饼状图'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Center(
        child: SizedBox(
          height: 180.0,
          child: charts.PieChart(seriesList,
              animate: animate,
              // Add an [ArcLabelDecorator] configured to render labels outside of the
              // arc with a leader line.
              //
              // Text style for inside / outside can be controlled independently by
              // setting [insideLabelStyleSpec] and [outsideLabelStyleSpec].
              //
              // Example configuring different styles for inside/outside:
              //       charts.ArcLabelDecorator(
              //          insideLabelStyleSpec: charts.TextStyleSpec(...),
              //          outsideLabelStyleSpec: charts.TextStyleSpec(...)),
              defaultRenderer: charts.ArcRendererConfig(arcRendererDecorators: [
                charts.ArcLabelDecorator(
                    labelPosition: charts.ArcLabelPosition.outside)
              ])),
        ),
      ),
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
  static List<charts.Series<LinearSales, int>> _createSampleData() {
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
        // Set a label accessor to control the text of the arc label.
        labelAccessorFn: (LinearSales row, _) => '${row.year}: ${row.sales}',
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
        labelAccessorFn: (LinearSales row, _) => '${row.year}: ${row.sales}',
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