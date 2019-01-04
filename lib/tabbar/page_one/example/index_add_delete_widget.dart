import 'package:flutter/material.dart';

import 'dart:async';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class IndexAddDeleteWidget extends StatefulWidget {
  @override
  _IndexAddDeleteWidgetState createState() => _IndexAddDeleteWidgetState();
}

///点击按钮添加、删除元素并显示
class _IndexAddDeleteWidgetState extends State<IndexAddDeleteWidget> {
  File _image;
  List<Widget> images = [];
  List<Widget> icons = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('添加、删除元素'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: GridView.count(
              shrinkWrap: true,
              crossAxisCount: 4,
              physics: ScrollPhysics(),
              children: <Widget>[]
                ..addAll(images)
                ..add(Container(
                  margin: EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue)
                  ),
                  child: IconButton(
                      icon: Icon(Icons.add,size: 32.0,),
                      onPressed: (){
                        getImage(images);
                      }),
                ))
                ..add(Container(
                  margin: EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue)
                  ),
                  child: IconButton(
                      icon: Icon(Icons.remove,size: 32.0,),
                      onPressed: (){
                        setState(() {
                          images.removeLast();
                        });
                      }),
                )),
            ),
          ),
          Expanded(
            child: GridView.count(
              shrinkWrap: true,
              crossAxisCount: 4,
              physics: ScrollPhysics(),
              children: <Widget>[]
                ..addAll(icons)
                ..add(Container(
                  margin: EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue)
                  ),
                  child: IconButton(
                      icon: Icon(Icons.add,size: 32.0,),
                      onPressed: (){
                        getIcon();
                      }),
                ))
                ..add(Container(
                  margin: EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue)
                  ),
                  child: IconButton(
                      icon: Icon(Icons.remove,size: 32.0,),
                      onPressed: (){
                        setState(() {
                          icons.removeLast();
                        });
                      }),
                )),
            ),
          )
        ],
      )
    );
  }

  Widget addImage() {
    return Container(
      margin: EdgeInsets.all(4.0),
      child: Image.file(_image,width: 60.0,height: 60.0,fit: BoxFit.cover,),
    );
  }

  Future getImage(List images) async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    print(images.length);
    //最多添加6张图片
//    if(images.length<6) {
      setState(() {
        _image = image;
        images.add(addImage());
      });
//    }
  }

  Widget addIcons() {
    return Container(
      margin: EdgeInsets.all(4.0),
      child: Icon(Icons.access_alarm),
    );
  }

  getIcon() {
    setState(() {
      icons.add(addIcons());
    });
  }

}
