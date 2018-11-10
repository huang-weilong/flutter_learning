import 'dart:async';

import 'package:flutter/material.dart';

class IndexRotationTransition extends StatefulWidget {
  @override
  _IndexRotationTransitionState createState() => _IndexRotationTransitionState();
}

class _IndexRotationTransitionState extends State<IndexRotationTransition> with TickerProviderStateMixin{
  Animation<double> animation;
  AnimationController controller;
  Timer timer;
  bool flag = true;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(seconds: 2), vsync: this);
    animation = Tween(begin: 0.0, end: 1.0).animate(controller)
      ..addListener(() {
        setState(() {
          // the state that has changed here is the animation object’s value
        });
      });

    timer = Timer.periodic(Duration(seconds: 2), (_){
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
        title: Text('RotationTransition'),
        elevation: 0.0,
      ),
      body: Center(
        child: RotationTransition(
          turns: animation,
          child: Image.asset('assets/images/img.jpg'),
        ),
      ),
    );
  }
}
