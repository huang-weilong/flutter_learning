import 'dart:io';
import 'dart:async';

handleMsg(msg) {
  print('收到信息：$msg');
}

main(List<String> arguments) {
  runZoned(() {
    HttpServer.bind('ws://192.168.31.54', 7077).then((server) {
      server.listen((HttpRequest req) {
        if (req.uri.path == '/ws') {
          //把普通的HTTP请求升级成WebSocket请求
          WebSocketTransformer.upgrade(req).then((socket) {
            socket.listen(handleMsg);
          });
        }
      });
    });
  },
      onError: (e) => print("出现一个错误！$e"));
}