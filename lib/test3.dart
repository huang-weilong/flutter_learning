import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class Test3 extends StatefulWidget {
  @override
  _Test3State createState() => _Test3State();
}

class _Test3State extends State<Test3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () async {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return ShowDialogPage();
                  },
                );
              },
            )
          ],
        ),
        body: Center(
          child: RaisedButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return ShowDialogPage();
                },
              );
            },
            child: Text('弹窗'),
          ),
        ));
  }
}

class ShowDialogPage extends StatefulWidget {
  @override
  _ShowDialogPageState createState() => _ShowDialogPageState();
}

class _ShowDialogPageState extends State<ShowDialogPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 0.5, color: Colors.grey.withOpacity(0.5)))),
            child: TextField(
              style: TextStyle(fontSize: 14.0, color: Colors.black),
              decoration: InputDecoration(
                isDense: true,
                hintText: '请输入内容...',
                contentPadding: EdgeInsets.symmetric(vertical: 4.0),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
