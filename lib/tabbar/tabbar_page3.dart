import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'page_three/index_cupertino_activity_indicator.dart';
import 'page_three/index_cupertino_dialog.dart';
import 'page_three/index_cupertino_button.dart';
import 'page_three/index_cupertino_slider.dart';
import 'page_three/index_cupertino_switch.dart';
import 'page_three/index_cupertino_page_transition.dart';
import 'page_three/index_fullscreen_dialog_transition.dart';
import 'page_three/index_cupertino_navigation_bar.dart';
import 'page_three/index_cupertino_tab_scaffold.dart';
import 'page_three/index_circular_progress_indicator.dart';
import 'page_three/index_curpertino_bottom_navbar.dart';
import 'page_three/index_cupertino_picker.dart';

class TabbarPage3 extends StatefulWidget {
  @override
  _TabbarPage3State createState() => _TabbarPage3State();
}

class _TabbarPage3State extends State<TabbarPage3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text('iOS风格'),
      ),
      body: GridView.count(
        crossAxisCount: 4,
        children: <Widget>[
          CupertinoButton(
            padding: EdgeInsets.all(0.0),
            child: Text('loading动画'),
            color: Colors.blue,
            onPressed: () {
              Navigator.push(context, CupertinoPageRoute(builder: (_) => IndexCupertinoActivityIndicator()));
            },
          ),
          CupertinoButton(
            padding: EdgeInsets.all(0.0),
            child: Text('应用程序正忙、刷新动画'),
            color: Colors.blue,
            onPressed: () {
              Navigator.push(context, CupertinoPageRoute(builder: (_) => IndexCircularProgressIndicator()));
            },
          ),
          CupertinoButton(
            padding: EdgeInsets.all(0.0),
            child: Text('对话框'),
            color: Colors.blue,
            onPressed: () {
              Navigator.push(context, CupertinoPageRoute(builder: (_) => IndexCupertinoDialog()));
            },
          ),
          CupertinoButton(
            padding: EdgeInsets.all(0.0),
            child: Text('按钮'),
            color: Colors.blue,
            onPressed: () {
              Navigator.push(context, CupertinoPageRoute(builder: (_) => IndexCupertinoButton()));
            },
          ),
          CupertinoButton(
            padding: EdgeInsets.all(0.0),
            child: Text('滑块'),
            color: Colors.blue,
            onPressed: () {
              Navigator.push(context, CupertinoPageRoute(builder: (_) => IndexCupertinoSlider()));
            },
          ),
          CupertinoButton(
            padding: EdgeInsets.all(0.0),
            child: Text('选择开关'),
            color: Colors.blue,
            onPressed: () {
              Navigator.push(context, CupertinoPageRoute(builder: (_) => IndexCupertinoSwitch()));
            },
          ),
          CupertinoButton(
            padding: EdgeInsets.all(0.0),
            child: Text('AppBar'),
            color: Colors.blue,
            onPressed: () {
              Navigator.push(context, CupertinoPageRoute(builder: (_) => IndexCupertinoNavigationBar()));
            },
          ),
          CupertinoButton(
            padding: EdgeInsets.all(0.0),
            child: Text('底部导航'),
            color: Colors.blue,
            onPressed: () {
              Navigator.push(context, CupertinoPageRoute(builder: (_) => IndexCurpertinoBottomNavBar()));
            },
          ),
          CupertinoButton(
            padding: EdgeInsets.all(0.0),
            child: Text('picker'),
            color: Colors.blue,
            onPressed: () {
              Navigator.push(context, CupertinoPageRoute(builder: (_) => IndexCupertinoPicker()));
            },
          ),
          CupertinoButton(
            padding: EdgeInsets.all(0.0),
            child: Text('CupertinoTabScaffold'),
            color: Colors.grey,
            onPressed: () {
              Navigator.push(context, CupertinoPageRoute(builder: (_) => IndexCupertinoTabScaffold()));
            },
          ),
          CupertinoButton(
            padding: EdgeInsets.all(0.0),
            child: Text('过渡动画'),
            color: Colors.grey,
            onPressed: () {
              Navigator.push(context, CupertinoPageRoute(builder: (_) => IndexCupertinoPageTransition()));
            },
          ),
          CupertinoButton(
            padding: EdgeInsets.all(0.0),
            child: Text('全屏对话框'),
            color: Colors.grey,
            onPressed: () {
              Navigator.push(context, CupertinoPageRoute(builder: (_) => IndexFullscreenDialogTransition()));
            },
          ),
        ],
      )
    );
  }
}
