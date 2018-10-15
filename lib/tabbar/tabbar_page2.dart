import 'package:flutter/material.dart';

import 'page_two/map_page.dart';
import 'page_two/charts_page.dart';
import 'page_two/slide_delete_page.dart';
import 'page_two/html_page.dart';
import 'page_two/lottie_json_animation.dart';
import 'page_two/use_camera.dart';
import 'page_two/index_sharedpreferences_page.dart';

class TabbarPage2 extends StatefulWidget {
  @override
  _TabbarPage2State createState() => _TabbarPage2State();
}

class _TabbarPage2State extends State<TabbarPage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('插件'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            dense: true,
            leading: Icon(Icons.map),
            title: Text('地图'),
            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (_)=>MapPage()));},
          ),
          ListTile(
            dense: true,
            leading: Icon(Icons.insert_chart),
            title: Text('图表'),
            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (_)=>ChartsPage()));},
          ),
          ListTile(
            dense: true,
            leading: Icon(Icons.delete_sweep),
            title: Text('滑动删除'),
            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (_)=>SlideDeletePage()));},
          ),
          ListTile(
            dense: true,
            leading: Icon(Icons.whatshot),
            title: Text('显示html'),
            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (_)=>HtmlPage()));},
          ),
          ListTile(
            dense: true,
            leading: Icon(Icons.account_balance),
            title: Text('使用Lottie json展示动画'),
            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (_)=>LottieJsonAnimation()));},
          ),
          ListTile(
            dense: true,
            leading: Icon(Icons.camera_alt),
            title: Text('使用相机或相册'),
            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (_)=>UseCamera()));},
          ),
          ListTile(
            dense: true,
            leading: Icon(Icons.save),
            title: Text('存储简单的数据SharePreference'),
            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (_)=>IndexSharedPreferencePage()));},
          ),
        ],
      ),
    );
  }
}
