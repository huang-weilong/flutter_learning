import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

const List<String> assetNames = const <String>[
  'assets/json/Indicators2.json',
  'assets/json/happy_gift.json',
  'assets/json/empty_box.json',
  'assets/json/muzli.json',
  'assets/json/hamburger_arrow.json',
  'assets/json/motorcycle.json',
  'assets/json/emoji_shock.json',
  'assets/json/checked_done_.json',
  'assets/json/favourite_app_icon.json',
  'assets/json/preloader.json',
  'assets/json/walkthrough.json',
  'assets/json/test.json',
  'assets/json/data.json'
];

class LottieJsonAnimation extends StatefulWidget {
  LottieJsonAnimation({Key key}) : super(key: key);

  @override
  _LottieJsonAnimationState createState() => _LottieJsonAnimationState();
}

class _LottieJsonAnimationState extends State<LottieJsonAnimation> with SingleTickerProviderStateMixin {
  String _assetName = 'assets/json/Indicators2.json';
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: Duration(milliseconds: 1), vsync: this);
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _controller.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('json动画'),
        elevation: 0.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            DropdownButton<String>(
              items: assetNames
                  .map((String assetName) => DropdownMenuItem<String>(
                        child: Text(assetName),
                        value: assetName,
                      ))
                  .toList(),
              hint: Text('选择一个动画'),
              value: _assetName,
              onChanged: (String val) {
                setState(() {
                  _assetName = val;
                });
              },
            ),
            Lottie.asset(
              _assetName,
              width: 300.0,
              height: 300.0,
              controller: _controller,
              onLoaded: (composition) {
                _controller
                  ..duration = Duration(seconds: 2)
                  ..forward()
                  ..repeat();
              },
            ),
            AnimatedBuilder(
                animation: _controller,
                builder: (context, _) {
                  return Slider(
                    value: _controller.value,
                    onChanged: (double val) => setState(() => _controller.value = val),
                  );
                }),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              IconButton(
                icon: Icon(Icons.fast_rewind),
                onPressed: _controller.value > 0 ? () => setState(() => _controller.reset()) : null,
              ),
              IconButton(
                icon: _controller.isAnimating ? Icon(Icons.pause) : Icon(Icons.play_arrow),
                onPressed: () {
                  setState(() {
                    if (_controller.isAnimating) {
                      _controller.stop();
                    } else {
                      _controller.repeat();
                    }
                  });
                },
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
