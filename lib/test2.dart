import 'package:flutter/material.dart';

class Test2 extends StatefulWidget {
  @override
  _Test2State createState() => _Test2State();
}

class _Test2State extends State<Test2> {
  int d = 0;
  static SlideTransition createTransition(Animation<double> animation, Widget child) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(1.0, 0.0),
        end: const Offset(0.0, 0.0),
      ).animate(animation),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('test2'),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.ac_unit),
              onPressed: () {
                Navigator.push<String>(
                  context,
                  PageRouteBuilder(pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
                    // 跳转的路由对象
                    return TTT2();
                  }, transitionsBuilder: (
                    BuildContext context,
                    Animation<double> animation,
                    Animation<double> secondaryAnimation,
                    Widget child,
                  ) {
                    return _Test2State.createTransition(animation, child);
                  }),
                );
              })
        ],
      ),
      body: Column(
        children: <Widget>[
          Text(d.toString()),
          RaisedButton(
            child: Text('add'),
            onPressed: () {
              setState(() {
                d++;
              });
            },
          ),
          RaisedButton(
              child: Text('ddd'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => TTT2()));
              })
        ],
      ),
    );
  }
}

class TTT2 extends StatefulWidget {
  @override
  _TTT2State createState() => _TTT2State();
}

class _TTT2State extends State<TTT2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TTT2'),
      ),
      body: Center(
        child: RaisedButton(
            child: Text('back'),
            onPressed: () {
              Navigator.popUntil(context, ModalRoute.withName(Navigator.defaultRouteName));
            }),
      ),
    );
  }
}
