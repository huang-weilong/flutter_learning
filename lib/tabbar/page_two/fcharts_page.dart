import 'package:flutter/material.dart';

import 'fcharts/line_chart1.dart';
import 'fcharts/line_chart2.dart';

class FChartsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('fcharts'),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.insert_chart),
            title: Text('简单的折线图'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => LineChart1()));
            },
          ),
          ListTile(
            leading: Icon(Icons.insert_chart),
            title: Text('简单的折线图2'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => LineChart2()));
            },
          ),
        ],
      ),
    );
  }
}
