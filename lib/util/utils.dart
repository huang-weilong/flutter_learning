import 'package:flutter/material.dart';

class Utils {
  // 获取屏幕宽度
  static double getScreenWidth(BuildContext context) {
    return MediaQuery
        .of(context)
        .size
        .width;
  }

  // 获取屏幕宽度
  static double getScreenHeight(BuildContext context) {
    return MediaQuery
        .of(context)
        .size
        .height;
  }

  // 获取系统状态栏高度
  static double getStatusBarHeight(BuildContext context) {
    return MediaQuery
        .of(context)
        .padding
        .top;
  }

  //获取屏幕像素比，1x  2x  3x
  static double getDevicePixelRatio(BuildContext context) {
    return MediaQuery
        .of(context).devicePixelRatio;
  }

  //是否始终使用24小时制
  static bool getAlwaysUse24HourFormat(BuildContext context) {
    return MediaQuery
        .of(context).alwaysUse24HourFormat;
  }

}
