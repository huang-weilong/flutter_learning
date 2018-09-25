import 'package:flutter/material.dart';

import 'layout/listview_layout.dart';
import 'layout/gridview_layout.dart';
import 'layout/row_layout.dart';
import 'layout/column_layout.dart';

class IndexLayoutPage extends StatefulWidget {
  @override
  _IndexLayoutPageState createState() => _IndexLayoutPageState();
}

class _IndexLayoutPageState extends State<IndexLayoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('布局'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Center(
        child: GridView.count(
          crossAxisCount: 4,
          children: <Widget>[
            RaisedButton(
              child: Text('ListView布局'),
              onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => ListViewLayout()));},
            ),
            RaisedButton(
              child: Text('GridView布局'),
              onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => GridViewLayout()));},
            ),
            RaisedButton(
              child: Text('Row布局'),
              onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => RowLayout()));},
            ),
            RaisedButton(
              child: Text('Column布局'),
              onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => ColumnLayout()));},
            ),
          ],
        ),
      ),
    );
  }
}
