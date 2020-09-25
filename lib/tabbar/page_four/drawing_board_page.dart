import 'package:flutter/material.dart';

class DrawingBoardPage extends StatefulWidget {
  @override
  _DrawingBoardPageState createState() => _DrawingBoardPageState();
}

class _DrawingBoardPageState extends State<DrawingBoardPage> {
  List<List<Offset>> _path = [];

//  记录用户滑动的路径。
//  根据滑动路径绘制。
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('画板'),
      ),
      body: Listener(
        onPointerDown: (PointerDownEvent pointerDownEvent) {
          setState(() {
            _path.add([pointerDownEvent.localPosition]);
          });
        },
        onPointerMove: (PointerMoveEvent pointerMoveEvent) {
          setState(() {
            _path[_path.length - 1].add(pointerMoveEvent.localPosition);
          });
        },
        onPointerUp: (PointerUpEvent pointerUpEvent) {
          setState(() {
            _path[_path.length - 1].add(pointerUpEvent.localPosition);
          });
        },
        onPointerCancel: (PointerCancelEvent pointerCancelEvent) {
          setState(() {
            _path[_path.length - 1].add(pointerCancelEvent.localPosition);
          });
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: CustomPaint(
            painter: DrawingBoardPainter(_path),
          ),
        ),
      ),
    );
  }
}

class DrawingBoardPainter extends CustomPainter {
  final List<List<Offset>> path;

  DrawingBoardPainter(this.path);

  Paint _paint = Paint()
    ..color = Colors.red
    ..style = PaintingStyle.stroke
    ..strokeWidth = 3;

  @override
  void paint(Canvas canvas, Size size) {
    path.forEach((list) {
      Path _path = Path();
      for (int i = 0; i < list.length; i++) {
        if (i == 0) {
          _path.moveTo(list[i].dx, list[i].dy);
        } else {
          _path.lineTo(list[i].dx, list[i].dy);
        }
      }
      canvas.drawPath(_path, _paint);
    });
  }

  @override
  bool shouldRepaint(DrawingBoardPainter oldDelegate) {
    return true;
  }
}
