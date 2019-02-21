import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class DragPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _DragPageState();
  }
}

class _DragPageState extends State<DragPage> {
  List<Step> list = [
    Step(title: Text('ddd'), content: Text('ffff')),
    Step(title: Text('123'), content: Text('4567')),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('test'),
          elevation: 0.0,
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.cancel),
                onPressed: () {
                  calculationFebruary('1900');
                }),
          ],
        ),
        body: CustomStepper());
  }

  void calculationFebruary(String year) {
    int y = int.parse(year);

    print('');
    if ((y % 4 == 0 && y % 100 != 0) || y % 400 == 0) {}
  }

  Future<void> initDirectory(String path) async {
    try {
      setState(() {
        var directory = Directory(path);
        for (var d in directory.listSync()) {
          print(d.path);
        }
        print(directory.listSync());
      });
    } catch (e) {
      print(e);
      print("Directory does not exist！");
    }
  }
}

class CustomStepper extends StatefulWidget {
  @override
  _CustomStepperState createState() => _CustomStepperState();
}

class _CustomStepperState extends State<CustomStepper> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      child: Row(
        children: <Widget>[
          IconButton(icon: Icon(Icons.remove), onPressed: () {}),
          SizedBox(
              width: 30.0,
              child: TextField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(contentPadding: EdgeInsets.only(top: 6.0)),
              )),
          IconButton(icon: Icon(Icons.add), onPressed: () {})
        ],
      ),
    );
  }
}
