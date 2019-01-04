import 'dart:async';

import 'package:flutter/material.dart';

class DrawRect extends StatefulWidget {
  @override
  _DrawRectState createState() => _DrawRectState();
}

class _DrawRectState extends State<DrawRect> with SingleTickerProviderStateMixin {
  int num = 1;
  Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(milliseconds: 500), (timer) {
      setState(() {
        num++;
      });
      if (num > 9) {
        num = 1;
      }
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('画矩形、多边形'),
          elevation: 0.0,
        ),
        body: Stack(
          children: <Widget>[
            Center(
              child: Container(
                width: 180.0,
                height: 180.0,
                decoration: BoxDecoration(
                  color: Color(0x55000000),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            Center(
              child: Container(
                  width: 200.0,
                  height: 200.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            'assets/images/voice.png',
                          ),
                          Container(
                            width: 50.0,
                            height: 100.0,
                            child: CustomPaint(
                              painter: PaintVolume(num: num),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 8.0),
                        child: Text(
                          '手指上滑，取消发送',
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  )),
            ),
          ],
        ));
  }
}

class PaintVolume extends CustomPainter {
  final int num; // 显示条数
  PaintVolume({this.num}) : assert(num != null);

  @override
  void paint(Canvas canvas, Size size) {
    // 绘制代码
    var paint = Paint();
    paint.color = Colors.white;
    paint.isAntiAlias = true;
    paint.style = PaintingStyle.fill;

    for (int i = 0; i < num; i++) {
      canvas.drawRect(Rect.fromLTWH(0.0, 88.0 - i * 10, 14.0 + i * 2, 7.0), paint);
      canvas.drawPath(
          Path()
            ..addPolygon([
              Offset(16.0 + i * 2, 88.0 - i * 10),
              Offset(14.0 + i * 2, 88.0 - i * 10),
              Offset(14.0 + i * 2, 95.0 - i * 10),
            ], true),
          paint);
    }
  }

  @override
  bool shouldRepaint(PaintVolume oldDelegate) => true;
}
