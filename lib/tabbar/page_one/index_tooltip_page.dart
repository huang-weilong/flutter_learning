import 'package:flutter/material.dart';

class IndexTooltipPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tooltip'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text('长按下面的按钮'),
          IconButton(
            icon: Icon(
              Icons.ac_unit,
              color: Colors.cyan,
            ),
            onPressed: () {},
            tooltip: '提示信息',
          ),
          Tooltip(
            message: 'android',
            padding: EdgeInsets.all(20.0),
            child: Icon(
              Icons.android,
              color: Colors.green,
            ),
          )
        ],
      )),
    );
  }
}
