import 'package:flutter/material.dart';


class UseAlbum extends StatefulWidget {
  const UseAlbum({Key key}) : super(key: key);

  @override
  _UseAlbumState createState() => _UseAlbumState();
}

class _UseAlbumState extends State<UseAlbum> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('测试'),
      ),
      body: Center(
        child: Image.asset('assets/images/test.webp'),
      )
    );
  }
}
