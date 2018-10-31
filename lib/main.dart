import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'tabbar/index_page.dart';
import 'tabbar/tabbar_page2.dart';
import 'tabbar/tabbar_page3.dart';
import 'tabbar/tabbar_page4.dart';

void main() {
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
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: <Widget>[
          IndexPage(),
          TabbarPage2(),
          TabbarPage3(),
          TabbarPage4()
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
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController(initialPage: this.page);
  }

  void onTap(int index) {
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  void onPageChanged(int page) {
    setState(() {
      this.page = page;
    });
  }
}
