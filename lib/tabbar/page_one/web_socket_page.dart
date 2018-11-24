import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:io';

import '../../util/websocket_client.dart';

class WebSocketPage extends StatefulWidget {
  @override
  _WebSocketPageState createState() => _WebSocketPageState();
}

class _WebSocketPageState extends State<WebSocketPage> {
//  WebSocket webSocket;

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('websocket'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            TextField(
              controller: controller,
              decoration: InputDecoration(hintText: '输入要发送的内容'),
            ),
            RaisedButton(
              child: Text('打开websocket连接'),
              onPressed: () {
                client.initWebSocket('ws://demos.kaazing.com/echo');
              },
            ),
            RaisedButton(
              child: Text('关闭websocket连接'),
              onPressed: () {
                ws.close();
              },
            ),
            RaisedButton(
              child: Text('发数据'),
              onPressed: () {
                client.sendMessage(controller.text);
              },
            )
          ],
        ),
      ),
    );
  }
}
