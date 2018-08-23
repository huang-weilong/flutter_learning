import 'package:flutter/material.dart';

import 'page_one/index_button_page.dart';
import 'page_one/index_layout_page.dart';
import '../unclassified/index_unclassified_page.dart';
import '../test.dart';
import 'page_one/index_text_page.dart';
import 'page_one/index_dialog_page.dart';
import 'page_one/index_images_page.dart';
import 'page_one/index_sharedpreferences_page.dart';
import 'page_one/index_gesture_page.dart';
import 'page_one/index_timer_page.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('首页'),
        centerTitle: true,
      ),
      body: GridView.count(
        crossAxisCount: 4,//一行有几个孩子
        children: <Widget>[
          RaisedButton(
            child: Text('按钮Button'),
            onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (_)=>IndexButtonPage()));},
          ),
          RaisedButton(
            child: Text('布局'),
            onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (_)=>IndexLayoutPage()));},
          ),
          RaisedButton(
            child: Text('输入框TextField'),
            onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (_)=>IndexTextPage()));},
          ),
          RaisedButton(
            child: Text('对话框AlertDialog'),
            onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (_)=>IndexDialogPage()));},
          ),
          RaisedButton(
            child: Text('图片Images'),
            onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (_)=>IndexImagesPage()));},
          ),
          RaisedButton(
            child: Text('存储简单的数据SharePreference'),
            onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (_)=>IndexSharedPreferencePage()));},
          ),
          RaisedButton(
            child: Text('手势Gesture'),
            onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (_)=>IndexGesturePage()));},
          ),
          RaisedButton(
            child: Text('计时器'),
            onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (_)=>IndexTimerPage()));},
          ),
          RaisedButton(
            child: Text('杂七杂八'),
            onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (_)=>IndexUnclassifiedPage()));},
          ),
          RaisedButton(
            child: Text('测试页面'),
//            onPressed: (){},
            onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (_)=>UseAlbum()));},
          ),
        ],
      )
    );
  }
}
