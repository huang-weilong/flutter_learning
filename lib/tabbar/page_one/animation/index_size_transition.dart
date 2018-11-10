import 'dart:async';

import 'package:flutter/material.dart';

class IndexSizeTransition extends StatefulWidget {
  @override
  _IndexSizeTransitionState createState() => _IndexSizeTransitionState();
}

class _IndexSizeTransitionState extends State<IndexSizeTransition> with TickerProviderStateMixin{
  Animation<double> animation;
  AnimationController controller;
  Timer timer;
  bool flag = true;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    animation = Tween(begin: 0.0, end: 2.0).animate(controller)
      ..addListener(() {
        setState(() {
          // the state that has changed here is the animation object’s value
        });
      });

    timer = Timer.periodic(Duration(milliseconds: 500), (_){
      flag = !flag;
      if (flag) {
        controller.reverse();
      } else {
        controller.forward();
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    timer.cancel();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SizeTransition'),
        elevation: 0.0,
      ),
      body: Center(
        child: SizeTransition(
          sizeFactor: animation,
          child: Image.asset('assets/images/img.jpg'),
        ),
      ),
    );
  }
}
