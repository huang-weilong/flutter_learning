import 'package:flutter/material.dart';

import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/io.dart';

class WebSocketChannelPage extends StatefulWidget {
  @override
  _WebSocketChannelPageState createState() => _WebSocketChannelPageState();
}

class _WebSocketChannelPageState extends State<WebSocketChannelPage> {
  var channel = IOWebSocketChannel.connect('ws://echo.websocket.org');
  TextEditingController controller = TextEditingController();
  List<String> list = [];

  @override
  void initState() {
    super.initState();
    channel.stream.listen((data) => setState(() => list.add(data)), onError: (error) {
      print('**********************************');
    }, onDone: () {
      print('==================================');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('websocket channel page'),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          TextField(
            controller: controller,
          ),
          Column(
            children: list.map((data) => Text(data)).toList(),
          ),
//          StreamBuilder(
//            stream: channel.stream,
//            builder: (context, sn) {
//              return Text(sn.hasData ? sn.data : '');
//            },
//          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Text('发送'),
        onPressed: () {
          channel.sink.add(controller.text);
        },
      ),
    );
  }
}
