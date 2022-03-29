import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learning/config/themes.dart';
import 'package:flutter_learning/tabbar/page_two/audioplayers_page.dart';
import 'package:flutter_learning/tabbar/page_two/jpush_page.dart';
import 'package:flutter_learning/tabbar/page_two/photo_view/gallery_example_page.dart';
import 'package:flutter_learning/tabbar/page_two/qr_flutter_page.dart';

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
import 'page_two/xml_page.dart';

class TabbarPage2 extends StatefulWidget {
  @override
  _TabbarPage2State createState() => _TabbarPage2State();
}

class _TabbarPage2State extends State<TabbarPage2> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('插件'),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Themes.primaryColor(context),
      ),
      body: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
        children: <Widget>[
          _buildItem(Icons.map, '地图', MapPage()),
          _buildItem(Icons.insert_chart, '图表', ChartsPage()),
          _buildItem(Icons.insert_chart, 'fchart图表', FChartsPage()),
          _buildItem(Icons.delete_sweep, '滑动删除', SlideDeletePage()),
          _buildItem(Icons.whatshot, '显示html', HtmlPage()),
          _buildItem(Icons.account_balance, 'json动画', LottieJsonAnimation()),
          _buildItem(Icons.camera_alt, '使用相机或相册', UseCamera()),
          _buildItem(Icons.save, 'SharePreference', IndexSharedPreferencePage()),
          _buildItem(Icons.blur_on, '二维码扫描', ScanQRCode()),
          _buildItem(Icons.blur_on, '生成二维码', QrFlutterPage()),
          _buildItem(Icons.share, '分享', SharePage()),
          _buildItem(Icons.insert_drive_file, '打开第三方应用', AndroidIntentPage()),
          _buildItem(Icons.event, 'event_bus', EventBusPage()),
          _buildItem(Icons.web, 'webview', WebViewPage()),
          _buildItem(Icons.web, 'web', DioPage()),
          _buildItem(Icons.web, 'websocket channel', WebSocketChannelPage()),
          _buildItem(Icons.games, 'sqflite数据库', SqflitePage()),
          _buildItem(Icons.audiotrack, '播放音频', AudioPlayersPage()),
          _buildItem(Icons.image, '多图片查看', GalleryExamplePage()),
          _buildItem(Icons.animation, '极光推送', JPushPage()),
          _buildItem(Icons.animation, 'xml', XmlPage()),
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

  Widget _buildItem(IconData iconData, String text, Widget router) {
    return InkWell(
      onTap: () {
        Navigator.push(context, CupertinoPageRoute(builder: (_) => router));
      },
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(iconData),
            Text(text),
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
