import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:async';
import 'tabbar/index_page.dart';
import 'tabbar/page_one/index_button_page.dart';
import 'package:flutter/cupertino.dart';

class UseAlbum extends StatefulWidget {
  @override
  _UseAlbumState createState() => _UseAlbumState();
}

class _UseAlbumState extends State<UseAlbum> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('dsa'),
      ),
      body: AnimatedContainer(
        duration: Duration(seconds: 20),
        child: Text('dadsa'),
      ),
    );

  }


  }


class TestPaint extends CustomPainter {
TestPaint();
  @override
  void paint(Canvas canvas, Size offset) {
//    final Canvas canvas = context.canvas;

//    paintRadialReaction(canvas, offset, const Offset(kRadialReactionRadius, kRadialReactionRadius));

//    final Offset center = (offset & size).center;
//    final Color radioColor = onChanged != null ? Colors.green : Colors.red;

    // Outer circle
    final Paint paint = new Paint()
      ..color = Color.lerp(Colors.green, Colors.red, 20.0)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;
    canvas.drawCircle(Offset(20.0, 20.0), 10.0, paint);

    // Inner circle
//    if (!position.isDismissed) {
//      paint.style = PaintingStyle.fill;
//      canvas.drawCircle(center, _kInnerRadius * position.value, paint);
//    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}