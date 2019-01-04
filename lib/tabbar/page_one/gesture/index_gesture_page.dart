import 'package:flutter/material.dart';

class GesturePage extends StatefulWidget {
  @override
  _GesturePageState createState() => _GesturePageState();
}

class _GesturePageState extends State<GesturePage> {
  String text1 = '';
  String text2 = '';
  String tips = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('手势Gesture'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ListView(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              setState(() {
                text1 = '点击了按钮   onTap';
              });
            },
            onTapCancel: () {
              setState(() {
                print('会先执行onTapDown -> onTapCancel');
                text1 = '点击但移开（取消）了  onTapCancel';
              });
            },
            onLongPress: () {
              setState(() {
                text1 = '长按   onLongPress';
              });
            },
            onDoubleTap: () {
              setState(() {
                text1 = '双击   onDoubleTap';
              });
            },
            onTapDown: (T) {
              setState(() {
                text1 = '点击立即触发此方法   onTapDown';
              });
            },
            onTapUp: (T) {
              setState(() {
                print('点击事件(tap)的执行顺序是onTapDown -> onTapUp -> onTap');
                text1 = '点击离开屏幕时触发   onTapUp';
              });
            },
            child: Container(
              alignment: Alignment(0.0, 0.0),
              margin: EdgeInsets.all(10.0),
              padding: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                  border: Border.all(width: 1.0, color: Colors.blue), color: Colors.blue, borderRadius: BorderRadius.circular(5.0)),
              child: Text(
                '使用（下方提示的）不同手势来和此按钮交互',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.symmetric(horizontal: 10.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(border: Border.all(width: 1.0, color: Colors.blue)),
            child: Text('tips:点击、点击取消、长按、双击'),
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(10.0),
            child: Text(
              text1,
              style: TextStyle(fontSize: 18.0),
            ),
          ),
          GestureDetector(
            onHorizontalDragCancel: () {
              setState(() {
                text2 = '沿水平拖动取消   onHorizontalDragCancel';
              });
            },
            onHorizontalDragStart: (startDetails) {
              setState(() {
                text2 = '横向拖动开始起点--' + startDetails.globalPosition.toString();
              });
            },
            onHorizontalDragEnd: (endDetails) {
              setState(() {
                text2 = '横向拖动结束';
              });
            },
            onHorizontalDragUpdate: (updateDetails) {
              setState(() {
                tips = '手指在屏幕的位置：' + updateDetails.globalPosition.toString();
              });
            },
            onVerticalDragCancel: () {
              setState(() {
                text2 = '沿垂直方向拖动取消   onVerticalDragCancel';
              });
            },
            onVerticalDragStart: (startDetails) {
              setState(() {
                text2 = '竖向拖动开始起点--' + startDetails.globalPosition.toString();
              });
            },
            onVerticalDragEnd: (endDetails) {
              setState(() {
                text2 = '竖向拖动结束';
              });
            },
            onVerticalDragUpdate: (updateDetails) {
              setState(() {
                tips = '手指在屏幕的位置：' + updateDetails.globalPosition.toString();
              });
            },
            child: Container(
              alignment: Alignment(0.0, 0.0),
              margin: EdgeInsets.all(10.0),
              padding: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                  border: Border.all(width: 1.0, color: Colors.blue), color: Colors.blue, borderRadius: BorderRadius.circular(5.0)),
              child: Text(
                '使用（下方提示的）不同手势来和此按钮交互',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.symmetric(horizontal: 10.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(border: Border.all(width: 1.0, color: Colors.blue)),
            child: Text('tips:横向拖动、竖向拖动'),
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(10.0),
            child: Text(
              text2,
              style: TextStyle(fontSize: 18.0),
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(10.0),
            child: Text(tips),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: InkWell(
                onTap: () {},
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(border: Border.all(width: 1.0, color: Colors.blue), borderRadius: BorderRadius.circular(5.0)),
                  child: Text('有水波效果的请使用InkWell'),
                )),
          ),
          Dismissible(
              key: Key('curItem'),
              direction: DismissDirection.startToEnd,
              onDismissed: (direction) {
                showModalBottomSheet(
                    context: context,
                    builder: (_) {
                      return Container(
                        alignment: Alignment.center,
                        child: Text('已被删除！'),
                      );
                    });
              },
              background: Container(
                alignment: Alignment(-1.0, 0.0),
                color: Colors.redAccent,
                child: Text('使用了 Dismissble'),
              ),
              child: Container(
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(width: 1.0, color: Colors.blue),
                ),
                child: Text('向右滑动删除'),
              )),
        ],
      ),
    );
  }
}
