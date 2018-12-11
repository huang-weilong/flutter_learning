import 'package:flutter/material.dart';
import 'package:android_intent/android_intent.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class AndroidIntentPage extends StatefulWidget {
  @override
  _AndroidIntentPageState createState() => _AndroidIntentPageState();
}

class _AndroidIntentPageState extends State<AndroidIntentPage> {
  String dir = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('打开第三方应用'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text('打开高德地图'),
              onPressed: _displayMapInAMap,
            ),
            RaisedButton(
              child: Text('打开相机'),
              onPressed: _displayCamera,
            ),
            RaisedButton(
              child: Text('打开sd卡的test.pptx'),
              onPressed: _displaySDCardPPT,
            ),
            RaisedButton(
              child: Text('打开网络的test.pptx'),
              onPressed: _displayNetworkPPT,
            ),
            RaisedButton(
              child: Text('获取getApplicationDocumentsDirectory路径'),
              onPressed: _requestAppDocumentsDirectory,
            ),
            RaisedButton(
              child: Text('获取getExternalStorageDirectory路径'),
              onPressed: _requestExternalStorageDirectory,
            ),
            RaisedButton(
              child: Text('获取getTemporaryDirectory路径'),
              onPressed: _requestTempDirectory,
            ),
            RaisedButton(
              child: Text('打印项目目录（控制台）'),
              onPressed: () {
                printFiles('/data/data/com.huangweilong.flutterlearning/');
              },
            ),
            RaisedButton(child: Text('打印SD卡目录（控制台）'), onPressed: printSDCardDirectory),
            RaisedButton(child: Text('打印Temp目录（控制台）'), onPressed: printTempDirectory),
            Text(dir ?? '')
          ],
        ),
      ),
    );
  }

  void _displayMapInAMap({int zoomLevel = 12}) {
    final AndroidIntent intent = AndroidIntent(
        action: 'action_view', data: Uri.encodeFull('geo:23.040511,114.423673?z=$zoomLevel'), package: 'com.autonavi.minimap');
    intent.launch();
  }

  void _displayCamera() {
    final AndroidIntent intent = AndroidIntent(
      action: 'android.media.action.STILL_IMAGE_CAMERA',
    );
    intent.launch();
  }

  void _displaySDCardPPT() {
    if (File('/storage/emulated/0/test.pptx').existsSync()) {
      final AndroidIntent intent =
          AndroidIntent(action: 'action_view', data: Uri.file('/storage/emulated/0/test.pptx').toString(), package: 'cn.wps.moffice_eng');
      intent.launch();
    }
  }

  void _displayNetworkPPT() {
    final AndroidIntent intent =
        AndroidIntent(action: 'action_view', data: Uri.encodeFull('http://www.mrjoke.cn/test.ppt'), package: 'cn.wps.moffice_eng');
    intent.launch();
  }

  void printFiles(String path) {
    try {
      var directory = new Directory(path);
      List<FileSystemEntity> files = directory.listSync();
      for (var f in files) {
        print(f.path);
        var bool = FileSystemEntity.isFileSync(f.path);
        if (!bool) {
          printFiles(f.path);
        }
      }
    } catch (e) {
      print("目录不存在！");
    }
  }

  Future<void> printSDCardDirectory() async {
    // 获取SD卡目录
    String dir = (await getExternalStorageDirectory()).path;

    try {
      var directory = new Directory(dir);
      List<FileSystemEntity> files = directory.listSync();
      for (var f in files) {
        print(f.path);
        var bool = FileSystemEntity.isFileSync(f.path);
        if (!bool) {
          printFiles(f.path);
        }
      }
    } catch (e) {
      print("目录不存在！");
    }

    print(File('$dir/test.pptx').existsSync());
  }

  Future<void> printTempDirectory() async {
    // 获取SD卡目录
    String dir = (await getTemporaryDirectory()).path;

    try {
      var directory = new Directory(dir);
      List<FileSystemEntity> files = directory.listSync();
      for (var f in files) {
        print(f.path);
        var bool = FileSystemEntity.isFileSync(f.path);
        if (!bool) {
          printFiles(f.path);
        }
      }
    } catch (e) {
      print("目录不存在！");
    }

    print(File('$dir/test.pptx').existsSync());
  }

  void _requestAppDocumentsDirectory() {
    getApplicationDocumentsDirectory().then((path) {
      setState(() {
        dir = path.path;
      });
    });
  }

  void _requestTempDirectory() {
    getTemporaryDirectory().then((path) {
      setState(() {
        dir = path.path;
      });
    });
  }

  void _requestExternalStorageDirectory() {
    getExternalStorageDirectory().then((path) {
      setState(() {
        dir = path.path;
      });
    });
  }
}
