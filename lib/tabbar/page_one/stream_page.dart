import 'package:flutter/material.dart';

class StreamPage extends StatefulWidget {
  @override
  _StreamPageState createState() => _StreamPageState();
}

class _StreamPageState extends State<StreamPage> {
  List streamData = ['111111', '222222', '333333', '444444'];
  List<Widget> list = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('stream流'),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text('输出'),
              onPressed: () {
                var stream = Stream.fromIterable(streamData);
                stream.listen((data) {
                  print(data);
                  list.add(Text(data));
                  setState(() {});
                }, onDone: () {
                  print('onDone');
                });
              },
            )
          ]..addAll(list),
        ),
      ),
    );
  }
}
