//import 'package:flutter/material.dart';
//import 'package:custom_chewie/custom_chewie.dart';
//import 'package:video_player/video_player.dart';
//
//
//class VideoChewie extends StatefulWidget {
//  @override
//  _VideoChewieState createState() => _VideoChewieState();
//}
//
//class _VideoChewieState extends State<VideoChewie> {
//  VideoPlayerController controller;
//
//  @override
//  void initState() {
//    // TODO: implement initState
//    super.initState();
//    controller = VideoPlayerController.network(
//      'http://hd.yinyuetai.com/uploads/videos/common/BB87016532900E3929D35E14BF2C6C40.mp4?sc=caa3f4d07b7b9d73&br=1092&vid=3268868&aid=29074&area=ML&vst=0',
//    );
//  }
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: Chewie(
//        controller,
//        aspectRatio: 3 / 2,
//        autoPlay: true,
//      ),
//    );
//  }
//}
