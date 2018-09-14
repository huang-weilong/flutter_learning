import 'package:flutter/material.dart';

import '../main.dart';
import 'page_one/index_button_page.dart';
import 'page_one/index_layout_page.dart';
import '../unclassified/index_unclassified_page.dart';
import '../test.dart';
import 'page_one/index_text_page.dart';
import 'page_one/index_dialog_page.dart';
import 'page_one/index_images_page.dart';
import 'page_one/index_sharedpreferences_page.dart';
import 'page_one/index_gesture_page.dart';
import 'package:flutter_learning/unclassified/index_timer_page.dart';
import 'page_one/index_tab_bar_view_page.dart';
import 'page_one/index_tab_bar_page.dart';
import 'page_one/index_add_delete_widget.dart';
import 'page_one/index_hero_page.dart';
import 'page_one/index_nested_scroll_view.dart';
import 'page_one/index_marquee_page.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('首页index_page'),
        centerTitle: true,
        elevation: 0.0,
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
//            DrawerHeader(child: Text('dsa'),),//可以使用这个自定义抽屉头部
            UserAccountsDrawerHeader(
              accountName: Text('long'),
              accountEmail: Text('550456817@qq.com'),
              currentAccountPicture: ClipOval(child: Image.asset('images/long.jpg'),)
            ),
            ListTile(
              title: Text('布局'),
              trailing: Icon(Icons.brightness_1),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.push(context, MaterialPageRoute(builder: (_)=>IndexLayoutPage()));
              },
            ),
            ListTile(
              title: Text('计时器'),
              trailing: Icon(Icons.timer),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.push(context, MaterialPageRoute(builder: (_)=>IndexTimerPage()));
              },
            ),
            Divider(),
            ListTile(
              title: new Text('收起'),
              trailing: new Icon(Icons.cancel),
              onTap: () => Navigator.of(context).pop(),   //点击后收起侧边栏
            ),
            Divider(),
            AboutListTile(
              icon: Icon(Icons.beach_access),
              child: Text('关于'),
              applicationName: 'flutter学习',
              applicationIcon: Icon(Icons.details),
              applicationLegalese: '此项目仅用于学习flutter，部分代码来源于互联网或官方Gallery案例',
              applicationVersion: 'v0.0.1',
              aboutBoxChildren: <Widget>[Icon(Icons.map),Icon(Icons.opacity)],
            )
          ],
        ),
      ),
      body: GridView.count(
        crossAxisCount: 4,//一行有几个孩子
        children: <Widget>[
          RaisedButton(
            child: Text('TabBar1'),
            onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (_)=>IndexTabBarViewPage()));},
          ),
          RaisedButton(
            child: Text('TabBar2'),
            onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (_)=>IndexTabBarPage()));},
          ),
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
            child: Text('添加、删除元素'),
            onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (_)=>IndexAddDeleteWidget()));},
          ),
          RaisedButton(
            child: Text('英雄动画Hero'),
            onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (_)=>IndexHeroPage()));},
          ),
          RaisedButton(
            child: Text('NestedScrollView'),
            onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (_)=>IndexNestedScrollView()));},
          ),
          RaisedButton(
            child: Text('跑马灯效果'),
            onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (_)=>IndexMarqueePage()));},
          ),
          RaisedButton(
            child: Text('其他'),
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
