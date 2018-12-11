import 'package:flutter/material.dart';

import 'page_four/index_timer_page.dart';
import 'page_four/index_marquee_page.dart';
import 'page_four/click_effect_example.dart';
import 'page_four/reorderable_list_view_dismissible.dart';
import 'page_four/binary_conversion.dart';

class TabbarPage4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('小实例'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            dense: true,
            leading: Icon(Icons.signal_cellular_4_bar),
            title: Text('计时器'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => IndexTimerPage()));
            },
          ),
          ListTile(
            dense: true,
            leading: Icon(Icons.signal_cellular_4_bar),
            title: Text('跑马灯'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => IndexMarqueePage()));
            },
          ),
          ListTile(
            dense: true,
            leading: Icon(Icons.signal_cellular_4_bar),
            title: Text('点击改变颜色选中'),
            trailing: Text('自定义widget'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => SelectHighlightExample()));
            },
          ),
          ListTile(
            dense: true,
            leading: Icon(Icons.signal_cellular_4_bar),
            title: Text('拖动排序+滑动删除'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => ReorderableListViewDismissible()));
            },
          ),
          ListTile(
            dense: true,
            leading: Icon(Icons.signal_cellular_4_bar),
            title: Text('进制转换'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => BinaryConversion()));
            },
          ),
        ],
      ),
    );
  }
}
