import 'package:flutter/material.dart';

class IndexNestedScrollView extends StatefulWidget {
  @override
  _IndexNestedScrollViewState createState() => _IndexNestedScrollViewState();
}

class _IndexNestedScrollViewState extends State<IndexNestedScrollView> {
  Color bgColor = Colors.blue;
  Color txColor = Colors.white;

  bool _handle(ScrollNotification notification) {
    final double before = notification.metrics.extentBefore;

    setState(() {
      /**这是一个颜色过渡均匀的算法。
       * 颜色是ARGB  确定每次变化RGB都不变，只改变A，即从FF->00，则可以实现一种颜色从完全显示都完全透明
       * 下方注释的代码中  12372457代表一个RGB颜色值，前面的appBarColor*16777216则是A 不透明度的变化
       * 当然也可以从一种颜色到另一种颜色变化。
       */
      //before的极值为173.0
//      appBarColor = (255/173*before).toInt();//根据滑动距离来改变不透明度的值
//      appBarColor = appBarColor*16777216+12372457;
//      appBarColor = appBarColor>(255*16777216+12372457) ? (255*16777216+12372457):appBarColor;
////        bgColor = Color(value)
//      bgColor = Color(appBarColor);
//      print('\n\n'+flag.toRadixString(16)+'\n\n');

      if (before > 100)
        bgColor = Colors.orange;
      else
        bgColor = Colors.blue;
    });
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(elevation: 0.0,),
      body: NotificationListener(
        onNotification: _handle,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                leading: Container(),
                elevation: 0.0,
                forceElevated: false, //即使内容未滚动， 是否显示适合的阴影AppBar
                expandedHeight: 150.0, //完全展开后大小
                backgroundColor: bgColor,
                actions: <Widget>[IconButton(icon: Icon(Icons.search), onPressed: () {})],
                flexibleSpace: FlexibleSpaceBar(
                  title: Text(
                    '我是标题',
                    style: TextStyle(color: txColor),
                  ),
                  background: Container(alignment: Alignment.center, child: Text('background')),
                  centerTitle: true,
                ),
                floating: false, //一旦用户滚动到应用栏，应用栏是否应该变为可见
                pinned: true, //应用栏是否应在滚动视图的开头保持可见。
                primary: true, //此应用栏是否显示在屏幕顶部
              ),
            ];
          },
          body: Text('请上滑看看'),
        ),
      ),
    );
  }
}
