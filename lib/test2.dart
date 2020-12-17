import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Test2 extends StatefulWidget {
  @override
  _Test2State createState() => _Test2State();
}

class _Test2State extends State<Test2> {
  bool flag = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('测试2'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          if (flag == true) Offstage(offstage: true, child: Container()),
//          Opacity(opacity: 0.1, child: Container(height: 0.0, width: 0.0)),
          RaisedButton(
            onPressed: () {
              setState(() {
                flag = !flag;
              });
            },
            child: Text('测试'),
          ),
          flag ? Text('22222222') : T2()
        ],
      ),
    );
  }
}

class T2 extends StatefulWidget {
  @override
  _T2State createState() => _T2State();
}

class _T2State extends State<T2> {
  @override
  void dispose() {
    print('-------------------------------');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text('data');
  }
}

class P with ChangeNotifier {
  void d() {
    notifyListeners();
  }
}
