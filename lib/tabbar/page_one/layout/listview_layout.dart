import 'package:flutter/material.dart';

class ListViewLayout extends StatelessWidget {
  final items = new List<String>.generate(100, (i) => "Item $i");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('一个ListView'),
          centerTitle: true,
          elevation: 0.0,
        ),
        body: ListView.builder(
          physics: BouncingScrollPhysics(), // 回弹效果
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('I\'m ${items[index]}'),
            );
          },
        ));
  }
}
