import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'dart:math';
import 'package:flutter_slidable/flutter_slidable.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  TextEditingController controller = TextEditingController();
  List<String> list = List();
  String aa = '10';
  String bb = '9';

  @override
  Widget build(BuildContext context) {
    print('===========');
    return Scaffold(
      appBar: AppBar(
        title: Text('dsadas'),
        actions: <Widget>[
          IconButton(icon: Text('添加'), onPressed: (){
            addWaterSource();
          })
        ],
      ),
      body: ListView(
        children: <Widget>[
          TextField(
            controller: controller,

          )
        ],
      )
    );
  }

  void addWaterSource() {
    Map<String, dynamic> map = Map();

//    map['id'] = '';
    map['name'] = aa; //编码
    map['water_pressure'] = double.parse(controller.text);
    map['dsdas'] = 'wqwq';
    print('--------$map');
    print(map['water_pressure'].runtimeType);
  }
}
