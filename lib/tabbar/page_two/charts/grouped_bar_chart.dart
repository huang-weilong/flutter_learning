import 'dart:math';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class GroupedBarChart extends StatefulWidget {
  @override
  _GroupedBarChartState createState() => _GroupedBarChartState();
}

class _GroupedBarChartState extends State<GroupedBarChart> {
  List<charts.Series> seriesList;
  bool animate;

  @override
  void initState() {
    super.initState();
    seriesList = _createRandomData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('自定义横坐标'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Container(
        height: 200.0,
        child: charts.BarChart(
          seriesList,
          animate: animate,
          behaviors: [
            // 添加滑动视口行为以使视口中心位于当前选中的域。
            charts.SlidingViewport(),
            // 平移和缩放行为有助于演示滑动视口允许调整视口中可见数据的行为动态。
            charts.PanAndZoomBehavior(),
          ],
          // 显示‘上海’，显示3组
          domainAxis: charts.OrdinalAxisSpec(viewport: charts.OrdinalViewport('上海', 3)),
          barGroupingType: charts.BarGroupingType.grouped,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () {
          setState(() {
            seriesList = _createRandomData();
          });
        },
      ),
    );
  }

  List<charts.Series<OrdinalSales, String>> _createRandomData() {
    final random = Random();

    final desktopSalesData = [
      OrdinalSales('北京', random.nextInt(100)),
      OrdinalSales('上海', random.nextInt(100)),
      OrdinalSales('广州', random.nextInt(100)),
      OrdinalSales('深圳', random.nextInt(100)),
    ];

    final tableSalesData = [
      OrdinalSales('北京', random.nextInt(100)),
      OrdinalSales('上海', random.nextInt(100)),
      OrdinalSales('广州', random.nextInt(100)),
      OrdinalSales('深圳', random.nextInt(100)),
    ];

    final mobileSalesData = [
      OrdinalSales('北京', random.nextInt(100)),
      OrdinalSales('上海', random.nextInt(100)),
      OrdinalSales('广州', random.nextInt(100)),
      OrdinalSales('深圳', random.nextInt(100)),
    ];

    return [
      charts.Series<OrdinalSales, String>(
        id: 'Desktop',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: desktopSalesData,
        fillColorFn: (OrdinalSales sales, _) => charts.Color.fromHex(code: '#ffa0ee'),
      ),
      charts.Series<OrdinalSales, String>(
        id: 'Tablet',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        fillColorFn: (OrdinalSales sales, _) => charts.ColorUtil.fromDartColor(Color(0xffe3e3a1)),
        data: tableSalesData,
      ),
      charts.Series<OrdinalSales, String>(
        id: 'Mobile',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        fillColorFn: (OrdinalSales sales, _) => charts.Color.fromHex(code: '#aa113a'),
        data: mobileSalesData,
      ),
    ];
  }
}

/// Sample ordinal data type.
class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}
