import 'package:flutter/material.dart';

import 'tab_bar_view_page.dart';
import 'use_camera.dart';
import 'index_timer_page.dart';

class IndexUnclassifiedPage extends StatefulWidget {
  @override
  _IndexUnclassifiedPageState createState() => _IndexUnclassifiedPageState();
}

class _IndexUnclassifiedPageState extends State<IndexUnclassifiedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('未分类'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: GridView.count(
        crossAxisCount: 4,
        children: <Widget>[
          RaisedButton(
            child: Text('点击弹出底部sheet'),
            onPressed: (){
              showModalBottomSheet(context: context, builder: (BuildContext context){
                return Center(
                  child: Container(
                    child: Text('这是一个底部模态面板，点击任意地方取消显示'),
                  ),
                );
              });
            },
          ),
          RaisedButton(
            child: Text('tabbarviewpage'),
            onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (_) => TabBarViewPage()));},
          ),
          RaisedButton(
            child: Text('使用相机或相册'),
            onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (_) => UseCamera()));},
          ),
          RaisedButton(
            child: Text('计时器'),
            onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (_)=>IndexTimerPage()));},
          ),
        ],
      )
    );
  }
}
