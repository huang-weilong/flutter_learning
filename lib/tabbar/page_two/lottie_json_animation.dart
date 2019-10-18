//import 'dart:async';
//import 'dart:convert';
//import 'dart:ui';
//import 'package:lottie_flutter/lottie_flutter.dart';
//import 'package:flutter/material.dart';
//import 'package:flutter/services.dart' show rootBundle;
//
//const List<String> assetNames = const <String>[
//  'assets/json/Indicators2.json',
//  'assets/json/happy_gift.json',
//  'assets/json/empty_box.json',
//  'assets/json/muzli.json',
//  'assets/json/hamburger_arrow.json',
//  'assets/json/motorcycle.json',
//  'assets/json/emoji_shock.json',
//  'assets/json/checked_done_.json',
//  'assets/json/favourite_app_icon.json',
//  'assets/json/preloader.json',
//  'assets/json/walkthrough.json',
//  'assets/json/test.json',
//  'assets/json/data.json'
//];
//
//class LottieJsonAnimation extends StatefulWidget {
//  LottieJsonAnimation({Key key}) : super(key: key);
//
//  @override
//  _LottieJsonAnimationState createState() => _LottieJsonAnimationState();
//}
//
//class _LottieJsonAnimationState extends State<LottieJsonAnimation> with SingleTickerProviderStateMixin {
//  LottieComposition _composition;
//  String _assetName;
//  AnimationController _controller;
//  bool _repeat;
//
//  @override
//  void initState() {
//    super.initState();
//
//    _repeat = false;
//    //_loadButtonPressed(assetNames[6]);
//    _controller = AnimationController(
//      duration: Duration(milliseconds: 1),
//      vsync: this,
//    );
//    _controller.addListener(() => setState(() {}));
//  }
//
//  void _loadButtonPressed(String assetName) {
//    loadAsset(assetName).then((LottieComposition composition) {
//      setState(() {
//        _assetName = assetName;
//        _composition = composition;
//        _controller.reset();
//      });
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('json动画'),
//        elevation: 0.0,
//      ),
//      body: Center(
//        child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          mainAxisSize: MainAxisSize.min,
//          crossAxisAlignment: CrossAxisAlignment.center,
//          children: <Widget>[
//            DropdownButton<String>(
//              items: assetNames
//                  .map((String assetName) => DropdownMenuItem<String>(
//                        child: Text(assetName),
//                        value: assetName,
//                      ))
//                  .toList(),
//              hint: Text('选择一个动画'),
//              value: _assetName,
//              onChanged: (String val) => _loadButtonPressed(val),
//            ),
//            Text(_composition?.bounds?.size?.toString() ?? ''),
//            Lottie(
//              composition: _composition,
//              size: Size(300.0, 300.0),
//              controller: _controller,
//            ),
//            Slider(
//              value: _controller.value,
//              onChanged: _composition != null ? (double val) => setState(() => _controller.value = val) : null,
//            ),
//            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
//              IconButton(
//                icon: Icon(Icons.repeat),
//                color: _repeat ? Colors.black : Colors.black45,
//                onPressed: () => setState(() {
//                      _repeat = !_repeat;
//                      if (_controller.isAnimating) {
//                        if (_repeat) {
//                          _controller.forward().then<Null>((nul) => _controller.repeat());
//                        } else {
//                          _controller.forward();
//                        }
//                      }
//                    }),
//              ),
//              IconButton(
//                icon: Icon(Icons.fast_rewind),
//                onPressed: _controller.value > 0 && _composition != null ? () => setState(() => _controller.reset()) : null,
//              ),
//              IconButton(
//                icon: _controller.isAnimating ? Icon(Icons.pause) : Icon(Icons.play_arrow),
//                onPressed: _controller.isCompleted || _composition == null
//                    ? null
//                    : () {
//                        setState(() {
//                          if (_controller.isAnimating) {
//                            _controller.stop();
//                          } else {
//                            if (_repeat) {
//                              _controller.repeat();
//                            } else {
//                              _controller.forward();
//                            }
//                          }
//                        });
//                      },
//              ),
//              IconButton(
//                icon: Icon(Icons.stop),
//                onPressed: _controller.isAnimating && _composition != null
//                    ? () {
//                        _controller.reset();
//                      }
//                    : null,
//              ),
//            ]),
//          ],
//        ),
//      ),
//    );
//  }
//}
//
//Future<LottieComposition> loadAsset(String assetName) async {
//  return await rootBundle
//      .loadString(assetName)
//      .then<Map<String, dynamic>>((String data) => json.decode(data))
//      .then((Map<String, dynamic> map) => new LottieComposition.fromMap(map));
//}
