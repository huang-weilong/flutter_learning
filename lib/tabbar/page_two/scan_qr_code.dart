import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';

import 'package:barcode_scan2/barcode_scan2.dart';

class ScanQRCode extends StatefulWidget {
  @override
  _ScanQRCodeState createState() => _ScanQRCodeState();
}

class _ScanQRCodeState extends State<ScanQRCode> {
  String barcode = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('扫描二维码'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            ElevatedButton(
              child: Text('扫一扫'),
              onPressed: scan,
            ),
            Text('扫描到的内容：$barcode')
          ],
        ),
      ),
    );
  }

  Future scan() async {
    try {
      ScanResult barcode = await BarcodeScanner.scan();
      setState(() => this.barcode = barcode.rawContent);
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.cameraAccessDenied) {
        setState(() {
          this.barcode = 'The user did not grant the camera permission!';
        });
      } else {
        setState(() => this.barcode = 'Unknown error: $e');
      }
    } on FormatException {
      setState(() => this.barcode = 'null (User returned using the "back"-button before scanning anything. Result)');
    } catch (e) {
      setState(() => this.barcode = 'Unknown error: $e');
    }
  }
}
