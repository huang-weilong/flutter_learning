import 'package:flutter/material.dart';

class IndexExpansionTilePage extends StatefulWidget {
  @override
  _IndexExpansionTilePageState createState() => _IndexExpansionTilePageState();
}

class _IndexExpansionTilePageState extends State<IndexExpansionTilePage> with SingleTickerProviderStateMixin{
  Animation animation;
  AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    animation = Tween(begin: 0.0, end: 0.5).animate(animationController);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ExpansionTile'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ListView(
        children: <Widget>[
          ExpansionTile(
            title: Text('更多'),
            children: <Widget>[
              Container(
                child: Text('111111111111'),
              )
            ],
          ),
          ExpansionTile(
            leading: Icon(Icons.ac_unit),
            title: Text('more'),
            backgroundColor: Colors.blueGrey,
            children: <Widget>[
              Container(
                height: 100.0,
                color: Colors.orange,
              )
            ],
          ),
          ExpansionTile(
            title: Text('默认展开'),
            initiallyExpanded: true,
            trailing: RotationTransition(
              turns: animation,
              child: Icon(Icons.forward),
            ),
            onExpansionChanged: (value) {
              _changeIcon(value);
            },
            children: <Widget>[
              Container(
                height: 100.0,
                color: Colors.deepOrange,
                child: Text('使用animation改变右边的图标方向'),
              )
            ],
          ),
        ],
      ),
    );
  }



  _changeIcon(bool expand) {
    setState(() {
      if(expand)
        animationController.forward();
      else
        animationController.reverse();
    });
  }
}
