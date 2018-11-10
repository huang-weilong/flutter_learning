import 'package:flutter/material.dart';

class MapToList extends StatefulWidget {
  @override
  _MapToListState createState() => _MapToListState();
}

class _MapToListState extends State<MapToList> {
  List<String> str=[];
  List<String> list;
  bool flag = true;

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 20; i++)
      str.insert(i, 'Item $i');
    list = List<String>.generate(20, (int index) {
      return 'generate $index';
    });
  }

  @override
  Widget build(BuildContext context) {
    /// 方法一
    Iterable<Widget> aa = list.map((String ss) {
      return buildItem(ss);
    });
    aa = ListTile.divideTiles(context: context,tiles: aa);

    return Scaffold(
      appBar: AppBar(
        title: Text('xx.map(xxx).toList的简单使用'),
        centerTitle: true,
        elevation: 0.0,
        actions: <Widget>[
          IconButton(icon: Text('切换方式'), onPressed: (){
            setState(() => flag = !flag);
          })
        ],
      ),
      body:
      /// 方法一
      flag ? ListView(
        children: aa.toList()
      ):
      /// 方法二
      ListView(
        children: str.map(buildItem).toList(),
      )
    );
  }

  Widget buildItem(String str) {
    return Text(str);
  }
}
