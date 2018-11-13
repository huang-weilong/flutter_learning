// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:io';
import 'package:android_intent/android_intent.dart';
import 'dart:math' as math;

import 'package:flutter_document_picker/flutter_document_picker.dart';

class Test2 extends StatefulWidget {
  @override
  _Test2State createState() => _Test2State();
}

class _Test2State extends State<Test2> with SingleTickerProviderStateMixin{
  Color color = Colors.red;
  bool _first = true;
  double width = 1.0;
  double height = 4.0;
  double num = 0.0;

  AnimationController controller;
  final DecorationTween decorationTween = DecorationTween(
    begin: BoxDecoration(
      color: const Color(0xFFFFFFFF),
      border: Border.all(
        color: const Color(0xFF000000),
        style: BorderStyle.solid,
        width: 4.0,
      ),
      borderRadius: BorderRadius.zero,
      shape: BoxShape.rectangle,
      boxShadow: const <BoxShadow> [BoxShadow(
        color: Color(0x66000000),
        blurRadius: 10.0,
        spreadRadius: 4.0,
      )],
    ),
    end: BoxDecoration(
      color: const Color(0xFF000000),
      border: Border.all(
        color: const Color(0xFF202020),
        style: BorderStyle.solid,
        width: 1.0,
      ),
      borderRadius: BorderRadius.circular(10.0),
      shape: BoxShape.rectangle,
      // No shadow.
    ),
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller=AnimationController(vsync: this);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('das'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(icon: Text('宽高'), onPressed: (){
            setState(() {
              width = 380.0;
              Timer.periodic(Duration(milliseconds: 28), (timer) {
                setState(() {
                  num++;
                });
                if (num >= 100.0){
                  timer.cancel();
                }
              });
            });
          },)
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('正在更新数据$num%'),
          AnimatedContainer(
            duration: Duration(seconds: 3),
            color: color,
            width: width,
            height: height,
            curve: Curves.linear,
          ),
        ],
      ),
    );
  }

}