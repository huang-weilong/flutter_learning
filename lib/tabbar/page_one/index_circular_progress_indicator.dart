import 'package:flutter/material.dart';

class IndexCircularProgressIndicator extends StatelessWidget {
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
              ),
            ],
          )
      ),
    );
  }
}
