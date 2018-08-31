import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:async';
import 'tabbar/index_page.dart';
import 'tabbar/page_one/index_button_page.dart';

class UseAlbum extends StatefulWidget {
  @override
  _UseAlbumState createState() => _UseAlbumState();
}

class _UseAlbumState extends State<UseAlbum> {
  String s ='        ';
  List test =  [0];
  Map<String,int> a = {
    'test':0,
  };

  List<Widget> dd = [

  ];

  List<Widget> pp = [];
  File _images;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('test'),
      ),
      body: Row(
        children: [
        ]..addAll(pp),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          getImage(2);
        },
      ),
    );
  }

  Widget ggg(int d) {
    return Image.file(_images,width: 60.0,);
  }

  Future getImage(int index) async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _images = image;
      pp.add(ggg(3));
    });
  }



  Widget buildRadioItem(int value,int group,Map gg) {
    return Radio(value: 2, groupValue: group, onChanged: (value) {
      setState(() {
        a['test'] = value;
//        print(testGroup[0]);//1
        print(gg[0]);//2
      });
    });
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