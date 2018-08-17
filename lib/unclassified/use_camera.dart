import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:async';

class UseCamera extends StatefulWidget {
  @override
  _UseCameraState createState() => _UseCameraState();
}

class _UseCameraState extends State<UseCamera> {
  File _image;

  Future getCameraImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
    });
  }

  Future getGalleryImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Image Picker Example'),
      ),
      body: Column(
        children: <Widget>[
          _image == null ? Text('请选择下方按钮\n选择图像或拍摄') : Image.file(_image),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              FlatButton(
                child: Icon(Icons.panorama),
                onPressed: getGalleryImage,
              ),
              FlatButton(
                child: Icon(Icons.add_a_photo),
                onPressed: getCameraImage,
              )
            ],
          )
        ],
      ),
    );
  }
}
