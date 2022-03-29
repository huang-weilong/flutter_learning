import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class IndexCupertinoTabScaffold extends StatefulWidget {
  @override
  _IndexCupertinoTabScaffoldState createState() => _IndexCupertinoTabScaffoldState();
}

class _IndexCupertinoTabScaffoldState extends State<IndexCupertinoTabScaffold> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'tab1'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'tab2'),
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        return CupertinoTabView(
          builder: (BuildContext context) {
            return CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(
                middle: Text('第一页的 tab $index'),
              ),
              child: Center(
                child: CupertinoButton(
                  child: Text('未完善'),
                  onPressed: () {
                    Navigator.of(context).push(
                      CupertinoPageRoute<Null>(
                        builder: (BuildContext context) {
                          return CupertinoPageScaffold(
                            navigationBar: CupertinoNavigationBar(
                              middle: Text('第二页的 tab $index'),
                            ),
                            child: Center(
                              child: CupertinoButton(
                                child: Text('返回'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            );
          },
        );
      },
    );
  }
}
