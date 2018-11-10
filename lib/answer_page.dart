import 'package:flutter/material.dart';

class AnswerPage extends StatefulWidget {
  @override
  _AnswerPageState createState() => _AnswerPageState();
}

class _AnswerPageState extends State<AnswerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2a2a2a),
      body: Column(
        children: <Widget>[
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  child: Image.asset(
                    'assets/images/img.jpg',
                    width: 130.0,
                    height: 130.0,
                  )),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 12.0),
                child: Text(
                  '名字名字',
                  style: TextStyle(color: Colors.white, fontSize: 26.0),
                ),
              ),
              Text(
                '邀请你语音通话',
                style: TextStyle(color: Colors.white),
              )
            ],
          )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(
                children: <Widget>[
                  GestureDetector(
                    child: Image.asset(
                      'assets/images/hang_up.png',
                      width: 70.0,
                      height: 70.0,
                    ),
                    onTap: () {},
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.0),
                    child: Text(
                      '拒绝',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  GestureDetector(
                    child: Image.asset(
                      'assets/images/answer.png',
                      width: 70.0,
                      height: 70.0,
                    ),
                    onTap: () {},
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.0),
                    child: Text(
                      '接听',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
