import 'dart:async';

import 'package:flutter/material.dart';

class IndexScaleTransition extends StatefulWidget {
  @override
  _IndexScaleTransitionState createState() => _IndexScaleTransitionState();
}

class _IndexScaleTransitionState extends State<IndexScaleTransition> with TickerProviderStateMixin{
  Animation<double> animation1;
  Animation<double> animation2;
  AnimationController controller1;
  AnimationController controller2;
  bool flag = true;
  Timer timer;

  initState() {
    super.initState();
    controller1 = AnimationController(
        duration: const Duration(milliseconds: 200), vsync: this);
    animation1 = Tween(begin: 1.0, end: 4.5).animate(controller1)
      ..addListener(() {
        setState(() { });
      });

    controller2 = AnimationController(
        duration: const Duration(milliseconds: 200), vsync: this);
    animation2 = Tween(begin: 0.5, end: 4.5).animate(controller2)
      ..addListener(() {
        setState(() {
          // the state that has changed here is the animation object’s value
        });
      });

    timer = Timer.periodic(Duration(milliseconds: 500), (_){
      flag = !flag;
      if (flag) {
        controller1.forward();
        controller2.reverse();
      } else {
        controller1.reverse();
        controller2.forward();
      }
    });
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ScaleTransition'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ScaleTransition(
              scale: animation1,
              child: Image.asset('assets/images/img.jpg', width: 50.0,height: 50.0,),
            ),
            ScaleTransition(
              scale: animation2,
              child: Image.asset('assets/images/img.jpg', width: 50.0,height: 50.0,),
            ),
          ],
        ),
      ),
    );
  }
}
