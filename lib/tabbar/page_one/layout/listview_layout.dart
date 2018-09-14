import 'package:flutter/material.dart';

class ListViewLayout extends StatefulWidget {
  @override
  _ListViewLayoutState createState() => _ListViewLayoutState();
}

class _ListViewLayoutState extends State<ListViewLayout> {
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
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('I\'m ${items[index]}'),
          );
        },
      )
    );
  }
}
