import 'package:flutter/material.dart';
import 'package:jpush_flutter/jpush_flutter.dart';

class JPushPage extends StatefulWidget {
  @override
  _JPushPageState createState() => _JPushPageState();
}

class _JPushPageState extends State<JPushPage> {
  String debugLable = 'Unknown'; /*错误信息*/
  final JPush jpush = new JPush(); /* 初始化极光插件*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JPush'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Center(
        child: Column(
          children: [
            RaisedButton(
              onPressed: () {
                var fireDate = DateTime.fromMillisecondsSinceEpoch(DateTime.now().millisecondsSinceEpoch + 1000);
                var localNotification = LocalNotification(
                  id: 234,
                  title: '推送标题',
                  buildId: 1,
                  content: '----------推送内容---------',
                  fireTime: fireDate,
                  subtitle: '//////小标题///////',
                );
                jpush.sendLocalNotification(localNotification).then((res) {
                  setState(() {
                    debugLable = res;
                  });
                });
              },
              child: Text('推送'),
            ),
            RaisedButton(
              onPressed: () {
                jpush.isNotificationEnabled().then((bool value) {
                  setState(() {
                    debugLable = "通知授权是否打开: $value";
                  });
                  print(debugLable);
                }).catchError((onError) {
                  setState(() {
                    debugLable = "通知授权是否打开: ${onError.toString()}";
                  });
                  print(debugLable);
                });
              },
              child: Text('通知授权'),
            ),
            RaisedButton(
              onPressed: () {
                jpush.openSettingsForNotification();
              },
              child: Text('打开通知'),
            )
          ],
        ),
      ),
    );
  }
}
