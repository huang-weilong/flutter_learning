import 'package:flutter/material.dart';

class IndexAnimatedCrossFade extends StatefulWidget {
  @override
  _IndexAnimatedCrossFadeState createState() => _IndexAnimatedCrossFadeState();
}

class _IndexAnimatedCrossFadeState extends State<IndexAnimatedCrossFade> {
  bool flag = true;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedCrossFade'),
        centerTitle: true,
        elevation: 0.0,
        actions: <Widget>[
          IconButton(icon: Text('切换'), onPressed: (){
            setState(() {
              flag = !flag;
            });
          })
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          AnimatedCrossFade(
            duration: Duration(seconds: 3),
            firstChild: FlutterLogo(style: FlutterLogoStyle.horizontal, size: 300.0),
            secondChild: FlutterLogo(style: FlutterLogoStyle.stacked, size: 100.0),
            crossFadeState: flag ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          ),
          Text('一个小部件，它在两个给定的子节点之间交叉淡化，并在它们的大小之间设置动画。')
        ],
      ),
    );
  }
}
