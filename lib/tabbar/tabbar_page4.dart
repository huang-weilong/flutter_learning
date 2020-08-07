import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learning/tabbar/page_four/refresh_and_loading.dart';

import 'page_four/index_timer_page.dart';
import 'page_four/index_marquee_page.dart';
import 'page_four/click_effect_example.dart';
import 'page_four/reorderable_list_view_dismissible.dart';
import 'page_four/binary_conversion.dart';
import 'page_four/carousel_images.dart';
import 'page_four/circle_progress_demo.dart';
import 'page_four/wave_progress_demo.dart';
import 'page_four/bar_chart_example.dart';
import 'page_four/date_pick_example.dart';

/// 滚动视图边界光晕
class RefreshBehavior extends ScrollBehavior {
  final bool showLeading;
  final bool showTrailing;
  final Color color;

  RefreshBehavior({this.showLeading: false, this.showTrailing: false, this.color: Colors.blue});

  @override
  Widget buildViewportChrome(BuildContext context, Widget child, AxisDirection axisDirection) {
    return new GlowingOverscrollIndicator(
      showLeading: showLeading,
      showTrailing: showTrailing,
      child: child,
      axisDirection: axisDirection,
      color: color,
    );
  }
}

class TabbarPage4 extends StatefulWidget {
  @override
  _TabbarPage4State createState() => _TabbarPage4State();
}

class _TabbarPage4State extends State<TabbarPage4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('小实例'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ScrollConfiguration(
        behavior: RefreshBehavior(showLeading: true, showTrailing: true),
        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
          children: <Widget>[
            _buildItem(Icons.signal_cellular_4_bar, '计时器', IndexTimerPage()),
            _buildItem(Icons.signal_cellular_4_bar, '跑马灯', IndexMarqueePage()),
            _buildItem(Icons.signal_cellular_4_bar, '点击改变颜色选中', SelectHighlightExample()),
            _buildItem(Icons.signal_cellular_4_bar, '拖动排序+滑动删除', ReorderableListViewDismissible()),
            _buildItem(Icons.signal_cellular_4_bar, '进制转换', BinaryConversion()),
            _buildItem(Icons.signal_cellular_4_bar, '轮播图', CarouselImages()),
            _buildItem(Icons.signal_cellular_4_bar, '圆形进度条', WaveProgressDemo()),
            _buildItem(Icons.signal_cellular_4_bar, '柱状图', BarChartExample()),
            _buildItem(Icons.signal_cellular_4_bar, '时间选择器', DatePickExample()),
            _buildItem(Icons.signal_cellular_4_bar, '上拉加载 下拉刷新', RefreshAndLoading()),
          ],
        ),
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
}
