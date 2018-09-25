import 'package:flutter/material.dart';

import 'page_two/map_page.dart';
import 'page_two/charts_page.dart';

class TabbarPage2 extends StatefulWidget {
  @override
  _TabbarPage2State createState() => _TabbarPage2State();
}

class _TabbarPage2State extends State<TabbarPage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('插件'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: GridView.count(
        crossAxisCount: 4,
        children: <Widget>[
          RaisedButton(
            child: Text('地图'),
            onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (_)=>MapPage()));},
          ),
          RaisedButton(
            child: Text('图表'),
            onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (_)=>ChartsPage()));},
          ),
        ],
      ),
    );
  }
}
