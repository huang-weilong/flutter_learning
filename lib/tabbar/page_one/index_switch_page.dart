import 'package:flutter/material.dart';

class IndexSwitchPage extends StatefulWidget {
  @override
  _IndexSwitchPageState createState() => _IndexSwitchPageState();
}

class _IndexSwitchPageState extends State<IndexSwitchPage> {
  bool switchValue1 = true;
  bool switchValue2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('switch开关'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Switch(
              value: switchValue1,
              onChanged: (bool value) {
                setState(() {
                  switchValue1 = value;
                });
              },
            ),
            Switch(
              value: switchValue2,
              activeColor: Colors.orange,
              activeTrackColor: Colors.green,
              inactiveThumbColor: Colors.black,
              inactiveTrackColor: Colors.blue,
              onChanged: (bool value) {
                setState(() {
                  switchValue2 = value;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
