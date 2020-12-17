import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hand_signature/signature.dart';
import 'package:signature/signature.dart';
import 'package:path_provider/path_provider.dart';

class SignaturePage extends StatefulWidget {
  @override
  _SignaturePageState createState() => _SignaturePageState();
}

class _SignaturePageState extends State<SignaturePage> {
  final control = HandSignatureControl(
    threshold: 3.0,
    smoothRatio: 0.65,
    velocityRange: 2.0,
  );

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final widget = HandSignaturePainterView(
      control: control,
      color: Colors.grey,
      width: 1.0,
      maxWidth: 10.0,
      type: SignatureDrawType.shape,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('画板'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Row(
        children: [
          Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.red)),
            child: AspectRatio(aspectRatio: 2, child: widget),
          ),
          Column(
            children: [
              IconButton(
                icon: Icon(Icons.clear),
                onPressed: () {
                  control.clear();
                },
              ),
              IconButton(
                icon: Icon(Icons.save),
                onPressed: () async {
//                  control.toPicture();
                  ByteData byteData = await control.toImage();
                  String path = (await getExternalStorageDirectory()).path;
                  print(path);
                  File file = new File(path + '/1.jpg');
////写文件
                  file.writeAsBytes(byteData.buffer.asInt8List(0));
//                  control.toSvg();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
