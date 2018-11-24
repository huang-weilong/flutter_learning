import 'package:flutter/material.dart';
import 'dart:async';

import 'package:dio/dio.dart';

class DioPage extends StatefulWidget {
  @override
  _DioPageState createState() => _DioPageState();
}

class _DioPageState extends State<DioPage> {
  String data = '';
  String tip = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('dio请求http'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Center(child: Text(tip)),
      floatingActionButton: FloatingActionButton(
        child: Text('get'),
        onPressed: () {
          setState(() => tip = '请自行输入测试链接进行测试');
        },
      ),
    );
  }

  Future<bool> getPlacesInfoList() async {
    try {
      String url = 'url地址';
      Options options = Options(headers: {'Authorization': 'xxxxx'});
      Response response = await Dio(options).get(url, data: {
        'page': 1,
        'rows': 1000,
        'sidx': 'last_update_date',
        'sord': 'desc',
      });
      setState(() {
        data = response.data.toString();
      });
      print(response.data);
      return true;
    } on DioError catch (e) {
      print(e);
      return false;
    }
  }
}
