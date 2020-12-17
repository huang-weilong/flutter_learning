import 'package:flutter/material.dart';
import 'package:flutter_learning/tabbar/page_one/example/isolate_func.dart';
import 'package:flutter_learning/tabbar/page_one/nested/index_nested2_page.dart';
import 'package:flutter_learning/tabbar/page_one/nested/index_nested_scroll_view.dart';

import 'gesture/index_drag_page.dart';
import 'gesture/index_gesture_page.dart';
import 'gesture/index_reorderable_list_view.dart';
import 'gesture/leav_behind_demo.dart';

import 'example/map_to_list.dart';
import 'example/index_add_delete_widget.dart';

import 'layout/custom_scroll_view_layout.dart';
import 'layout/listview_layout.dart';
import 'layout/gridview_layout.dart';
import 'layout/row_layout.dart';
import 'layout/column_layout.dart';
import 'layout/tab_bar4.dart';
import 'layout/wrap_layout.dart';

import 'layout/index_tab_bar_page.dart';
import 'layout/index_tab_bar_show_emotions.dart';
import 'layout/index_tab_bar_view_page.dart';

import 'animation/index_animation_container.dart';
import 'animation/index_animated_cross_fade.dart';
import 'animation/index_animated_builder.dart';
import 'animation/index_hero_page.dart';
import 'animation/index_scale_transition.dart';
import 'animation/index_rotation_transition.dart';
import 'animation/index_size_transition.dart';
import 'animation/index_fade_transition.dart';

import 'painter/draw_line.dart';
import 'painter/draw_circle.dart';
import 'painter/draw_rect.dart';

/// 布局
class IndexLayoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('布局'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            ListTile(
              dense: true,
              leading: Icon(Icons.check_box_outline_blank),
              title: Text('ListView布局'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => ListViewLayout()));
              },
            ),
            ListTile(
              dense: true,
              leading: Icon(Icons.check_box_outline_blank),
              title: Text('GridView布局'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => GridViewLayout()));
              },
            ),
            ListTile(
              dense: true,
              leading: Icon(Icons.check_box_outline_blank),
              title: Text('Row布局'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => RowLayout()));
              },
            ),
            ListTile(
              dense: true,
              leading: Icon(Icons.check_box_outline_blank),
              title: Text('Column布局'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => ColumnLayout()));
              },
            ),
            ListTile(
              dense: true,
              leading: Icon(Icons.check_box_outline_blank),
              title: Text('Wrap布局'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => WrapLayout()));
              },
            ),
            ListTile(
              dense: true,
              leading: Icon(Icons.tab),
              title: Text('TabBar1'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => IndexTabBarViewPage()));
              },
            ),
            ListTile(
              dense: true,
              leading: Icon(Icons.tab),
              title: Text('TabBar2'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => IndexTabBarPage()));
              },
            ),
            ListTile(
              dense: true,
              leading: Icon(Icons.tab),
              title: Text('TabBar显示表情'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => IndexTabBarShowEmotions()));
              },
            ),
            ListTile(
              dense: true,
              leading: Icon(Icons.tab),
              title: Text('TabBar4'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => TabBar4()));
              },
            ),
            ListTile(
              dense: true,
              leading: Icon(Icons.tab),
              title: Text('CustomScrollView布局'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => CustomScrollViewLayout()));
              },
            ),
          ],
        ),
      ),
    );
  }
}

/// Animation 动画
class IndexAnimationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation动画'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            dense: true,
            leading: Icon(Icons.all_inclusive),
            title: Text('AnimationContainer'),
            subtitle: Text('一段时间内逐渐改变其值的容器'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => IndexAnimationContainer()));
            },
          ),
          ListTile(
            dense: true,
            leading: Icon(Icons.all_inclusive),
            title: Text('AnimatedCrossFade'),
            subtitle: Text('一个widget，在两个孩子之间交叉淡入，并同时调整他们的尺寸'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => IndexAnimatedCrossFade()));
            },
          ),
          ListTile(
            dense: true,
            leading: Icon(Icons.all_inclusive),
            title: Text('AnimatedBuilder'),
            subtitle:
                Text('用于构建动画的通用小部件。AnimatedBuilder在有多个widget希望有一个动画作为一个较大的建造函数部分时会非常有用。要使用AnimatedBuilder，只需构建widget并将其传给builder函数即可。'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => IndexAnimatedBuilder()));
            },
          ),
          ListTile(
            dense: true,
            leading: Icon(Icons.all_inclusive),
            title: Text('Hero'),
            subtitle: Text('将其子项标记为hero动画候选的widget'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => IndexHeroPage()));
            },
          ),
          ListTile(
            dense: true,
            leading: Icon(Icons.all_inclusive),
            title: Text('ScaleTransition'),
            subtitle: Text('对widget使用缩放动画'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => IndexScaleTransition()));
            },
          ),
          ListTile(
            dense: true,
            leading: Icon(Icons.all_inclusive),
            title: Text('RotationTransition'),
            subtitle: Text('对widget使用旋转动画'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => IndexRotationTransition()));
            },
          ),
          ListTile(
            dense: true,
            leading: Icon(Icons.all_inclusive),
            title: Text('SizeTransition'),
            subtitle: Text('裁剪动画'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => IndexSizeTransition()));
            },
          ),
          ListTile(
            dense: true,
            leading: Icon(Icons.all_inclusive),
            title: Text('FadeTransition'),
            subtitle: Text('透明度动画'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => IndexFadeTransition()));
            },
          ),
        ],
      ),
    );
  }
}

/// 手势
class IndexGesturePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('手势'),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            dense: true,
            leading: Icon(Icons.gesture),
            title: Text('手势Gesture'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => GesturePage()));
            },
          ),
          ListTile(
            dense: true,
            leading: Icon(Icons.gesture),
            title: Text('drag拖拽'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => IndexDragPage()));
            },
          ),
          ListTile(
            dense: true,
            leading: Icon(Icons.gesture),
            title: Text('ReorderableListView拖拽'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => IndexReorderableListView()));
            },
          ),
          ListTile(
            dense: true,
            leading: Icon(Icons.gesture),
            title: Text('滑动删除'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => LeaveBehindDemo()));
            },
          ),
        ],
      ),
    );
  }
}

/// painter
class IndexPainterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('painter'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            dense: true,
            leading: Icon(Icons.line_weight),
            title: Text('画线'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => DrawLine()));
            },
          ),
          ListTile(
            dense: true,
            leading: Icon(Icons.pie_chart_outlined),
            title: Text('画圆、画弧'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => DrawCircle()));
            },
          ),
          ListTile(
            dense: true,
            leading: Icon(Icons.check_box_outline_blank),
            title: Text('画矩形、多边形'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => DrawRect()));
            },
          ),
        ],
      ),
    );
  }
}

class NestedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('一些方法的使用'),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            dense: true,
            leading: Icon(Icons.check_box_outline_blank),
            title: Text('nested1'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => IndexNestedScrollView()));
            },
          ),
          ListTile(
            dense: true,
            leading: Icon(Icons.check_box_outline_blank),
            title: Text('nested2'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => IndexNested2Page()));
            },
          ),
        ],
      ),
    );
  }
}

/// 一些方法的简单使用
class ExamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('一些方法的使用'),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            dense: true,
            leading: Icon(Icons.check_box_outline_blank),
            title: Text('xx.map(xxx).toList()的简单使用'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => MapToList()));
            },
          ),
          ListTile(
            dense: true,
            leading: Icon(Icons.add),
            title: Text('添加、删除元素'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => IndexAddDeleteWidget()));
            },
          ),
          ListTile(
            dense: true,
            leading: Icon(Icons.add),
            title: Text('Isolate的使用'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => IsolateFunc()));
            },
          ),
        ],
      ),
    );
  }
}
