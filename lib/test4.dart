import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class Test4 extends StatefulWidget {
  @override
  _Test4State createState() => _Test4State();
}

class _Test4State extends State<Test4> with TickerProviderStateMixin{
  Animation<double> animation1;
  Animation<double> animation2;
  AnimationController controller1;
  AnimationController controller2;
  Timer timer;
  bool flag = true;

  initState() {
    super.initState();
    controller1 = new AnimationController(
        duration: const Duration(milliseconds: 5), vsync: this);
    animation1 = new Tween(begin: 1.0, end: 4.5).animate(controller1)
      ..addListener(() {
        setState(() {
          // the state that has changed here is the animation object’s value
        });
      });
//    controller1.reverse();
    controller2 = new AnimationController(
        duration: const Duration(seconds: 3), vsync: this);
    animation2 = new Tween(begin: 0.0, end: 2.0).animate(controller2)
      ..addListener(() {
        setState(() {
          // the state that has changed here is the animation object’s value
        });
      });
    timer = Timer.periodic(Duration(seconds: 3), (_){
      print('===========================');
      controller2.forward();

//      flag = !flag;
//      if (flag) {
//        controller1.forward();
//        controller2.reverse();
//      } else {
//        controller1.reverse();
//        controller2.forward();
//      }
    });
//    controller2.forward();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('dsadad'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.ac_unit), onPressed: (){
            controller2.reverse();
          })
        ],
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ScaleTransition(
              scale: animation1,
              child: Image.asset('assets/images/img.jpg', width: 50.0,height: 50.0,),
            ),
            SizeTransition(
              sizeFactor: animation2,
              child: Image.asset('assets/images/img.jpg', width: 50.0,height: 50.0,),
            ),

          ],
        ),
      ),
    );
  }
  dispose() {
    controller1.dispose();
    controller2.dispose();
    timer.cancel();
    super.dispose();
  }

}
