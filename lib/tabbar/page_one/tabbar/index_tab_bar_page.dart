import 'package:flutter/material.dart';

class IndexTabBarPage extends StatefulWidget {
  @override
  _IndexTabBarPageState createState() => _IndexTabBarPageState();
}

class _IndexTabBarPageState extends State<IndexTabBarPage> {
  @override
  Widget build(BuildContext context) {
    ///如果未提供TabController，则必须提供DefaultTabController祖先，TabController.length必须等于选项卡列表的长度
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('使用DefaultTabController'),
          centerTitle: true,
          elevation: 0.0,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(24.0),
            child: TabBar(
//              isScrollable: true,///每个选项卡的宽度和其标签所需的宽度一致，否则每个标签宽度一致
              tabs: <Widget>[
                Text('TabBar1'),
                Text('TabBar2'),
                Text('TabBar3')
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Text('TabBarView1的内容'),
            Text('TabBarView2的内容'),
            Text('TabBarView3的内容'),
          ],
        ),
      ),
    );
  }
}
