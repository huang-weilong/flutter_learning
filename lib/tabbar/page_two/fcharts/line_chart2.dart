import 'package:flutter/material.dart';

import 'package:fcharts/fcharts.dart';

class Model {
  const Model(this.name, this.size);

  final String name;
  final int size;
}

const data = [
  2.0,
  4.0,
  5.0,
  1.0,
  8.0,
  3.0,
  1.0,
  5.0,
];
const data2 = [
  5.0,
  1.0,
  7.0,
  2.0,
  8.0,
  5.0,
  7.0,
  2.0,
];

class LineChart2 extends StatelessWidget {
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
            padding: EdgeInsets.all(8.0),
            child: AspectRatio(
              aspectRatio: 4.0,
              child: LineChart(
                // 图例位置
                legendPosition: ChartPosition.top,
                lines: [
                  Sparkline(
                    data: data,
                    // 坐标点样式
                    marker: MarkerOptions(
                      paint: PaintOptions.fill(color: Colors.green),
                      shape: MarkerShapes.circle,
                      size: 4.0,
                    ),
                    // 线条样式
                    stroke: PaintOptions.stroke(color: Colors.lightBlue),
                    // 曲线
                    curve: LineCurves.cardinalSpline,
                  ),
                  Sparkline(
                    data: data2,
                    // 坐标点样式
                    marker: MarkerOptions(
                      paint: PaintOptions.fill(color: Colors.blue),
                      shape: MarkerShapes.circle,
                      size: 4.0,
                    ),
                    // 线条样式
                    stroke: PaintOptions.stroke(color: Colors.deepPurple),
                    // 曲线
                    curve: LineCurves.cardinalSpline,
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text('03:00'),
              Text('06:00'),
              Text('09:00'),
              Text('12:00'),
              Text('15:00'),
              Text('18:00'),
              Text('21:00'),
              Text('24:00'),
            ],
          )
        ],
      ),
    );
  }
}
