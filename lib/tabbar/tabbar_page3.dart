import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'page_three/index_cupertino_activity_indicator.dart';
import 'page_three/index_cupertino_dialog.dart';
import 'page_three/index_cupertino_button.dart';
import 'page_three/index_cupertino_slider.dart';
import 'page_three/index_cupertino_switch.dart';
import 'page_three/index_cupertino_navigation_bar.dart';
import 'page_three/index_cupertino_tab_scaffold.dart';
import 'page_three/index_curpertino_bottom_navbar.dart';
import 'page_three/index_cupertino_picker.dart';
import 'page_three/index_cupertino_action_sheet.dart';

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
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            dense: true,
            title: Text('loading动画'),
            onTap: (){
              Navigator.push(context, CupertinoPageRoute(builder: (_)=>IndexCupertinoActivityIndicator()));
            },
          ),
          ListTile(
            dense: true,
            title: Text('对话框'),
            onTap: (){
              Navigator.push(context, CupertinoPageRoute(builder: (_)=>IndexCupertinoDialog()));
            },
          ),
          ListTile(
            dense: true,
            title: Text('CupertinoActionSheet'),
            onTap: (){
              Navigator.push(context, CupertinoPageRoute(builder: (_)=>IndexCupertinoActionSheet()));
            },
          ),
          ListTile(
            dense: true,
            title: Text('按钮'),
            onTap: (){
              Navigator.push(context, CupertinoPageRoute(builder: (_)=>IndexCupertinoButton()));
            },
          ),
          ListTile(
            dense: true,
            title: Text('滑块'),
            onTap: (){
              Navigator.push(context, CupertinoPageRoute(builder: (_)=>IndexCupertinoSlider()));
            },
          ),
          ListTile(
            dense: true,
            title: Text('选择开关'),
            onTap: (){
              Navigator.push(context, CupertinoPageRoute(builder: (_)=>IndexCupertinoSwitch()));
            },
          ),
          ListTile(
            dense: true,
            title: Text('AppBar'),
            onTap: (){
              Navigator.push(context, CupertinoPageRoute(builder: (_)=>IndexCupertinoNavigationBar()));
            },
          ),
          ListTile(
            dense: true,
            title: Text('底部导航'),
            onTap: (){
              Navigator.push(context, CupertinoPageRoute(builder: (_)=>IndexCurpertinoBottomNavBar()));
            },
          ),
          ListTile(
            dense: true,
            title: Text('picker'),
            onTap: (){
              Navigator.push(context, CupertinoPageRoute(builder: (_)=>IndexCupertinoPicker()));
            },
          ),
          ListTile(
            dense: true,
            title: Text('CupertinoTabScaffold'),
            onTap: (){
              Navigator.push(context, CupertinoPageRoute(builder: (_)=>IndexCupertinoTabScaffold()));
            },
          ),
        ],
      )
    );
  }
}
