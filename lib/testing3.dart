import 'dart:io';

main(List<String> arguments) {
  //创建一个WebSocket连接，URL必须使用ws或wss
  WebSocket.connect('ws://127.0.0.1:8089/ws').then((socket) {
    socket.add('你也好ddd呀！');
  });
}