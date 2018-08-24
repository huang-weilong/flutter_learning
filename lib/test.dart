import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:async';

class UseAlbum extends StatefulWidget {
  @override
  _UseAlbumState createState() => _UseAlbumState();
}

class _UseAlbumState extends State<UseAlbum> {
  String s ='        ';
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Image Picker Example'),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.blue,
          border: Border.all(width: 1.0,color: Colors.red)
        ),
        child: Text(s),
      ),
    );
  }
}
