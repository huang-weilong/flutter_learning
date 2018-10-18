import 'package:flutter/material.dart';

class IndexContainerPage extends StatefulWidget {
  @override
  _IndexContainerPageState createState() => _IndexContainerPageState();
}

class _IndexContainerPageState extends State<IndexContainerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/images/img.jpg'), fit: BoxFit.fill),
            ),
            child: Column(
              children: <Widget>[
                AppBar(
                  title: Text('Container'),
                  backgroundColor: Colors.transparent,
                  elevation: 0.0,
                )
              ],
            )),
        preferredSize: Size.fromHeight(180.0),
      ),
      body: Center(
        child: Text('为Container加上背景图片'),
      ),
    );
  }
}
