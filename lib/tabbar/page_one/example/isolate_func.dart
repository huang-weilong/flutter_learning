import 'dart:isolate';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class IsolateFunc extends StatefulWidget {
  @override
  _IsolateFuncState createState() => _IsolateFuncState();
}

class _IsolateFuncState extends State<IsolateFunc> {
  int _count1 = 0;
  int _count2 = 0;
  int _count3 = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Isolate'),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            Container(
              width: 100,
              height: 100,
              child: CircularProgressIndicator(),
            ),
            RaisedButton(
                onPressed: () {
                  _count1 = countEven(1000000000);
                  if (this.mounted) setState(() {});
                },
                child: Text(_count1.toString())),
            Text('点击上面的按钮，转圈会卡顿，因为计算默认是在UI线程中的，进行耗时操作时UI没有机会去调用刷新'),
            Container(
              width: 100,
              height: 100,
              child: CircularProgressIndicator(),
            ),
            RaisedButton(
                onPressed: () async {
                  _count2 = await compute(countEven, 1000000000);
                  if (this.mounted) setState(() {});
                },
                child: Text(_count2.toString())),
            Text('使用computed，转圈不会卡顿，注意：computed中运行的函数必须是顶级函数或者static函数，computed传参只能传递一个参数，返回值也只有一个'),
            Container(
              width: 100,
              height: 100,
              child: CircularProgressIndicator(),
            ),
            RaisedButton(
                onPressed: () async {
                  _count3 = await isolateCountEven(1000000000);
                  if (this.mounted) setState(() {});
                },
                child: Text(_count3.toString())),
            Text('使用isolate，转圈不会卡顿。isolate可以持续性传值计算')
          ],
        ),
      ),
    );
  }

  // 计算偶数个数
  static int countEven(int num) {
    int count = 0;
    while (num > 0) {
      if (num % 2 == 0) {
        count++;
      }
      num--;
    }
    return count;
  }

  static Future<dynamic> isolateCountEven(int num) async {
    final response = ReceivePort();
    await Isolate.spawn(countEvent2, response.sendPort);
    final sendPort = await response.first;
    final answer = ReceivePort();
    sendPort.send([answer.sendPort, num]);
    return answer.first;
  }

  static void countEvent2(SendPort port) {
    final rPort = ReceivePort();
    port.send(rPort.sendPort);
    rPort.listen((message) {
      final send = message[0] as SendPort;
      final n = message[1] as int;
      send.send(countEven(n));
    });
  }
}
