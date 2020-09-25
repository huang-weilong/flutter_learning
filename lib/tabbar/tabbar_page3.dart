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

class _TabbarPage3State extends State<TabbarPage3> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        appBar: CupertinoNavigationBar(
          middle: Text('iOS风格'),
          backgroundColor: Colors.blue,
        ),
        body: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
          children: <Widget>[
            _buildItem('loading动画', IndexCupertinoActivityIndicator()),
            _buildItem('对话框', IndexCupertinoDialog()),
            _buildItem('CupertinoActionSheet', IndexCupertinoActionSheet()),
            _buildItem('按钮', IndexCupertinoButton()),
            _buildItem('滑块', IndexCupertinoSlider()),
            _buildItem('选择开关', IndexCupertinoSwitch()),
            _buildItem('AppBar', IndexCupertinoNavigationBar()),
            _buildItem('底部导航', IndexCurpertinoBottomNavBar()),
            _buildItem('picker', IndexCupertinoPicker()),
            _buildItem('CupertinoTabScaffold', IndexCupertinoTabScaffold()),
          ],
        ));
  }

  Widget _buildItem(String text, Widget router) {
    return InkWell(
      onTap: () {
        Navigator.push(context, CupertinoPageRoute(builder: (_) => router));
      },
      child: Center(
        child: Text(text),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
