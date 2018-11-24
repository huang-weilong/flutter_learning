import 'dart:async';
import 'dart:io';

WebSocket ws;
Stream stream;
WebSocketClient client = WebSocketClient();

class WebSocketClient {
  void initWebSocket(String url) async {
    var reconnectScheduled = false;

    void scheduleReconnect() {
      if (!reconnectScheduled) {
        initWebSocket(url);
      }
      reconnectScheduled = true;
    }

    try {
      ws = await WebSocket.connect(url);
    } catch (e) {
      scheduleReconnect();
    }

//    if (!reconnectScheduled) {
    ws.listen((data) {
      print('---收到数据  $data');
    }, onError: (error) {
      print('---收到错误信息');
//      scheduleReconnect();
    }, onDone: () {
      print('---onDone');
//      scheduleReconnect();
    }, cancelOnError: true);
//    }

//    stream = ws.handleError((error) => throw new WebSocketException().message);
//    stream.listen((data) {
//      print('收到的数据 $data');
//    }, onError: (e) {
//      print('错误信息 $e');
//    });
  }

  void sendMessage(String msg) {
    ws.add(msg);
  }
}
