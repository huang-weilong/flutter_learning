import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'charts/simple_bar_chart.dart';
import 'charts/grouped_bar_chart.dart';

class ChartsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('图表'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.insert_chart),
              title: Text('简单的柱状图'),
              onTap: (){
                Navigator.push(context, CupertinoPageRoute(builder: (_)=>SimpleBarChart.withRandomData()));
              },
            ),
            ListTile(
              leading: Icon(Icons.insert_chart),
              title: Text('柱状组图'),
              onTap: (){
                Navigator.push(context, CupertinoPageRoute(builder: (_)=>GroupedBarChart.withRandomData()));
              },
            )
          ],
        ),
      ),
    );
  }
}
