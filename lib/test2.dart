// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Photo {
  Photo({
    this.assetName,
  });

  final String assetName;

  String get tag => assetName; // Assuming that all asset names are unique.
}

class Test2 extends StatefulWidget {
  @override
  _Test2State createState() => _Test2State();
}

class _Test2State extends State<Test2> with SingleTickerProviderStateMixin {
  Photo photo = Photo(assetName: 'assets/images/067.jpg');
  Map<String, String> data = {'aa': '123', 'bb': '456'};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('das'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                var data = [1, 2, 3, 4];
                var stream = new Stream.fromIterable(data);

                stream.listen((e) => print(e), onDone: () => print('Done'));
              })
        ],
      ),
    );
  }
}
