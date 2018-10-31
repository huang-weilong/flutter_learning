//import 'package:flutter/material.dart';
//
//import 'package:video_player/video_player.dart';
//
//class VideoPlayerSample extends StatefulWidget {
//  @override
//  _VideoPlayerSampleState createState() => _VideoPlayerSampleState();
//}
//
//class _VideoPlayerSampleState extends State<VideoPlayerSample> {
//  VideoPlayerController _controller;
//  bool _isPlaying = false;
//
//  @override
//  void initState() {
//    super.initState();
//    _controller = VideoPlayerController.network(
//      'http://221.228.226.5/14/z/w/y/y/zwyyobhyqvmwslabxyoaixvyubmekc/sh.yinyuetai.com/4599015ED06F94848EBF877EAAE13886.mp4',
//    )
//      ..addListener(() {
//        final bool isPlaying = _controller.value.isPlaying;
//        if (isPlaying != _isPlaying) {
//          setState(() {
//            _isPlaying = isPlaying;
//          });
//        }
//      })
//      ..initialize().then((_) {
//        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
//        setState(() {});
//      });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: _controller.value.initialized
//          ? AspectRatio(
//        aspectRatio: _controller.value.aspectRatio,
//        child: VideoPlayer(_controller),
//      )
//          : Container(),
//      floatingActionButton: FloatingActionButton(
//        onPressed: _controller.value.isPlaying
//            ? _controller.pause
//            : _controller.play,
//        child: Icon(
//          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
//        ),
//      ),
//    );
//  }
//}
