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
      body: Column(
        children: <Widget>[
          Container(
            child: Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Image.asset('images/img.jpg',width: 60.0,),
                ),

                Expanded(child:
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 2.0),
                      child: Text('dddddddddd',style: TextStyle(fontSize: 16.0),),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 2.0),
                      child:  Row(
                        children: <Widget>[
                          Icon(Icons.title),
                          Text('正常',style: TextStyle(fontSize: 12.0),)
                        ],
                      )
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 2.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Text('ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd',maxLines:1,overflow:TextOverflow.ellipsis,style: TextStyle(fontSize: 16.0),),
                          )
                        ],
                      )
                    ),
                  ],
                )
                ),
                Text('tttt')
              ],
            ),
          )
        ],
      )
    );
  }
}
