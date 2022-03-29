import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_learning/config/themes.dart';
import 'package:flutter_learning/tabbar/page_one/index_container_page.dart';
import 'package:flutter_learning/util/sp_client.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import 'tabbar/index_page.dart';
import 'tabbar/tabbar_page2.dart';
import 'tabbar/tabbar_page3.dart';
import 'tabbar/tabbar_page4.dart';

import 'package:jpush_flutter/jpush_flutter.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  ErrorWidget.builder = (errorDetails) {
    return Scaffold(
      appBar: AppBar(
        title: Text('出错了'),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text('emm...出错了，请返回', style: TextStyle(fontSize: 14.0, color: Color(0xffc3c3c3))),
      ),
    );
  };
  SpClient.getInstance();
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

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String debugLable = 'Unknown'; /*错误信息*/
  final JPush jpush = new JPush(); /* 初始化极光插件*/

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    String platformVersion;

    try {
      jpush.addEventHandler(onReceiveNotification: (Map<String, dynamic> message) async {
        print("flutter onReceiveNotification: $message");
        // 接收通知回调方法
        setState(() {
          debugLable = "flutter onReceiveNotification: $message";
        });
      }, onOpenNotification: (Map<String, dynamic> message) async {
        print("flutter onOpenNotification: $message");
        //  点击通知回调方法
        setState(() {
          debugLable = "flutter onOpenNotification: $message";
          navigatorKey.currentState.pushAndRemoveUntil(MaterialPageRoute(builder: (_) => MyHomePage()), (Route route) => route == null);
          navigatorKey.currentState.push(MaterialPageRoute(builder: (_) => IndexContainerPage()));
        });
      }, onReceiveMessage: (Map<String, dynamic> message) async {
        print("flutter onReceiveMessage: $message");
        // 接收自定义消息回调方法
        setState(() {
          debugLable = "flutter onReceiveMessage: $message";
        });
      }, onReceiveNotificationAuthorization: (Map<String, dynamic> message) async {
        print("flutter onReceiveNotificationAuthorization: $message");
        setState(() {
          debugLable = "flutter onReceiveNotificationAuthorization: $message";
        });
      });
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    jpush.setup(
      appKey: "10d24f2ff4b2ecfe4b9d90b1", //你自己应用的 AppKey
      channel: "developer-default",
      production: false,
      debug: true,
    );
    jpush.applyPushAuthority(new NotificationSettingsIOS(sound: true, alert: true, badge: true));

    // Platform messages may fail, so we use a try/catch PlatformException.
    jpush.getRegistrationID().then((rid) {
      print("flutter get registration id : $rid");
      setState(() {
        debugLable = "flutter getRegistrationID: $rid";
      });
    });

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      debugLable = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Themes()),
      ],
      child: MaterialApp(
        // key: navigatorKey,
        title: 'Flutter Learning',
        theme: ThemeData(
//        platform: TargetPlatform.iOS,
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(),
        routes: {
          "/ss": (_) => NRouter(),
        },
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [const Locale("zh", "CN"), const Locale("en", "US")],
      ),
    );
  }
}

class NRouter extends StatefulWidget {
  @override
  _NRouterState createState() => _NRouterState();
}

class _NRouterState extends State<NRouter> {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('命名路由跳转'),
      ),
      body: Center(
        child: Text('传递参数:$args'),
      ),
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
        key: navigatorKey,
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
            BottomNavigationBarItem(icon: Icon(Icons.home), label: '基础'),
            BottomNavigationBarItem(icon: Icon(Icons.build), label: '插件'),
            BottomNavigationBarItem(icon: Icon(Icons.bubble_chart), label: 'iOS风格'),
            BottomNavigationBarItem(icon: Icon(Icons.ac_unit), label: '小实例'),
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
