import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'charts/simple_bar_chart.dart';
import 'charts/grouped_bar_chart.dart';
import 'charts/simple_pie_chart.dart';
import 'charts/outside_label_pie_chart.dart';
import 'charts/simple_line_chart.dart';
import 'charts/points_line_chart.dart';
import 'charts/stacked_bar_chart.dart';
import 'charts/grouped_stacked_bar_chart.dart';
import 'charts/donut_pie_chart.dart';
import 'charts/custom_xaxis_label.dart';
import 'charts/ordinal_combo_chart_page.dart';

class ChartsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('图表'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.insert_chart),
              title: Text('简单的柱状图'),
              onTap: () {
                Navigator.push(context, CupertinoPageRoute(builder: (_) => SimpleBarChart.withRandomData()));
              },
            ),
            ListTile(
              leading: Icon(Icons.insert_chart),
              title: Text('柱状组图'),
              onTap: () {
                Navigator.push(context, CupertinoPageRoute(builder: (_) => GroupedBarChart()));
              },
            ),
            ListTile(
              leading: Icon(Icons.insert_chart),
              title: Text('堆叠柱状图'),
              onTap: () {
                Navigator.push(context, CupertinoPageRoute(builder: (_) => StackedBarChart()));
              },
            ),
            ListTile(
              leading: Icon(Icons.insert_chart),
              title: Text('堆叠柱状组图'),
              onTap: () {
                Navigator.push(context, CupertinoPageRoute(builder: (_) => GroupedStackedBarChart()));
              },
            ),
            ListTile(
              leading: Icon(Icons.pie_chart),
              title: Text('简单的饼状图(颜色修改)'),
              onTap: () {
                Navigator.push(context, CupertinoPageRoute(builder: (_) => SimplePieChart()));
              },
            ),
            ListTile(
              leading: Icon(Icons.pie_chart),
              title: Text('描述在图外的饼状图'),
              onTap: () {
                Navigator.push(context, CupertinoPageRoute(builder: (_) => OutsideLabelPieChart()));
              },
            ),
            ListTile(
              leading: Icon(Icons.pie_chart),
              title: Text('甜甜圈饼状图'),
              onTap: () {
                Navigator.push(context, CupertinoPageRoute(builder: (_) => DonutPieChart()));
              },
            ),
            ListTile(
              leading: Icon(Icons.show_chart),
              title: Text('简单的折线图'),
              onTap: () {
                Navigator.push(context, CupertinoPageRoute(builder: (_) => SimpleLineChart()));
              },
            ),
            ListTile(
              leading: Icon(Icons.show_chart),
              title: Text('带点的折线图'),
              onTap: () {
                Navigator.push(context, CupertinoPageRoute(builder: (_) => PointsLineChart()));
              },
            ),
            ListTile(
              leading: Icon(Icons.show_chart),
              title: Text('带点的折线图string横坐标'),
              onTap: () {
                Navigator.push(context, CupertinoPageRoute(builder: (_) => OrdinalComboChartPage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.show_chart),
              title: Text('自定义横坐标'),
              onTap: () {
                Navigator.push(context, CupertinoPageRoute(builder: (_) => SlidingViewportOnSelection.withRandomData()));
              },
            )
          ],
        ),
      ),
    );
  }
}
