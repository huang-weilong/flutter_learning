import 'package:flutter/material.dart';

class IndexRadioPage extends StatefulWidget {
  @override
  _IndexRadioPageState createState() => _IndexRadioPageState();
}

class _IndexRadioPageState extends State<IndexRadioPage> {
  int radioValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('radio单选框'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Radio(
              value: 0,
              groupValue: radioValue,
              onChanged: handleRadioValueChanged
            ),
            Radio(
                value: 1,
                groupValue: radioValue,
                activeColor: Colors.green,
                onChanged: handleRadioValueChanged
            ),
            Radio(
                value: 2,
                groupValue: radioValue,
                onChanged: handleRadioValueChanged
            ),
          ],
        ),
      ),
    );
  }

  handleRadioValueChanged(int value) {
    setState(() {
      radioValue = value;
    });
  }
}
