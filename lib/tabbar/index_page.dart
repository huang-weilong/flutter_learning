import 'package:flutter/material.dart';

import 'page_one/index_button_page.dart';
import 'page_one/navigation_page.dart';
import '../test.dart';
import 'page_one/index_text_field_page.dart';
import 'page_one/index_dialog_page.dart';
import 'page_one/index_images_page.dart';
import 'page_one/index_gesture_page.dart';
import 'package:flutter_learning/tabbar/page_four/index_timer_page.dart';
import 'page_one/index_add_delete_widget.dart';
import 'page_one/index_nested_scroll_view.dart';
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
import 'page_one/index_drag_page.dart';
import 'page_one/index_reorderable_list_view.dart';
import 'page_one/leav_behind_demo.dart';
import '../test4.dart';
import 'page_one/map_to_list.dart';
import 'page_one/web_socket_page.dart';
import 'page_one/stream_page.dart';
import 'page_one/index_gradient_page.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('首页index_page'),
          centerTitle: true,
          elevation: 0.0,
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
//            DrawerHeader(child: Text('dsa'),),//可以使用这个自定义抽屉头部
              UserAccountsDrawerHeader(
                  accountName: Text('long'),
                  accountEmail: Text('550456817@qq.com'),
                  currentAccountPicture: ClipOval(
                    child: Image.asset('assets/images/long.jpg'),
                  )),
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
        body: ListView(
          children: <Widget>[
            ListTile(
              dense: true,
              leading: Icon(Icons.tab),
              title: Text('TabBar'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => TabBarPage1()));
              },
            ),
            ListTile(
              dense: true,
              leading: Icon(Icons.check_box_outline_blank),
              title: Text('布局'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => IndexLayoutPage()));
              },
            ),
            ListTile(
              dense: true,
              leading: Icon(Icons.all_inclusive),
              title: Text('动画'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => IndexAnimationPage()));
              },
            ),
            ListTile(
              dense: true,
              leading: Icon(Icons.check_box_outline_blank),
              title: Text('按钮Button'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => IndexButtonPage()));
              },
            ),
            ListTile(
              dense: true,
              leading: Icon(Icons.tab),
              title: Text('弹出底部模态窗口'),
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Center(
                        child: Container(
                          child: Text('这是一个底部模态面板，点击任意地方取消显示'),
                        ),
                      );
                    });
              },
            ),
            ListTile(
              dense: true,
              leading: Icon(Icons.tab),
              title: Text('弹出底部窗口'),
              onTap: () {
                showBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Expanded(
                            child: Container(
                                decoration: BoxDecoration(border: Border(top: BorderSide(color: Colors.green)), color: Colors.blue),
                                child: Padding(
                                    padding: EdgeInsets.symmetric(vertical: 80.0),
                                    child:
                                        Text('下滑隐藏', textAlign: TextAlign.center, style: TextStyle(color: Colors.orange, fontSize: 24.0)))),
                          )
                        ],
                      );
                    }).closed.whenComplete(() {
                  print('下滑关闭时执行');
                });
              },
            ),
            ListTile(
              dense: true,
              leading: Icon(Icons.check_box_outline_blank),
              title: Text('xx.map(xxx).toList()的简单使用'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => MapToList()));
              },
            ),
            ListTile(
              dense: true,
              leading: Icon(Icons.check_box_outline_blank),
              title: Text('Container'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => IndexContainerPage()));
              },
            ),
            ListTile(
              dense: true,
              leading: Icon(Icons.keyboard),
              title: Text('输入框TextField'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => IndexTextFieldPage()));
              },
            ),
            ListTile(
              dense: true,
              leading: Icon(Icons.check_box_outline_blank),
              title: Text('对话框AlertDialog'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => IndexDialogPage()));
              },
            ),
            ListTile(
              dense: true,
              leading: Icon(Icons.image),
              title: Text('图片Images'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => IndexImagesPage()));
              },
            ),
            ListTile(
              dense: true,
              leading: Icon(Icons.gesture),
              title: Text('手势Gesture'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => IndexGesturePage()));
              },
            ),
            ListTile(
              dense: true,
              leading: Icon(Icons.gesture),
              title: Text('drag拖拽'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => IndexDragPage()));
              },
            ),
            ListTile(
              dense: true,
              leading: Icon(Icons.gesture),
              title: Text('ReorderableListView拖拽'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => IndexReorderableListView()));
              },
            ),
            ListTile(
              dense: true,
              leading: Icon(Icons.gesture),
              title: Text('滑动删除'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => LeaveBehindDemo()));
              },
            ),
            ListTile(
              dense: true,
              leading: Icon(Icons.add),
              title: Text('添加、删除元素'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => IndexAddDeleteWidget()));
              },
            ),
            ListTile(
              dense: true,
              leading: Icon(Icons.signal_cellular_4_bar),
              title: Text('NestedScrollView'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => IndexNestedScrollView()));
              },
            ),
            ListTile(
              dense: true,
              leading: Icon(Icons.expand_more),
              title: Text('ExpansionTile下拉'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => IndexExpansionTilePage()));
              },
            ),
            ListTile(
              dense: true,
              leading: Icon(Icons.linear_scale),
              title: Text('slider滑块'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => IndexSlidersPage()));
              },
            ),
            ListTile(
              dense: true,
              leading: Icon(Icons.autorenew),
              title: Text('应用程序正忙、刷新动画'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => IndexCircularProgressIndicator()));
              },
            ),
            ListTile(
              dense: true,
              leading: Icon(Icons.radio_button_checked),
              title: Text('radio单选框'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => IndexRadioPage()));
              },
            ),
            ListTile(
              dense: true,
              leading: Icon(Icons.check_box),
              title: Text('checkbox复选框'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => IndexCheckboxPage()));
              },
            ),
            ListTile(
              dense: true,
              leading: Icon(Icons.looks),
              title: Text('switch开关'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => IndexSwitchPage()));
              },
            ),
            ListTile(
              dense: true,
              leading: Icon(Icons.chat_bubble_outline),
              title: Text('tootip'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => IndexTooltipPage()));
              },
            ),
            ListTile(
              dense: true,
              leading: Icon(Icons.web_asset),
              title: Text('websocket'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => WebSocketPage()));
              },
            ),
            ListTile(
              dense: true,
              leading: Icon(Icons.streetview),
              title: Text('stream'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => StreamPage()));
              },
            ),
            ListTile(
              dense: true,
              leading: Icon(Icons.gradient),
              title: Text('gradient渐变'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => IndexGradientPage()));
              },
            ),
            ListTile(
              dense: true,
              leading: Icon(Icons.terrain),
              title: Text('测试页面'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => DragPage()));
              },
            ),
            ListTile(
              dense: true,
              leading: Icon(Icons.terrain),
              title: Text('测试页面2'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => Test2()));
              },
            ),
            ListTile(
              dense: true,
              leading: Icon(Icons.terrain),
              title: Text('测试页面3'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => DraggableGridViewDemo()));
              },
            ),
            ListTile(
              dense: true,
              leading: Icon(Icons.terrain),
              title: Text('测试页面4'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => Test4()));
              },
            ),
          ],
        ));
  }
}
