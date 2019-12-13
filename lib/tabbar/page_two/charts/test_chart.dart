import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class TestChart extends StatefulWidget {
  @override
  _TestChartState createState() => _TestChartState();
}

class _TestChartState extends State<TestChart> {
  List<charts.Series> seriesList = List();

  @override
  void initState() {
    super.initState();
    seriesList = _createSampleData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: charts.LineChart(
//        _createChartData(), // 折线图的点的数据列表
        seriesList, // 折线图的点的数据列表
        animate: true, // 动画
        defaultRenderer: charts.LineRendererConfig(
          // 折线图绘制的配置
          includeArea: true,
          includePoints: true,
          includeLine: true,
          stacked: false,
        ),
        domainAxis: charts.NumericAxisSpec(
          // 主轴的配置
//          tickFormatterSpec: charts.DomainFormatter(widget.dateRange), // tick 值的格式化，这里把 num 转换成 String
          renderSpec: charts.SmallTickRendererSpec(
            // 主轴绘制的配置
            tickLengthPx: 0, // 刻度标识突出的长度
            labelOffsetFromAxisPx: 12, // 刻度文字距离轴线的位移
            labelStyle: charts.TextStyleSpec(
              // 刻度文字的样式
              color: charts.Color.fromHex(code: '#0000ff'),
              fontSize: 30,
            ),
            axisLineStyle: charts.LineStyleSpec(
              // 轴线的样式
              color: charts.Color.fromHex(code: '#00ffff'),
            ),
          ),
          tickProviderSpec: charts.BasicNumericTickProviderSpec(
            // 轴线刻度配置
            dataIsInWholeNumbers: false,
            desiredTickCount: 3, // 期望显示几个刻度
          ),
        ),
        primaryMeasureAxis: charts.NumericAxisSpec(
          // 交叉轴的配置，参数参考主轴配置
          showAxisLine: false, // 显示轴线
//          tickFormatterSpec: MeasureFormatterSpec(),
          tickProviderSpec: charts.BasicNumericTickProviderSpec(
            dataIsInWholeNumbers: false,
            desiredTickCount: 4,
          ),
          renderSpec: charts.GridlineRendererSpec(
            // 交叉轴刻度水平线
            tickLengthPx: 0,
            labelOffsetFromAxisPx: 12,
//            labelStyle: charts.TextStyleSpec(
//              color: ChartUtil.getChartColor(HColors.lightGrey),
//              fontSize: HFontSizes.smaller.toInt(),
//            ),
            lineStyle: charts.LineStyleSpec(
              color: charts.Color.fromHex(code: '#ff0000'),
            ),
            axisLineStyle: charts.LineStyleSpec(
              color: charts.Color.fromHex(code: '#0000ff'),
            ),
          ),
        ),
        selectionModels: [
          // 设置点击选中事件
          charts.SelectionModelConfig(
            type: charts.SelectionModelType.info,
//            listener: _onSelectionChanged,
          )
        ],
        behaviors: [
          charts.InitialSelection(selectedDataConfig: [
            // 设置默认选中
//            charts.SeriesDatumConfig<num>('LineChart', _index)
          ]),
        ],
      ),
    );
  }

  static List<charts.Series<LinearSales, int>> _createSampleData() {
    final data = [
      LinearSales(0, 5),
      LinearSales(1, 25),
      LinearSales(2, 100),
      LinearSales(3, 75),
    ];

    return [
      charts.Series<LinearSales, int>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
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
