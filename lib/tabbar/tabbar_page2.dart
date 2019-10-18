import 'package:flutter/material.dart';

import 'page_two/map_page.dart';
import 'page_two/charts_page.dart';
import 'page_two/slide_delete_page.dart';
import 'page_two/html_page.dart';
import 'page_two/lottie_json_animation.dart';
import 'page_two/use_camera.dart';
import 'page_two/index_sharedpreferences_page.dart';
import 'page_two/scan_qr_code.dart';
import 'page_two/video_player_sample.dart';
import 'page_two/video_player_page.dart';
import 'page_two/video_chewie.dart';
import 'page_two/share_page.dart';
import 'page_two/android_intent_page.dart';
import 'page_two/event_bus_page.dart';
import 'page_two/web_view_page.dart';
import 'page_two/dio_page.dart';
import 'page_two/web_socket_channel_page.dart';
import 'page_two/fcharts_page.dart';
import 'page_two/sqflite_page.dart';

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
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => MapPage()));
            },
          ),
          ListTile(
            dense: true,
            leading: Icon(Icons.insert_chart),
            title: Text('图表'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => ChartsPage()));
            },
          ),
          ListTile(
            dense: true,
            leading: Icon(Icons.insert_chart),
            title: Text('fchart图表'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => FChartsPage()));
            },
          ),
          ListTile(
            dense: true,
            leading: Icon(Icons.delete_sweep),
            title: Text('滑动删除'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => SlideDeletePage()));
            },
          ),
          ListTile(
            dense: true,
            leading: Icon(Icons.whatshot),
            title: Text('显示html'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => HtmlPage()));
            },
          ),
          ListTile(
            dense: true,
            leading: Icon(Icons.account_balance),
            title: Text('使用Lottie json展示动画'),
            onTap: () {
//              Navigator.push(context, MaterialPageRoute(builder: (_) => LottieJsonAnimation()));
            },
          ),
          ListTile(
            dense: true,
            leading: Icon(Icons.camera_alt),
            title: Text('使用相机或相册'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => UseCamera()));
            },
          ),
          ListTile(
            dense: true,
            leading: Icon(Icons.save),
            title: Text('存储简单的数据SharePreference'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => IndexSharedPreferencePage()));
            },
          ),
          ListTile(
            dense: true,
            leading: Icon(Icons.blur_on),
            title: Text('二维码扫描'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => ScanQRCode()));
            },
          ),
          ListTile(
            dense: true,
            leading: Icon(Icons.share),
            title: Text('分享'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => SharePage()));
            },
          ),
          ListTile(
            dense: true,
            leading: Icon(Icons.insert_drive_file),
            title: Text('打开第三方应用'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => AndroidIntentPage()));
            },
          ),
          ListTile(
            dense: true,
            leading: Icon(Icons.event),
            title: Text('event_bus'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => EventBusPage()));
            },
          ),
          ListTile(
            dense: true,
            leading: Icon(Icons.web),
            title: Text('webview'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => WebViewPage()));
            },
          ),
          ListTile(
            dense: true,
            leading: Icon(Icons.web),
            title: Text('dio'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => DioPage()));
            },
          ),
          ListTile(
            dense: true,
            leading: Icon(Icons.web),
            title: Text('websocket channel'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => WebSocketChannelPage()));
            },
          ),
          ListTile(
            dense: true,
            leading: Icon(Icons.games),
            title: Text('sqflite数据库'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => SqflitePage()));
            },
          ),
//          ListTile(
//            dense: true,
//            leading: Icon(Icons.video_library),
//            title: Text('视频播放'),
//            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (_)=>VideoPlayerSample()));},
//          ),
//          ListTile(
//            dense: true,
//            leading: Icon(Icons.video_library),
//            title: Text('视频播放'),
//            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (_)=>VideoPlayerPage()));},
//          ),
//          ListTile(
//            dense: true,
//            leading: Icon(Icons.video_library),
//            title: Text('视频播放chewie'),
//            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (_)=>VideoChewie()));},
//          ),
        ],
      ),
    );
  }
}
