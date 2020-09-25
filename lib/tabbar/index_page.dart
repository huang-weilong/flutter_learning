import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'page_one/index_button_page.dart';
import 'page_one/navigation_page.dart';
import '../test.dart';
import 'page_one/index_text_field_page.dart';
import 'page_one/index_dialog_page.dart';
import 'page_one/index_images_page.dart';
import 'package:flutter_learning/tabbar/page_four/index_timer_page.dart';
import 'page_one/index_expansion_tile_page.dart';
import 'page_one/index_tooltip_page.dart';
import 'page_one/index_sliders_page.dart';
import 'page_one/index_checkbox_page.dart';
import 'page_one/index_radio_page.dart';
import 'page_one/index_switch_page.dart';
import 'page_one/index_circular_progress_indicator.dart';
import 'page_one/index_container_page.dart';
import '../test2.dart';
import '../test3.dart';
import '../test4.dart';
import 'page_one/web_socket_page.dart';
import 'page_one/stream_page.dart';
import 'page_one/index_gradient_page.dart';
import '../login_page.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> with AutomaticKeepAliveClientMixin {
  bool flag = false;

  @override
  void initState() {
    super.initState();
    loadUserInfo();
  }

  loadUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String username = await prefs.get('username') ?? '';
    String password = await prefs.get('password') ?? '';
    if (username == 'long' && password == '123456') {
      setState(() {
        flag = true;
      });
    }
  }

  logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', '');
    await prefs.setString('password', '');
    setState(() {
      flag = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('首页'),
          centerTitle: true,
          elevation: 0.0,
          actions: [
            IconButton(
              icon: Icon(Icons.animation),
              onPressed: () {
                Navigator.pushNamed(context, '/ss', arguments: "Hello World");
              },
            )
          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
//            DrawerHeader(child: Text('dsa'),),//可以使用这个自定义抽屉头部
              GestureDetector(
                onTap: () {
                  if (!flag) {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => LoginPage())).then((result) {});
                  }
                },
                child: UserAccountsDrawerHeader(
                  accountName: Text(flag ? 'long' : '登录'),
                  accountEmail: Text(flag ? '550456817@qq.com' : ''),
                  currentAccountPicture: ClipOval(
                    child: Image.asset(flag ? 'assets/images/long.jpg' : 'assets/images/img.jpg'),
                  ),
                ),
              ),
              ListTile(
                title: Text('布局'),
                trailing: Icon(Icons.brightness_1),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(context, MaterialPageRoute(builder: (_) => IndexLayoutPage()));
                },
              ),
              ListTile(
                title: Text('计时器'),
                trailing: Icon(Icons.timer),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(context, MaterialPageRoute(builder: (_) => IndexTimerPage()));
                },
              ),
              Divider(),
              ListTile(
                title: Text('收起'),
                trailing: Icon(Icons.cancel),
                onTap: () => Navigator.of(context).pop(), //点击后收起侧边栏
              ),
              Divider(),
              flag
                  ? ListTile(
                      title: Text('退出登录'),
                      trailing: Icon(Icons.cancel),
                      onTap: () {
                        showCupertinoDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return CupertinoAlertDialog(
                                title: Text('Logout'),
                                content: Text('确认退出？'),
                                actions: <Widget>[
                                  CupertinoDialogAction(
                                    child: Text('确认'),
                                    isDestructiveAction: true, //颜色变红(删除、取消的意思）
                                    onPressed: () {
                                      Navigator.pop(context);
                                      logout();
                                    },
                                  ),
                                  CupertinoDialogAction(
                                    child: Text('取消'),
                                    isDefaultAction: true, //内容加粗
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  )
                                ],
                              );
                            });
                      }, //点击后收起侧边栏
                    )
                  : Container(),
              flag ? Divider() : Container(),
              AboutListTile(
                icon: Icon(Icons.beach_access),
                child: Text('关于'),
                applicationName: 'flutter学习',
                applicationIcon: Icon(Icons.details),
                applicationLegalese: '此项目仅用于学习flutter，部分代码来源于互联网或官方Gallery案例',
                applicationVersion: 'v0.0.1',
                aboutBoxChildren: <Widget>[Icon(Icons.map), Icon(Icons.opacity)],
              )
            ],
          ),
        ),
        body: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
          children: <Widget>[
            _buildItem(Icons.check_box_outline_blank, '布局', IndexLayoutPage()),
            _buildItem(Icons.all_inclusive, '动画', IndexAnimationPage()),
            _buildItem(Icons.gesture, '手势', IndexGesturePage()),
            _buildItem(Icons.gesture, '绘制painter', IndexPainterPage()),
            _buildItem(Icons.check_box_outline_blank, '按钮Button', IndexButtonPage()),
            _buildItem(Icons.check_box_outline_blank, 'Container', IndexContainerPage()),
            _buildItem(Icons.keyboard, '输入框', IndexTextFieldPage()),
            _buildItem(Icons.check_box_outline_blank, '对话框', IndexDialogPage()),
            _buildItem(Icons.image, '图片', IndexImagesPage()),
            _buildItem(Icons.signal_cellular_4_bar, 'NestedScrollView', NestedPage()),
            _buildItem(Icons.expand_more, 'ExpansionTile下拉', IndexExpansionTilePage()),
            _buildItem(Icons.linear_scale, 'slider滑块', IndexSlidersPage()),
            _buildItem(Icons.autorenew, '转圈动画', IndexCircularProgressIndicator()),
            _buildItem(Icons.radio_button_checked, '单选按钮', IndexRadioPage()),
            _buildItem(Icons.check_box, '复选按钮', IndexCheckboxPage()),
            _buildItem(Icons.looks, 'switch开关', IndexSwitchPage()),
            _buildItem(Icons.chat_bubble_outline, 'tootip', IndexTooltipPage()),
            _buildItem(Icons.web_asset, 'websocket', WebSocketPage()),
            _buildItem(Icons.streetview, 'stream', StreamPage()),
            _buildItem(Icons.gradient, 'gradient渐变', IndexGradientPage()),
            _buildItem(Icons.assistant_photo, '一些方法使用', ExamplePage()),
            _buildItem(Icons.terrain, '测试页面1', TabsDemo()),
            _buildItem(Icons.terrain, '测试页面2', Test2()),
            _buildItem(Icons.terrain, '测试页面3', Test3()),
            _buildItem(Icons.terrain, '测试页面4', Test4()),
          ],
        ));
  }

  Widget _buildItem(IconData iconData, String text, Widget router) {
    return InkWell(
      onTap: () {
        Navigator.push(context, CupertinoPageRoute(builder: (_) => router));
      },
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(iconData),
            Text(text),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
