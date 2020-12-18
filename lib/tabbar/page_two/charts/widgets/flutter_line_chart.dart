import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:charts_common/common.dart' as common;

class FlutterLineChart extends StatefulWidget {
  FlutterLineChart(
    this.seriesList, {
    this.animate: true,
    this.height: 200.0,
  });

  final List<charts.Series> seriesList;
  final bool animate;
  final double height;

  @override
  _FlutterLineChartState createState() => _FlutterLineChartState();
}

class _FlutterLineChartState extends State<FlutterLineChart> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: charts.OrdinalComboChart(
        widget.seriesList,
        animate: widget.animate,
        defaultRenderer: charts.LineRendererConfig(),
        behaviors: [
          charts.PanAndZoomBehavior(),
          // 选择线突出显示
          charts.LinePointHighlighter(
            showHorizontalFollowLine: charts.LinePointHighlighterFollowLineType.none,
            showVerticalFollowLine: charts.LinePointHighlighterFollowLineType.nearest,
            // 突出显示自定义形状
            // symbolRenderer: charts.RectSymbolRenderer(isSolid: false),
          ),
        ],
      ),
    );
  }
}

class LinearModel {
  final String xAxis;
  final int value;

  LinearModel(this.xAxis, this.value);
}
