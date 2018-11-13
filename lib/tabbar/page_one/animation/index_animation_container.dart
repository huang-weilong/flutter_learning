import 'dart:async';

import 'package:flutter/material.dart';

class IndexAnimationContainer extends StatefulWidget {
  @override
  _IndexAnimationContainerState createState() => _IndexAnimationContainerState();
}

class _IndexAnimationContainerState extends State<IndexAnimationContainer> {
  Color color = Colors.blue;
  double width = 100.0;
  double height = 100.0;
  double width2 = 1.0;
  double num = 0.0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimationContainer'),
        centerTitle: true,
        elevation: 0.0,
        actions: <Widget>[
          IconButton(icon: Text('变色'), onPressed: (){
            setState(() {
              if (color == Colors.blue) color = Colors.red;
              else if (color == Colors.red) color = Colors.green;
              else color = Colors.blue;
            });
          }),
          IconButton(icon: Text('宽高'), onPressed: (){
            setState(() {
              if (width == 100.0) { width = 300.0; height = 300.0;}
              else if (width == 300.0) {width = 50.0; height = 200.0;}
              else { width = 100.0; height = 50.0;}
            });
          },)
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Text('更新'),
        elevation: 0.0,
        onPressed: () {
          setState(() {
            width2 = 380.0;
            Timer.periodic(Duration(milliseconds: 28), (timer) {
              setState(() {
                num++;
              });
              if (num >= 100.0){
                timer.cancel();
              }
            });
          });
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AnimatedContainer(
            duration: Duration(seconds: 1),
            color: color,
            width: width,
            height: height,
            curve: Curves.linear,
          ),
          num == 0.0 ? Container() : Text('正在更新数据$num%'),
          AnimatedContainer(
            duration: Duration(seconds: 3),
            color: color,
            width: width2,
            height: 4.0,
            curve: Curves.linear,
          ),
        ],
      ),
    );
  }
}
