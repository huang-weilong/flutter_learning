import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class Test3 extends StatefulWidget {
  @override
  _Test3State createState() => _Test3State();
}

class _Test3State extends State<Test3> {
  bool isShow = false;
  GlobalObjectKey key = GlobalObjectKey('dd');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.ac_unit),
                onPressed: () {
                  setState(() {
                    isShow = !isShow;
                  });
                }),
          ],
        ),
        body: ListView(
          children: <Widget>[
            Offstage(
              offstage: isShow,
              child: Container(
                width: 100.0,
                height: 500.0,
                color: Colors.grey,
              ),
            ),
            Container(
              width: 100.0,
              height: 500.0,
              color: Colors.orange,
            ),
            Container(
              width: 100.0,
              height: 500.0,
              color: Colors.blue,
            ),
          ],
        ));
  }

  Widget _test() {
    return IgnorePointer(
      key: key,
      ignoring: isShow,
      child: Opacity(
        opacity: 0.0,
        child: Container(
          width: 100.0,
          height: 300.0,
          color: Colors.grey,
        ),
      ),
    );
  }
}
