import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'dart:ui' as ui;

class QrFlutterPage extends StatefulWidget {
  @override
  _QrFlutterPageState createState() => _QrFlutterPageState();
}

class _QrFlutterPageState extends State<QrFlutterPage> {
  String text = '';
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('flutter生成二维码'),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          TextField(
            controller: controller,
            decoration: InputDecoration(hintText: '请输入内容'),
          ),
          RaisedButton(
            onPressed: () {
              if (controller.text.isNotEmpty) {
                text = controller.text;
                setState(() {});
              }
            },
            child: Text('生成二维码'),
          ),
          if (text.isNotEmpty) Center(child: qrBuilder()),
        ],
      ),
    );
  }

  Widget qrBuilder() {
    return FutureBuilder(
      future: _loadOverlayImage(),
      builder: (ctx, snapshot) {
        final size = 280.0;
        if (!snapshot.hasData) {
          return Container(width: size, height: size);
        }
        return CustomPaint(
          size: Size.square(size),
          painter: QrPainter(
            data: text,
            version: QrVersions.auto,
            color: Colors.black,
            emptyColor: Colors.white,
            // size: 320.0,
//            embeddedImage: snapshot.data,
            embeddedImage: null,
            embeddedImageStyle: QrEmbeddedImageStyle(
              size: Size.square(50),
            ),
          ),
        );
      },
    );
  }

  Future<ui.Image> _loadOverlayImage() async {
    final completer = Completer<ui.Image>();
    final byteData = await rootBundle.load('assets/images/answer.png');
    ui.decodeImageFromList(byteData.buffer.asUint8List(), completer.complete);
    return completer.future;
  }
}
