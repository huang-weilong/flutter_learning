import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter_learning/tabbar/page_two/charts/widgets/flutter_bar_chart.dart';
import 'package:xml_layout/xml_layout.dart';
// import 'package:xml/xml.dart';
import 'package:xml_parser/xml_parser.dart';

class XmlPage extends StatefulWidget {
  @override
  _XmlPageState createState() => _XmlPageState();
}

class _XmlPageState extends State<XmlPage> {
  final bookshelfXml = '''
    <widget type="Column">
      <widget type="Container">
        <widget type="Text" value="文本"></widget>
      </widget>
      <widget type="Padding" top="20" left="20">
        <widget type="FlutterBarChart" data='[
      {"year": "2014年", "value": 100},
      {"year": "2015年", "value": 130},
      {"year": "2016年", "value": 70},
      {"year": "2017年", "value": 200}
    ]' showLegend="true"></widget>
      </widget>
    </widget>
    ''';
  Widget w;

  @override
  void initState() {
    super.initState();
    XmlLayout.register('', (node, key) => null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('xml'),
        elevation: 0.0,
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              var document = XmlDocument.fromString(bookshelfXml);
              var v = [
                {'year': '2014年', 'value': 100},
                {'year': '2015年', 'value': 130},
                {'year': '2016年', 'value': 90},
                {'year': '2017年', 'value': 200},
              ];

              w = buildWidget(document.root);
              /*for (XmlElement v in document.children) {
                print(v.getAttribute("type"));
                w = a(v.children);
              }*/
              setState(() {});
            },
            child: Text('测试'),
          ),
          if (w != null) w
        ],
      ),
    );
  }

  /// Column
  ///   - Container
  ///        -  Text
  ///   - Container
  ///        - Text
  Widget buildWidget(XmlElement child) {
    print('----' + child.getAttribute("type") + child?.children?.length.toString());

    String type = child.getAttribute('type');
    // 多个child
    if (child.children != null && child.children.length > 1) {
      if (type == 'Column') {
        List<Widget> _temp = [];
        for (var v in child.children) {
          _temp.add(buildWidget(v));
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: _temp,
        );
      } else if (type == 'Row') {
        List<Widget> _temp = [];
        for (var v in child.children) {
          _temp.add(buildWidget(v));
        }
        return Row(
          children: _temp,
        );
      }
    } else {
      // 单个child
      if (type == 'Container') {
        return Container(child: buildWidget(child.firstChild));
      } else if (type == 'Text') {
        return Text(child.getAttribute('value'));
      } else if (type == 'Padding') {
        print('---> ${double.tryParse(child.getAttribute('left'))}');
        print('---> ${double.tryParse(child.getAttribute('top'))}');
        return Padding(
            padding: EdgeInsets.fromLTRB(
              double.tryParse(child.getAttribute('left').toString()) ?? 0.0,
              double.tryParse(child.getAttribute('top').toString()) ?? 0.0,
              double.tryParse(child.getAttribute('right').toString()) ?? 0.0,
              double.tryParse(child.getAttribute('bottom').toString()) ?? 0.0,
            ),
            child: buildWidget(child.firstChild));
      } else if (type == 'FlutterBarChart') {
        String v = child.getAttribute('data');
        List data = json.decode(v);
        List<DataModel> _dataModel = [];
        data.forEach((element) {
          _dataModel.add(DataModel(element['year'].toString(), element['value']));
        });

        List<charts.Series<DataModel, String>> chartData1 = [
          charts.Series<DataModel, String>(
            id: 'A',
            colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
            domainFn: (DataModel sales, _) => sales.xAxis,
            measureFn: (DataModel sales, _) => sales.value,
            data: _dataModel,
            // 设置标签访问器以控制条形标签的文本。能够在柱状图显示数值
            labelAccessorFn: (DataModel sales, _) => '${sales.value.toString()}',
          )
        ];
        print('==> ${child.getAttribute('showLegend')}');
        return FlutterBarChart(chartData1);
      }
    }
    return Container();
  }
}

class DataModel {
  final String xAxis;
  final int value;

  DataModel(this.xAxis, this.value);
}
