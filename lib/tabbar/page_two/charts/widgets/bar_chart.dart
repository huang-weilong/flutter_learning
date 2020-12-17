import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:charts_common/common.dart' as common;

class FlutterBarChart extends StatefulWidget {
  FlutterBarChart(
    this.data, {
    this.height: 200.0,
    this.animate: true,
    this.barGroupingType: common.BarGroupingType.stacked,
    this.barRendererDecorator,
    this.strokeWidthPx: 0.0,
    this.cornerStrategy: 1,
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
    this.defaultHiddenSeries,
    this.legendIcon,
    this.panAndZoomBehavior: false,
  });

  final double height;
  final bool animate;
  final List<charts.Series<DataModel, String>> data;
  // 柱状图类型（堆叠、分组、分组堆叠）
  final common.BarGroupingType barGroupingType;
  // 柱状图内显示数据
  // 可赋值 charts.BarLabelDecorator<String>()
  final common.BarRendererDecorator barRendererDecorator;
  // border大小
  final double strokeWidthPx;
  // 顶部圆角
  final int cornerStrategy;
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
  // 是否允许缩放平移
  final bool panAndZoomBehavior;

  @override
  _FlutterBarChartState createState() => _FlutterBarChartState();
}

class _FlutterBarChartState extends State<FlutterBarChart> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: charts.BarChart(
        widget.data,
        animate: widget.animate,
        defaultRenderer: charts.BarRendererConfig(
          // 柱状图内显示数据
          barRendererDecorator: widget.barRendererDecorator,
          groupingType: widget.barGroupingType,
          // 显示border边框线，0不显示
          strokeWidthPx: widget.strokeWidthPx,
          cornerStrategy: charts.ConstCornerStrategy(widget.cornerStrategy),
          // 自定义图例图标
          symbolRenderer: widget.legendIcon == null ? null : IconRenderer(widget.legendIcon),
        ),
        // 初始视图及显示的数据大小
        // domainAxis: charts.OrdinalAxisSpec(viewport: charts.OrdinalViewport('xAxisName', 20)),
        behaviors: [
          // 图例
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
          // 初始显示Measures
          // charts.InitialSelection(
          //   selectedDataConfig: [
          //     charts.SeriesDatumConfig('A', '2016年'),
          //     charts.SeriesDatumConfig('B', '2016年'),
          //   ],
          // ),
          // 可缩放平移视图
          if (widget.panAndZoomBehavior) charts.PanAndZoomBehavior(),
        ],
      ),
    );
  }
}

class DataModel {
  final String xAxis;
  final int value;

  DataModel(this.xAxis, this.value);
}

class IconRenderer extends charts.CustomSymbolRenderer {
  final IconData iconData;

  IconRenderer(this.iconData);

  @override
  Widget build(BuildContext context, {Size size, Color color, bool enabled}) {
    // Lighten the color if the symbol is not enabled
    // Example: If user has tapped on a Series deselecting it.
    if (!enabled) {
      color = color.withOpacity(0.26);
    }
    return SizedBox.fromSize(size: size, child: Icon(iconData, color: color, size: 12.0));
  }
}
