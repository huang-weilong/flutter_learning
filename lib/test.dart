import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class DragPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DragPageState();
  }
}

class DD {
  String d;
  DD({this.d});
}

class _DragPageState extends State<DragPage> with SingleTickerProviderStateMixin {
  TabController _tabController;
  DD dd;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    print('===========>> ${dd?.d == '' ? 'ffffff' : 'ggggggg'}');
    Future.delayed(Duration(seconds: 3), () {
      // 判断该页面是否还在树中
      print('=====================================${this.mounted}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('test'),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Map aa = {"content": "{\"push\":1,\"title\":\"试验箱区域1, 温湿度仪发生告警\"}"};
                print('========> ${json.decode(aa['content'])}');
              })
        ],
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  const Color(0xffFF7F29),
                  const Color(0xffFF570F),
                ],
              ),
            ),
            height: 214.0,
            width: double.infinity,
          ),
          Column(
            children: <Widget>[
              Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Image.asset(
                      'assets/images/voice.png',
//                        width: winWidth(context),
                      width: 50.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '现金收益',
                          style: const TextStyle(
                            fontSize: 18.0,
                            color: const Color(0xff1F1E1D),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
//                           Space(height: 2.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              '${100.01}',
                              style: const TextStyle(
                                fontSize: 30.0,
                                color: const Color(0xffFF4C00),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            RaisedButton(
                              onPressed: () {},
                              child: Text('去提现'),
                            )
                          ],
                        )
                      ],
                    ),
                    padding: const EdgeInsets.all(25.0),
                  ),
                ],
              ),
//                 Space(),
              Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  Container(
                    height: 180,
                    margin: EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xffFFE1CE),
                          offset: const Offset(0, 5),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: Column(
                      children: <Widget>[
                        TabBar(
                          indicatorSize: TabBarIndicatorSize.label,
                          labelColor: Colors.red,
                          indicatorColor: Colors.blue,
                          unselectedLabelColor: Colors.grey,
                          labelStyle: TextStyle(fontSize: 16.0),
                          controller: _tabController,
                          tabs: [
                            Text('现金收益'),
                            Text('铜板收益'),
                          ],
                        ),
                        Container(
                          height: 60,
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(
                                width: 1.0,
                                color: Color(0xffD8D8D8),
                              ),
                            ),
                          ),
                          child: TabBarView(
                            physics: NeverScrollableScrollPhysics(),
                            //设置滑动的效果，这个禁用滑动
                            controller: _tabController,
                            children: <Widget>[
                              Text('1'),
                              Text('1'),
                            ],
                          ),
                        )
                      ],
                    ),
                    padding: EdgeInsets.all(10),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
