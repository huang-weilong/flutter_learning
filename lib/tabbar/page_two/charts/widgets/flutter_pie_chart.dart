import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:charts_common/common.dart' as common;

class FlutterPieChart extends StatefulWidget {
  FlutterPieChart(
    this.data, {
    this.height: 200.0,
    this.animate: true,
    this.arcWidth: 10000,
    this.showLabel: true,
    this.showLegend: false,
    this.legendPosition: charts.BehaviorPosition.top,
    this.legendCellPadding: const EdgeInsets.only(right: 4.0, bottom: 4.0),
  });

  final bool animate;
  final List<charts.Series<dynamic, String>> data;
  final double height;
  final int arcWidth;
  final bool showLabel;
  // 显示图例
  final bool showLegend;
  // 图例位置
  final charts.BehaviorPosition legendPosition;
  // 图例间距
  final EdgeInsets legendCellPadding;

  @override
  _FlutterPieChartState createState() => _FlutterPieChartState();
}

class _FlutterPieChartState extends State<FlutterPieChart> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: charts.PieChart(
        widget.data,
        defaultRenderer: charts.ArcRendererConfig(
          // 甜甜圈饼图
          arcWidth: widget.arcWidth,
          arcRendererDecorators: [
            // 标签位置
            if (widget.showLabel) charts.ArcLabelDecorator(labelPosition: charts.ArcLabelPosition.auto),
          ],
        ),
        behaviors: [
          // 图例
          if (widget.showLegend)
            charts.DatumLegend(
              position: widget.legendPosition,
              horizontalFirst: true,
              // desiredMaxRows: 2,
              desiredMaxColumns: 2,
              cellPadding: widget.legendCellPadding,
              // 在图例文本后面显示相应的数值
              // showMeasures: true,
              // legendDefaultMeasure: charts.LegendDefaultMeasure.firstValue,
              // measureFormatter: (num value) {
              //   return value == null ? '-' : '${value}k';
              // },
            ),
        ],
      ),
    );
  }
}
