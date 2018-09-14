import 'package:flutter/material.dart';

import 'dart:async';

class IndexMarqueePage extends StatefulWidget {
  @override
  _IndexMarqueePageState createState() => _IndexMarqueePageState();
}

class _IndexMarqueePageState extends State<IndexMarqueePage> with SingleTickerProviderStateMixin {
  ScrollController scrollController;
  double screenWidth;
  double position=0.0;
  Timer timer;
  String text="ListView滚动列表控件，能将子控件组成可滚动的列表。当你需要排列的子控件超出容器大小";
  List<Widget> widgets=List();

  @override
  void initState() {
    super.initState();
    scrollController=ScrollController();
    timer=Timer.periodic(Duration(milliseconds: 100), (timer){
      double maxScrollExtent=scrollController.position.maxScrollExtent;
      double pixels=scrollController.position.pixels;
      if(pixels+3.0>=maxScrollExtent){
        position=(maxScrollExtent-screenWidth/4+screenWidth)/2-screenWidth+pixels-maxScrollExtent;
        scrollController.jumpTo(position);
      }
      position+=10.0;
      scrollController.animateTo(position,duration: Duration(milliseconds: 90),curve: Curves.linear);
    });
  }


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    screenWidth=MediaQuery.of(context).size.width;
    widgets.add(Text(text,style: TextStyle(fontSize: 16.0)));
    widgets.add(Container(width: screenWidth/4));
    widgets.add(Text(text,style: TextStyle(fontSize: 16.0)));
  }


  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("跑马灯"),
        elevation: 0.0,
      ),
      body: ListView(
        scrollDirection: Axis.horizontal,
        controller: scrollController,
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          widgets[0],
          widgets[1],
          widgets[2],
        ],
      ),
    );
  }
}
