import 'dart:async';
import 'dart:math';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
//import 'package:web_socket_channel/html.dart';
import 'test4.dart';
import 'package:flutter/material.dart';


class DragPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _DragPageState();
  }
}

class _DragPageState extends State<DragPage> {
//  String title = 'wwwwwwwwwww';
//  // 既可以监听来自服务器的消息，又可以将消息发送到服务器的方法
//  WebSocketChannel channel = IOWebSocketChannel.connect('ws://192.168.31.54:7077/ws/join');
////  WebSocketChannel channel = IOWebSocketChannel.connect('ws://echo.websocket.org');
//  TextEditingController _controller = new TextEditingController();
//  WebSocket ws;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

//    channel.stream.listen((data){
//      print('ppppppppppppppppp${data.toString()}');
//    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
//    return new Scaffold(
//      appBar: new AppBar(
//        title: new Text(title),
//      ),
//      body: new Padding(
//        padding: const EdgeInsets.all(20.0),
//        child: new Column(
//          crossAxisAlignment: CrossAxisAlignment.start,
//          children: <Widget>[
//            new Form(
//              child: new TextFormField(
//                controller: _controller,
//                decoration: new InputDecoration(labelText: 'Send a message'),
//              ),
//            ),
////            new StreamBuilder(
////              stream: channel.stream,
////              builder: (context, snapshot) {
////                return new Padding(
////                  padding: const EdgeInsets.symmetric(vertical: 24.0),
////                  child: new Text(snapshot.hasData ? '${snapshot.data}' : ''),
////                );
////              },
////            )
//          ],
//        ),
//      ),
//      floatingActionButton: new FloatingActionButton(
//        onPressed: _sendMessage,
//        tooltip: 'Send message',
//        child: new Icon(Icons.send),
//      ), // This trailing comma makes auto-formatting nicer for build methods.
//    );
  }

//  void _sendMessage() {
//    var data = {
//      'UserId': '003bf0c1-f491-43d8-a4f4-1537f168e000',
//      'AccessToken': '222',
//      'DeviceId': '333',
//      'DeviceName': '444',
//      'DeviceType': 'web',
//      'EncryptType': '1'
//    };
////    if (_controller.text.isNotEmpty) {
//      channel.sink.add('abc1111ddddd');
////    }
//  }
//
//  @override
//  void dispose() {
//    channel.sink.close();
//    super.dispose();
//  }

}