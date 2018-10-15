import 'package:flutter/material.dart';

class IndexCheckboxPage extends StatefulWidget {
  @override
  _IndexCheckboxPageState createState() => _IndexCheckboxPageState();
}

class _IndexCheckboxPageState extends State<IndexCheckboxPage> {
  bool checkboxValueA = true;
  bool checkboxValueB = false;
  bool checkboxValueC;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('复选框'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Checkbox(
              value: checkboxValueA,
              onChanged: (bool value) {
                setState(() {
                  checkboxValueA = value;
                });
              },
            ),
            Checkbox(
              value: checkboxValueB,
              onChanged: (bool value) {
                setState(() {
                  checkboxValueB = value;
                });
              },
            ),
            Checkbox(
              value: checkboxValueC,
              tristate: true,
              activeColor: Colors.green,
              onChanged: (bool value) {
                setState(() {
                  checkboxValueC = value;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
