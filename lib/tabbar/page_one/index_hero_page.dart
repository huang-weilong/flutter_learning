import 'package:flutter/material.dart';

class IndexHeroPage extends StatefulWidget {
  @override
  _IndexHeroPageState createState() => _IndexHeroPageState();
}


///英雄动画，tag相同的触发英雄动画。
class _IndexHeroPageState extends State<IndexHeroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('触发英雄动画'),
        centerTitle: true,
        elevation: 0.0,
      ),
      backgroundColor: Colors.grey,
      body: Center(
        child: GestureDetector(
          child: Hero(
            child: Image.asset('assets/images/long.jpg',width: 100.0,),
            tag: 'long',
          ),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => _HeroTest()));
          },
        ),
      )
    );
  }
}

class _HeroTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      child: Hero(
        child: Image.asset('assets/images/long.jpg'),
        tag: 'long',
      ),
      onTap: () {
        Navigator.pop(context);
      },
    );
  }

}