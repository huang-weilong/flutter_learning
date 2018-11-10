import 'dart:async';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'test4.dart';
import 'package:flutter/material.dart';
import 'test4.dart';
import 'package:flutter_learning/main.dart';

class DragPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _DragPageState();
  }
}

class _DragPageState extends State<DragPage> {
final GlobalKey<NavigatorState> navi  = GlobalKey<NavigatorState>();
  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 3), (timer){
      print('======================');
//      Navigator.of(context).pushNamed('/testg');
      navi.currentState.push(CupertinoPageRoute(builder: (context) => Test4()));
      timer.cancel();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navi,
      home: new Scaffold(

          appBar: AppBar(
            title: Text('dads'),
          ),
          body: Column(
            children: <Widget>[
              RaisedButton(
                child: Text('dsada'),
                onPressed: (){
//                Navigator.push(GlobalKey<NavigatorState>().currentContext, CupertinoPageRoute(builder: (context) => Test4()));
                print(GlobalKey<NavigatorState>());
//                print(App.appStateKey.currentState);
//                GlobalKey<NavigatorState>().currentState.push(CupertinoPageRoute(builder: (context) => Test4()));
                navi.currentState.push(CupertinoPageRoute(builder: (context) => Test4()));
//                Navigator.of(context).pushNamed('/testg');// 接听页面
                },
              )
            ],
          )
      ),
    );
  }

}
