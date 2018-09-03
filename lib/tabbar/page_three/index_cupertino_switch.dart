import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class IndexCupertinoSwitch extends StatefulWidget {
  @override
  _IndexCupertinoSwitchState createState() => _IndexCupertinoSwitchState();
}

class _IndexCupertinoSwitchState extends State<IndexCupertinoSwitch> {
  bool _flag1 = false;
  bool _flag2 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('switch选择开关'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            CupertinoSwitch(
              value: _flag1,
              onChanged: (bool value) {
                setState(() {
                  _flag1 = value;
                });
              },
            ),
            CupertinoSwitch(
              value: _flag2,
              activeColor: Colors.blue,
              onChanged: (bool value) {
                setState(() {
                  _flag2 = value;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
