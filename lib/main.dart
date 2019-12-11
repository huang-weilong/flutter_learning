import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import 'package:fluttertoast/fluttertoast.dart';

import 'tabbar/index_page.dart';
import 'tabbar/tabbar_page2.dart';
import 'tabbar/tabbar_page3.dart';
import 'tabbar/tabbar_page4.dart';

import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(new MyApp());

  /** 以下代码设置Android状态栏为透明的沉浸
      写在组件渲染之后，是为了在渲染后进行set赋值
      覆盖状态栏，写在渲染之前MaterialAapp组件会覆盖掉这个值***/
//  SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
//    statusBarColor: Colors.transparent,
//    statusBarIconBrightness: Brightness.dark
//  );
//  SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Learning',
      theme: ThemeData(
//        platform: TargetPlatform.iOS,
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      routes: {
        "/ss": (_) => new WebviewScaffold(
              url: "https://www.jianshu.com/u/37c10960a409",
              appBar: new AppBar(
                title: new Text("Widget webview"),
              ),
            ),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController pageController;
  int page = 0;
  int flag = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        flag++;
        Fluttertoast.showToast(msg: '再按一次退出', gravity: ToastGravity.BOTTOM);
        Timer.periodic(Duration(seconds: 3), (timer) {
          flag = 0;
          timer.cancel();
        });
        if (flag == 2) {
          SystemNavigator.pop();
        }
        return;
      },
      child: Scaffold(
        body: PageView(
          children: <Widget>[
            IndexPage(),
            TabbarPage2(),
            TabbarPage3(),
            TabbarPage4(),
          ],
          controller: pageController,
          onPageChanged: onPageChanged,
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('基础')),
            BottomNavigationBarItem(icon: Icon(Icons.build), title: Text('插件')),
            BottomNavigationBarItem(icon: Icon(Icons.bubble_chart), title: Text('iOS风格')),
            BottomNavigationBarItem(icon: Icon(Icons.ac_unit), title: Text('小实例')),
          ],
          onTap: onTap,
          currentIndex: page,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: this.page);
  }

  void onTap(int index) {
    pageController.animateToPage(index, duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  void onPageChanged(int page) {
    setState(() {
      this.page = page;
    });
  }
}
