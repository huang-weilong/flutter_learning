import 'dart:async';

import 'package:flutter/material.dart';

class ClickEffect extends StatefulWidget {
  ClickEffect(
      {Key key,
      this.margin,
      this.padding,
      this.normalColor: Colors.white,
      this.selectColor: const Color(0xffdedede),
      @required this.onTap,
      @required this.child})
      : super(key: key);

  final EdgeInsetsGeometry margin;

  final EdgeInsetsGeometry padding;

  final Color normalColor;

  final Color selectColor;

  final GestureTapCallback onTap;

  final Widget child;

  @override
  _ClickEffectState createState() => _ClickEffectState();
}

class _ClickEffectState extends State<ClickEffect> {
  Color color;

  @override
  void initState() {
    super.initState();
    color = widget.normalColor;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: widget.margin,
        padding: widget.padding,
        child: widget.child,
        color: color,
      ),
      onTap: onTap,
      onTapDown: (_) {
        setState(() {
          color = widget.selectColor;
        });
      },
      onTapUp: (_) {
        setState(() {
          color = widget.normalColor;
        });
      },
      onTapCancel: () {
        setState(() {
          color = widget.normalColor;
        });
      },
    );
  }

  void onTap() {
    widget.onTap();
    setState(() {
      color = widget.selectColor;
      Timer.periodic(Duration(milliseconds: 40), (timer) {
        setState(() {});
        color = widget.normalColor;
        timer.cancel();
      });
    });
  }
}
