import 'package:flutter/material.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('调用高德地图'),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Text('暂无'),
      )
    );
  }
}
