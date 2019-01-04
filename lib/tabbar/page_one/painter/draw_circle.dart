import 'package:flutter/material.dart';
import 'dart:math' as math;

class DrawCircle extends StatefulWidget {
  @override
  _DrawCircleState createState() => _DrawCircleState();
}

class _DrawCircleState extends State<DrawCircle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('画圆、画弧'),
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
    final center = Offset(size.width / 2, size.height / 2);
    final rect = Rect.fromCircle(center: center, radius: 100.0);

    final paint1 = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5.0
      ..strokeCap = StrokeCap.round
      ..color = Colors.red;

    final paint2 = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0;

    final paint3 = Paint()
      ..color = Colors.orange
      ..style = PaintingStyle.fill;

    final paint4 = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.green.withOpacity(0.8);

    Path path = Path();
    path.arcTo(rect, -math.pi / 2, 2 * math.pi * 0.4, false);
    canvas.drawPath(path, paint1);

    Path path2 = Path()..arcTo(rect, 7.0, 3.0, false);
    canvas.drawPath(path2, paint4);

    canvas.drawCircle(center, 10.0, paint2);
    canvas.drawCircle(center, 30.0, paint2);
    canvas.drawCircle(center, 50.0, paint2);

    canvas.drawCircle(Offset(100.0, 100.0), 60.0, paint3);

//    color：画笔颜色
//    style：绘制模式，画线 or 充满
//    maskFilter：绘制完成，还没有被混合到布局上时，添加的遮罩效果，比如blur效果
//    strokeWidth：线条宽度
//    strokeCap：线条结束时的绘制样式
//    shader：着色器，一般用来绘制渐变效果或ImageShader

    // 绘制弧线
//    canvas.drawArc(rect, startAngle, sweepAngle, useCenter, paint);
    // 绘制图片
//    canvas.drawImage(image, p, paint);
    // 绘制圆
//    canvas.drawCircle(c, radius, paint);
    // 绘制线条
//    canvas.drawLine(p1, p2, paint);
    // 绘制椭圆
//    canvas.drawOval(rect, paint);
    // 绘制文字
//    canvas.drawParagraph(paragraph, offset);
    // 绘制路径
//    canvas.drawPath(path, paint);
    // 绘制点
//    canvas.drawPoints(pointMode, points, paint);
    // 绘制Rect
//    canvas.drawRect(rect, paint);
    // 绘制阴影
//    canvas.drawShadow(path, color, elevation, transparentOccluder);
  }

  @override
  bool shouldRepaint(PainterClass oldDelegate) => false;
}
