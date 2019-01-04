import 'package:flutter/material.dart';

import 'package:fcharts/fcharts.dart';

class Model {
  const Model(this.name, this.size);

  final String name;
  final int size;
}

const data = [
  const Model('03:00', 2),
  const Model('06:00', 8),
  const Model('09:00', 1),
  const Model('12:00', 9),
  const Model('15:00', 6),
  const Model('18:00', 2),
  const Model('21:00', 8),
  const Model('24:00', 2),
];

class LineChart1 extends StatelessWidget {
  final xAxis = new ChartAxis<String>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('折线图'),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(0.0),
            child: AspectRatio(
              aspectRatio: 4 / 3,
              child: LineChart(
                // 图例位置
                legendPosition: ChartPosition.top,
                lines: [
                  Line<Model, String, int>(
                    data: data,
                    // x轴坐标
                    xFn: (d) => d.name,
                    // y轴坐标
                    yFn: (d) => d.size,
                    // x轴
                    xAxis: ChartAxis(paint: PaintOptions.fill(color: Colors.blue)),
                    // y轴
                    yAxis: ChartAxis(
                      span: IntSpan(0, 12),
                      opposite: false,
                      tickGenerator: IntervalTickGenerator.byN(2),
                      // y轴颜色
                      paint: PaintOptions.stroke(color: Colors.red),
                      // y轴坐标样式
                      tickLabelerStyle: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                    ),
                    // 坐标点样式
                    marker: MarkerOptions(
                      paint: PaintOptions.fill(color: Colors.green),
                      shape: MarkerShapes.circle,
                      size: 4.0,
                    ),
                    // 线条样式
                    stroke: PaintOptions.stroke(color: Colors.lightBlue),
                    // 图例
                    legend: LegendItem(
                      paint: PaintOptions.fill(color: Colors.green),
                      text: 'description',
                      textStyle: TextStyle(color: Colors.green),
                    ),
                    // 曲线
                    curve: LineCurves.cardinalSpline,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
