import 'dart:async';
import 'package:flutter/material.dart';

import 'package:event_bus/event_bus.dart';

class EventBusPage extends StatefulWidget {
  @override
  _EventBusPageState createState() => _EventBusPageState();
}

class TestEvent {
  String str;

  TestEvent(this.str);
}

class _EventBusPageState extends State<EventBusPage> {
  EventBus eventBus = EventBus();
  int flag = 0;
  StreamSubscription loginSubscription;

  @override
  void initState() {
    super.initState();
    loginSubscription = eventBus.on<TestEvent>().listen((event) {
      flag++;
    });
  }

  @override
  void dispose() {
    loginSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('event_bus'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text('发起事件'),
              onPressed: (){
                eventBus.fire(TestEvent('abcdefg'));
                setState(() {});
              },
            ),
            RaisedButton(
              child: Text('销毁事件 event.destroy()'),
              onPressed: () {
                eventBus.destroy();
              },
            ),
            RaisedButton(
              child: Text('取消监听cancel()'),
              onPressed: () {
                loginSubscription.cancel();
              },
            ),
            Text('监听到的次数：$flag')
          ],
        ),
      ),
    );
  }
}
