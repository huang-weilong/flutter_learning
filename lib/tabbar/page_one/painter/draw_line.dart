import 'package:flutter/material.dart';

class DrawLine extends StatefulWidget {
  @override
  _DrawLineState createState() => _DrawLineState();
}

class _DrawLineState extends State<DrawLine> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('画线'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: AspectRatio(
        aspectRatio: 1.0,
        child: CustomPaint(
          painter: PainterClass(),
        ),
      ),
    );
  }
}

class PainterClass extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // 绘制代码
    var paint = Paint();
    paint.color = Colors.red;
    paint.isAntiAlias = true;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 1.0;

    // L
    canvas.drawLine(Offset(50.0, 100.0), Offset(50.0, 200.0), paint);
    canvas.drawLine(Offset(50.0, 200.0), Offset(90.0, 200.0), paint);
    // O
    canvas.drawLine(Offset(100.0, 100.0), Offset(100.0, 200.0), paint);
    canvas.drawLine(Offset(100.0, 200.0), Offset(140.0, 200.0), paint);
    canvas.drawLine(Offset(140.0, 200.0), Offset(140.0, 100.0), paint);
    canvas.drawLine(Offset(140.0, 100.0), Offset(100.0, 100.0), paint);
    // N
    canvas.drawLine(Offset(150.0, 100.0), Offset(150.0, 200.0), paint);
    canvas.drawLine(Offset(150.0, 100.0), Offset(190.0, 200.0), paint);
    canvas.drawLine(Offset(190.0, 200.0), Offset(190.0, 100.0), paint);
    // G
    canvas.drawLine(Offset(200.0, 100.0), Offset(200.0, 150.0), paint);
    canvas.drawLine(Offset(200.0, 100.0), Offset(240.0, 100.0), paint);
    canvas.drawLine(Offset(240.0, 100.0), Offset(240.0, 200.0), paint);
    canvas.drawLine(Offset(240.0, 150.0), Offset(200.0, 150.0), paint);
    canvas.drawLine(Offset(240.0, 200.0), Offset(200.0, 200.0), paint);
  }

  @override
  bool shouldRepaint(PainterClass oldDelegate) => false;
}
