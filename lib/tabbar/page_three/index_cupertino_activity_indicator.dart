import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class IndexCupertinoActivityIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('loading动画'),
          centerTitle: true,
          elevation: 0.0,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            CupertinoActivityIndicator(),
            CupertinoActivityIndicator(radius: 16.0,),
            Text('CupertinoActivityIndicator()'),
          ],
        )
    );
  }
}
