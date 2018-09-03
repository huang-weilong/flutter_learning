import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class IndexCircularProgressIndicator extends StatefulWidget {
  @override
  _IndexCircularProgressIndicatorState createState() => _IndexCircularProgressIndicatorState();
}

class _IndexCircularProgressIndicatorState extends State<IndexCircularProgressIndicator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ProgressIndicator'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            CircularProgressIndicator(),
            CircularProgressIndicator(
              strokeWidth: 10.0,
            ),
            RefreshProgressIndicator(),
            RefreshProgressIndicator(
              backgroundColor: Colors.green,
              strokeWidth: 5.0,
            )
          ],
        )
      ),
    );
  }
}
