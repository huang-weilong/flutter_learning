//import 'package:flutter/material.dart';
//
//import 'package:video_player/video_player.dart';
//
//class NetworkPlayerLifeCycle extends PlayerLifeCycle {
//  NetworkPlayerLifeCycle(String dataSource, VideoWidgetBuilder childBuilder)
//      : super(dataSource, childBuilder);
//
//  @override
//  _NetworkPlayerLifeCycleState createState() => _NetworkPlayerLifeCycleState();
//}
//
//class _NetworkPlayerLifeCycleState extends _PlayerLifeCycleState {
//  @override
//  VideoPlayerController createVideoPlayerController() {
//    return VideoPlayerController.network(widget.dataSource);
//  }
//}
//
//typedef Widget VideoWidgetBuilder(
//    BuildContext context, VideoPlayerController controller);
//
//abstract class PlayerLifeCycle extends StatefulWidget {
//  PlayerLifeCycle(this.dataSource, this.childBuilder);
//
//  final VideoWidgetBuilder childBuilder;
//  final String dataSource;
//}
//
//abstract class _PlayerLifeCycleState extends State<PlayerLifeCycle> {
//  VideoPlayerController controller;
//
//  @override
//
//  /// Subclasses should implement [createVideoPlayerController], which is used
//  /// by this method.
//  void initState() {
//    super.initState();
//    controller = createVideoPlayerController();
//    controller.addListener(() {
//      if (controller.value.hasError) {
//        print(controller.value.errorDescription);
//      }
//    });
//    controller.initialize();
//    controller.setLooping(true);
//    controller.play();
//  }
//
//  @override
//  void deactivate() {
//    super.deactivate();
//  }
//
//  @override
//  void dispose() {
//    controller.dispose();
//    super.dispose();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return widget.childBuilder(context, controller);
//  }
//
//  VideoPlayerController createVideoPlayerController();
//}
//
//class AspectRatioVideo extends StatefulWidget {
//  AspectRatioVideo(this.controller);
//
//  final VideoPlayerController controller;
//
//  @override
//  AspectRatioVideoState createState() => AspectRatioVideoState();
//}
//
//class AspectRatioVideoState extends State<AspectRatioVideo> {
//  VideoPlayerController get controller => widget.controller;
//  bool initialized = false;
//
//  VoidCallback listener;
//
//  @override
//  void initState() {
//    super.initState();
//    listener = () {
//      if (!mounted) {
//        return;
//      }
//      if (initialized != controller.value.initialized) {
//        initialized = controller.value.initialized;
//        setState(() {});
//      }
//    };
//    controller.addListener(listener);
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    if (initialized) {
//      final Size size = controller.value.size;
//      return Center(
//        child: AspectRatio(
//          aspectRatio: size.width / size.height,
//          child: VideoPlayPause(controller),
//        ),
//      );
//    } else {
//      return Container();
//    }
//  }
//}
//
//class VideoPlayPause extends StatefulWidget {
//  VideoPlayPause(this.controller);
//
//  final VideoPlayerController controller;
//
//  @override
//  State createState() {
//    return _VideoPlayPauseState();
//  }
//}
//
//class _VideoPlayPauseState extends State<VideoPlayPause> {
//  _VideoPlayPauseState() {
//    listener = () {
//      setState(() {});
//    };
//  }
//
//  FadeAnimation imageFadeAnim =
//  FadeAnimation(child: const Icon(Icons.play_arrow, size: 100.0));
//  VoidCallback listener;
//
//  VideoPlayerController get controller => widget.controller;
//
//  @override
//  void initState() {
//    super.initState();
//    controller.addListener(listener);
//    controller.setVolume(1.0);
//    controller.play();
//  }
//
//  @override
//  void deactivate() {
//    controller.setVolume(0.0);
//    controller.removeListener(listener);
//    super.deactivate();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    final List<Widget> children = <Widget>[
//      GestureDetector(
//        child: VideoPlayer(controller),
//        onTap: () {
//          if (!controller.value.initialized) {
//            return;
//          }
//          if (controller.value.isPlaying) {
//            imageFadeAnim =
//                FadeAnimation(child: const Icon(Icons.pause, size: 100.0));
//            controller.pause();
//          } else {
//            imageFadeAnim =
//                FadeAnimation(child: const Icon(Icons.play_arrow, size: 100.0));
//            controller.play();
//          }
//        },
//      ),
//      Align(
//        alignment: Alignment.bottomCenter,
//        child: VideoProgressIndicator(
//          controller,
//          allowScrubbing: true,
//        ),
//      ),
//      Center(child: imageFadeAnim),
//      Center(
//          child: controller.value.isBuffering
//              ? const CircularProgressIndicator()
//              : null),
//    ];
//
//    return Stack(
//      fit: StackFit.passthrough,
//      children: children,
//    );
//  }
//}
//
//class FadeAnimation extends StatefulWidget {
//  FadeAnimation(
//      {this.child, this.duration = const Duration(milliseconds: 500)});
//
//  final Widget child;
//  final Duration duration;
//
//  @override
//  _FadeAnimationState createState() => _FadeAnimationState();
//}
//
//class _FadeAnimationState extends State<FadeAnimation>
//    with SingleTickerProviderStateMixin {
//  AnimationController animationController;
//
//  @override
//  void initState() {
//    super.initState();
//    animationController =
//        AnimationController(duration: widget.duration, vsync: this);
//    animationController.addListener(() {
//      if (mounted) {
//        setState(() {});
//      }
//    });
//    animationController.forward(from: 0.0);
//  }
//
//  @override
//  void deactivate() {
//    animationController.stop();
//    super.deactivate();
//  }
//
//  @override
//  void didUpdateWidget(FadeAnimation oldWidget) {
//    super.didUpdateWidget(oldWidget);
//    if (oldWidget.child != widget.child) {
//      animationController.forward(from: 0.0);
//    }
//  }
//
//  @override
//  void dispose() {
//    animationController.dispose();
//    super.dispose();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return animationController.isAnimating
//        ? Opacity(
//      opacity: 1.0 - animationController.value,
//      child: widget.child,
//    )
//        : Container();
//  }
//}
//
//class VideoPlayerPage extends StatefulWidget {
//  @override
//  _VideoPlayerPageState createState() => _VideoPlayerPageState();
//}
//
//class _VideoPlayerPageState extends State<VideoPlayerPage> {
//  @override
//  Widget build(BuildContext context) {
//    return NetworkPlayerLifeCycle(
//      'http://221.228.226.5/14/z/w/y/y/zwyyobhyqvmwslabxyoaixvyubmekc/sh.yinyuetai.com/4599015ED06F94848EBF877EAAE13886.mp4',
//          (BuildContext context, VideoPlayerController controller) =>
//          AspectRatioVideo(controller),
//    );
//  }
//}
