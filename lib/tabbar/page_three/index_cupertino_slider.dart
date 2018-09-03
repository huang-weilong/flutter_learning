import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class IndexCupertinoSlider extends StatefulWidget {
  @override
  _IndexCupertinoSliderState createState() => _IndexCupertinoSliderState();
}

class _IndexCupertinoSliderState extends State<IndexCupertinoSlider> {
  double _value1 = 10.0;
  double _value2 = 15.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('iOS滑块'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              CupertinoSlider(
                value: _value1,
                min: 0.0,
                max: 100.0,
                onChanged: (double value){
                  setState(() {
                    _value1 = value;
                  });
                },
              ),
              Text('滑块1的值：${_value1.toStringAsFixed(1)}'),
              CupertinoSlider(
                value: _value2,
                divisions: 5,//如果不设置，滑块滑动是连续的
                min: 0.0,
                max: 100.0,
                activeColor: Colors.green,
                onChanged: (double value){
                  setState(() {
                    _value2 = value;
                  });
                },
              ),
              Text('滑块2的值：${_value2.toString()}'),
            ],
          )
        ],
      )
    );
  }
}
