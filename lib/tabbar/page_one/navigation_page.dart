import 'package:flutter/material.dart';

import 'layout/listview_layout.dart';
import 'layout/gridview_layout.dart';
import 'layout/row_layout.dart';
import 'layout/column_layout.dart';
import 'layout/wrap_layout.dart';

import 'tabbar/index_tab_bar_page.dart';
import 'tabbar/index_tab_bar_show_emotions.dart';
import 'tabbar/index_tab_bar_view_page.dart';

import 'animation/index_animation_container.dart';
import 'animation/index_animated_cross_fade.dart';
import 'animation/index_animated_builder.dart';
import 'animation/index_hero_page.dart';
import 'animation/index_scale_transition.dart';
import 'animation/index_rotation_transition.dart';
import 'animation/index_size_transition.dart';

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
          ],
        ),
      ),
    );
  }
}

/// TabBar
class TabBarPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TabBar'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ListView(
        children: <Widget>[
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
        ],
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
            subtitle: Text('用于构建动画的通用小部件。AnimatedBuilder在有多个widget希望有一个动画作为一个较大的建造函数部分时会非常有用。要使用AnimatedBuilder，只需构建widget并将其传给builder函数即可。'),
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
        ],
      ),
    );
  }
}
