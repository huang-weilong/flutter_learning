import 'package:flutter/material.dart';

import '../../widget/carousel.dart';

class CarouselImages extends StatefulWidget {
  @override
  _CarouselImagesState createState() => _CarouselImagesState();
}

class _CarouselImagesState extends State<CarouselImages> {
  List<String> images = ['assets/images/067.jpg', 'assets/images/background.jpg', 'assets/images/img.jpg', 'assets/images/long.jpg'];
  List<String> str = ['111', '222', '333'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('轮播图'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 300.0,
            child: Carousel(
              autoPlay: true,
              dotSize: 6.0,
              showIndicators: true,
              viewportFraction: 0.8,
              children: images.map((dir) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Card(
                    child: Image.asset(dir, fit: BoxFit.cover),
                  ),
                );
              }).toList(),
            ),
          ),
          Container(
            height: 200.0,
            child: Carousel(
              autoPlay: true,
              children: str.map((text) {
                return Center(child: Text(text));
              }).toList(),
            ),
          )
        ],
      ),
    );
  }
}
