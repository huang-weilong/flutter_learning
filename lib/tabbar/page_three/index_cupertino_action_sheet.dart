import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class IndexCupertinoActionSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CupertinoActionSheet'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Center(
        child: CupertinoButton(
            child: Text('显示CupertinoActionSheet'),
            color: Colors.blue,
            onPressed: () {
              showCupertinoModalPopup<String>(
                  context: context,
                  builder: (BuildContext context) {
                    return CupertinoActionSheet(
                        title: Text('标题'),
                        message: Text('内容  内容  内容  内容'),
                        actions: <Widget>[
                          CupertinoActionSheetAction(
                            child: Text('选项一'),
                            onPressed: () {
                              Navigator.pop(context, 'Profiteroles');
                            },
                          ),
                          CupertinoActionSheetAction(
                            child: Text('选项二'),
                            onPressed: () {
                              Navigator.pop(context, 'Cannolis');
                            },
                          ),
                          CupertinoActionSheetAction(
                            child: Text('选项三'),
                            onPressed: () {
                              Navigator.pop(context, 'Trifle');
                            },
                          ),
                        ],
                        cancelButton: CupertinoActionSheetAction(
                          child: Text('取消'),
                          isDefaultAction: true,
                          onPressed: () {
                            Navigator.pop(context, 'Cancel');
                          },
                        ));
                  });
            }),
      ),
    );
  }
}
