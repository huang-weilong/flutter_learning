import 'package:flutter/material.dart';

class GridViewLayout extends StatefulWidget {
  @override
  _GridViewLayoutState createState() => _GridViewLayoutState();
}

class _GridViewLayoutState extends State<GridViewLayout> {
  int flag;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GridView布局'),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.flag),tooltip: 'builder方法', onPressed: (){_changeFlag(1);}),
          IconButton(icon: Icon(Icons.opacity),tooltip: 'count方法', onPressed: (){_changeFlag(2);}),
          IconButton(icon: Icon(Icons.star),tooltip: 'extent方法', onPressed: (){_changeFlag(3);})
        ],
      ),
      body: _buildGridViewLayout(),
      floatingActionButton: FloatingActionButton(
        child: IconButton(icon: Text('长按我！'),tooltip: '长按左上角图标可以知道使用的是GridView的什么构造方法', onPressed:(){}),
        onPressed: (){},
      )
    );
  }

  _changeFlag(int a) {
    setState(() {
      flag = a;
    });
  }

  Widget _buildGridViewLayout() {
    if (flag == 1) {
      return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
        ),
//        itemCount: 18,//创建18个，不写则创建无限个
        itemBuilder: (context, index) {
          return Icon(Icons.thumb_up);
        },
      );
    } else if (flag == 2) {
      return GridView.count(
        crossAxisCount: 4,
        children: <Widget>[
          Icon(Icons.access_alarm),
          Icon(Icons.access_alarm),
          Icon(Icons.access_alarm),
          Icon(Icons.access_alarm),
          Icon(Icons.access_alarm),
          Icon(Icons.access_alarm),
          Icon(Icons.access_alarm),
          Icon(Icons.access_alarm),
          Icon(Icons.access_alarm),
          Icon(Icons.access_alarm),
          Icon(Icons.access_alarm),
        ],
      );
    } else if (flag == 3) {
      return GridView.extent(
        maxCrossAxisExtent: 50.0,
        children: <Widget>[
          Icon(Icons.star),
          Icon(Icons.star),
          Icon(Icons.star),
          Icon(Icons.star),
          Icon(Icons.star),
          Icon(Icons.star),
          Icon(Icons.star),
          Icon(Icons.star),
          Icon(Icons.star),
          Icon(Icons.star),
          Icon(Icons.star),
          Icon(Icons.star),
          Icon(Icons.star),
          Icon(Icons.star),
          Icon(Icons.star),
          Icon(Icons.star),
          Icon(Icons.star),
          Icon(Icons.star),
        ],
      );
    }
    return null;
  }
}
