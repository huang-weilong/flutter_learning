import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class IndexCupertinoButton extends StatefulWidget {
  @override
  _IndexCupertinoButtonState createState() => _IndexCupertinoButtonState();
}

class _IndexCupertinoButtonState extends State<IndexCupertinoButton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('iOS按钮'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              CupertinoButton(
                child: Text('按钮1'),
                color: Colors.green,
                onPressed: (){},
              ),
              CupertinoButton(
                child: Text('按钮2'),
                color: Colors.blue,
                borderRadius: BorderRadius.circular(5.0),
                onPressed: (){},
              ),
              CupertinoButton(
                child: Text('禁用'),
                color: Colors.blue,
                minSize: 60.0,
//                disabledColor: Colors.grey,
                onPressed: null,
              )
            ],
          )
        ],
      ),
    );
  }
}
