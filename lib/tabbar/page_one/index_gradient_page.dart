import 'package:flutter/material.dart';

class IndexGradientPage extends StatefulWidget {
  @override
  _IndexGradientPageState createState() => _IndexGradientPageState();
}

class _IndexGradientPageState extends State<IndexGradientPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('渐变效果'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            width: 100.0,
            height: 100.0,
            decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.green, Colors.blue])),
            child: Text('线性渐变'),
          ),
          Container(
            width: 100.0,
            height: 100.0,
            decoration: BoxDecoration(
                gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Colors.red, Colors.blue])),
            child: Text('线性渐变'),
          ),
          Container(
            width: 100.0,
            height: 100.0,
            decoration: BoxDecoration(gradient: SweepGradient(colors: [Colors.green, Colors.blue])),
            child: Text('角度渐变'),
          ),
          Container(
            width: 100.0,
            height: 100.0,
            decoration: BoxDecoration(gradient: RadialGradient(colors: [Colors.red, Colors.cyan])),
            child: Text('径向渐变'),
          )
        ],
      ),
    );
  }
}
