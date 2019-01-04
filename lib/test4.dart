import 'dart:async';

import 'package:flutter/material.dart';
import 'test2.dart';

class Test4 extends StatefulWidget {
  @override
  _Test4State createState() => _Test4State();
}

class DownloadFlag {
  static final DownloadFlag _instance = DownloadFlag();
  static DownloadFlag get instance => _instance;

  bool original = false;
}

class _Test4State extends State<Test4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//        appBar: AppBar(
//          title: Text('test'),
//          elevation: 0.0,
//        ),
        body: Center(
      child: GestureDetector(
        child: Hero(
          child: Image.asset(
            'assets/images/long.jpg',
            width: 85.0,
          ),
          tag: 'long',
        ),
        onTap: () {
          Navigator.push(
            context,
            PageRouteBuilder(
              transitionDuration: Duration(milliseconds: 500),
              pageBuilder: (BuildContext context, _, __) {
                return HeroTest();
              },
            ),
          );
//          Navigator.push(context, MaterialPageRoute(
//              builder: (BuildContext context) => HeroTest(
//                flag: DownloadFlag.instance.original,
//              )),);
        },
      ),
    ));
  }
}

class HeroTest extends StatefulWidget {
  final bool flag;
  HeroTest({this.flag = true});
  @override
  _HeroTestState createState() => _HeroTestState();
}

class _HeroTestState extends State<HeroTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            color: Colors.black,
          ),
          Positioned(
            bottom: 0.0,
            top: 0.0,
            left: 0.0,
            right: 0.0,
            child: GestureDetector(
              child: Hero(
                child: Image.asset(DownloadFlag.instance.original ? 'assets/images/long.jpg' : 'assets/images/long.jpg'),
                tag: 'long',
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ),
          Positioned(
            left: 0.0,
            right: 0.0,
            bottom: 10.0,
            child: Center(
              child: GestureDetector(
                onTap: () {
                  Timer.periodic(Duration(milliseconds: 500), (timer) {
                    setState(() {
                      DownloadFlag.instance.original = true;
                    });
                    timer.cancel();
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 4.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xffc5c5c5), width: 0.3),
                    borderRadius: BorderRadius.circular(1.0),
                  ),
                  child: Text(
                    '查看原图',
                    style: TextStyle(color: Color(0xffc5c5c5)),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
