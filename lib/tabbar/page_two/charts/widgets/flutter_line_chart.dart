import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:charts_common/common.dart' as common;

class FlutterLineChart extends StatefulWidget {
  FlutterLineChart(
    this.seriesList, {
    this.animate: true,
    this.height: 200.0,
    this.showLegend: false,
    this.legendPosition: charts.BehaviorPosition.top,
    this.legendHorizontalFirst: false,
    this.legendDesiredMaxRows: 2,
    this.legendCellPadding: const EdgeInsets.only(right: 4.0, bottom: 4.0),
    this.legendTextStyleSpec: const charts.TextStyleSpec(
      color: charts.Color.black,
      fontFamily: 'Georgia',
      fontSize: 11,
    ),
    this.legendIcon,
    this.defaultHiddenSeries,
  });

  final List<charts.Series> seriesList;
  final bool animate;
  final double height;
  // 显示图例
  final bool showLegend;
  // 图例位置
  final charts.BehaviorPosition legendPosition;
  // 图例的排布方式，水平优先排布
  final bool legendHorizontalFirst;
  // 图例增加到int个时才换行
  final int legendDesiredMaxRows;
  // 图例间距
  final EdgeInsets legendCellPadding;
  // 图例文字样式
  final charts.TextStyleSpec legendTextStyleSpec;
  // 默认隐藏的图例（和数据）
  final List<String> defaultHiddenSeries;
  // 图例图标
  final IconData legendIcon;

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
        defaultInteractions: true,
        defaultRenderer: charts.LineRendererConfig(),
        primaryMeasureAxis: charts.NumericAxisSpec(
            // renderSpec: charts.NoneRenderSpec(), // 不显示纵坐标
            // renderSpec: charts.GridlineRendererSpec(lineStyle: charts.LineStyleSpec(dashPattern: [4, 4])) // 网格虚线图案
            // showAxisLine: true, // 显示坐标轴
            ),
        domainAxis: charts.OrdinalAxisSpec(
            // viewport: charts.OrdinalViewport('xAxisName', 20), // 初始视口及显示的数据大小
            // showAxisLine: true,  // 显示坐标轴
            // renderSpec: charts.NoneRenderSpec(), // 不显示横坐标
            ),
        behaviors: [
          charts.PanAndZoomBehavior(),
          // 选择线突出显示
          charts.LinePointHighlighter(
            // 显示水平追随线
            showHorizontalFollowLine: charts.LinePointHighlighterFollowLineType.none,
            // 显示竖直追随线
            showVerticalFollowLine: charts.LinePointHighlighterFollowLineType.nearest,
            // 突出显示自定义形状
            // symbolRenderer: charts.RectSymbolRenderer(isSolid: false),
          ),
          if (widget.showLegend)
            charts.SeriesLegend(
              // 图例位置
              position: widget.legendPosition,
              // 图例对齐方式
              outsideJustification: charts.OutsideJustification.start,
              // 图例的排布方式，水平优先排布
              horizontalFirst: widget.legendHorizontalFirst,
              // 图例增加到2个时才换行
              desiredMaxRows: widget.legendDesiredMaxRows,
              cellPadding: widget.legendCellPadding,
              // 图例文字样式
              entryTextStyle: widget.legendTextStyleSpec,
              // 默认隐藏的图例（和数据）
              defaultHiddenSeries: widget.defaultHiddenSeries,
              // 在图例文本后面显示选中的数值
              // showMeasures: true,
              // 在图例文本后面显示选中的数值
              // measureFormatter: (num value) {
              //   return value == null ? '-' : '$value';
              // },
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
