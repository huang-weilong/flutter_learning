import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class IndexCupertinoDialog extends StatefulWidget {
  @override
  _IndexCupertinoDialogState createState() => _IndexCupertinoDialogState();
}

class _IndexCupertinoDialogState extends State<IndexCupertinoDialog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('iOS对话框'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              CupertinoButton(
                child: Text('iOS对话框'),
                color: Colors.blue,
                onPressed: (){
                  showCupertinoDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CupertinoAlertDialog(
                          title: Text('我是标题'),
                          content: Text('我是描述信息'),
                          actions: <Widget>[
                            CupertinoDialogAction(
                              child: Text('确认'),
                              isDestructiveAction: true,//颜色变红(删除、取消的意思）
                              onPressed: (){Navigator.pop(context);},
                            ),
                            CupertinoDialogAction(
                              child: Text('取消'),
                              isDefaultAction: true,//内容加粗
                              onPressed: (){Navigator.pop(context);},
                            )
                          ],
                        );
                      }
                  );
                },
              ),
            ],
          )
        ],
      )
    );
  }
}
