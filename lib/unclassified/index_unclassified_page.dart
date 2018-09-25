import 'package:flutter/material.dart';

import 'tab_bar_view_page.dart';
import 'use_camera.dart';
import 'index_timer_page.dart';
import 'lottie_json_animation.dart';
import 'index_marquee_page.dart';

class IndexUnclassifiedPage extends StatelessWidget {
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
              child: Text('TabBarView'),
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
            RaisedButton(
              child: Text('跑马灯效果'),
              onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (_)=>IndexMarqueePage()));},
            ),
            RaisedButton(
              child: Text('使用Lottie json展示动画'),
              onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (_)=>LottieJsonAnimation()));},
            ),
          ],
        )
    );
  }
}