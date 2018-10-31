import 'package:flutter/material.dart';

class IndexTabBarViewPage extends StatefulWidget {
  @override
  _IndexTabBarViewPageState createState() => _IndexTabBarViewPageState();
}

class _IndexTabBarViewPageState extends State<IndexTabBarViewPage> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 4);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _nextPage(int delta) {
    final int index = _tabController.index + delta;
    if (index < 0 || index >= _tabController.length) return;
    _tabController.animateTo(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('使用了TabController'),
        elevation: 0.0,
        leading: IconButton(
          tooltip: 'Previous choice',
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            _nextPage(-1);
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.arrow_forward),
            tooltip: 'Next choice',
            onPressed: () {
              _nextPage(1);
            },
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(48.0),
          child: Theme(
            data: Theme.of(context).copyWith(accentColor: Colors.white),
            child: Container(
              height: 48.0,
              alignment: Alignment.center,
//              child: TabPageSelector(controller: _tabController),//滑动的小圆点
              child: TabBar(
//              isScrollable: true,///每个选项卡的宽度和其标签所需的宽度一致，否则每个标签宽度一致
                controller: _tabController,
                indicatorColor: Colors.transparent,
                tabs: <Widget>[Text('TabBar1'), Text('TabBar2'), Text('TabBar3'), Text('TabBar4')],
              ), //滑动的小圆,
            ),
          ),
        ),
      ),
      body: TabBarView(
        //TabBar内容
        controller: _tabController,
        children: <Widget>[
          Text('TabBarView1的内容，添加key: PageStorageKey(\'tab2\'),可以使tabbarview保持当前状态'),
          ListView.builder(
            key: PageStorageKey('tab2'),
            itemCount: 60,
            itemBuilder: (BuildContext context, int index){
              return Text('-----$index');
            },
          ),
          ListView.builder(
//            key: PageStorageKey('tab3'),
            itemCount: 60,
            itemBuilder: (BuildContext context, int index){
              return Text('-----$index');
            },
          ),
          Text('TabBarView4的内容'),
        ],
//        children: choices.map((Choice choice) {
//          return Padding(
//            padding: const EdgeInsets.all(16.0),
//            child: ChoiceCard(choice: choice),
//          );
//        }).toList(),
      ),
    );
  }
}
