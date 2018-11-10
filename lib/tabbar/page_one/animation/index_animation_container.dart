import 'package:flutter/material.dart';

class IndexAnimationContainer extends StatefulWidget {
  @override
  _IndexAnimationContainerState createState() => _IndexAnimationContainerState();
}

class _IndexAnimationContainerState extends State<IndexAnimationContainer> {
  Color color = Colors.blue;
  double width = 100.0;
  double height = 100.0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimationContainer'),
        centerTitle: true,
        elevation: 0.0,
        actions: <Widget>[
          IconButton(icon: Text('变色'), onPressed: (){
            setState(() {
              if (color == Colors.blue) color = Colors.red;
              else if (color == Colors.red) color = Colors.green;
              else color = Colors.blue;
            });
          }),
          IconButton(icon: Text('宽高'), onPressed: (){
            setState(() {
              if (width == 100.0) { width = 300.0; height = 300.0;}
              else if (width == 300.0) {width = 50.0; height = 200.0;}
              else { width = 100.0; height = 50.0;}
            });
          },)
        ],
      ),
      body: Center(
        child: AnimatedContainer(
          duration: Duration(seconds: 1),
          color: color,
          width: width,
          height: height,
          curve: Curves.linear,
        ),
      ),
    );
  }
}
