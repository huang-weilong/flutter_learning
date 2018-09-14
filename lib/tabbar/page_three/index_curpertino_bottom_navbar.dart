import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class IndexCurpertinoBottomNavBar extends StatefulWidget {
  @override
  _IndexCurpertinoBottomNavBarState createState() => _IndexCurpertinoBottomNavBarState();
}

class _IndexCurpertinoBottomNavBarState extends State<IndexCurpertinoBottomNavBar> {
  int page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        children: <Widget>[
          PageOne(),
          PageTwo(),
          PageThree()
        ],
        index: page,
      ),
      bottomNavigationBar: CupertinoTabBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home, color: page == 0 ? Colors.blue : Colors.grey,),
                title: Text('基础', style: TextStyle(color: page == 0 ? Colors.blue : Colors.grey,),)),
            BottomNavigationBarItem(
                icon: Icon(Icons.message, color: page == 1 ? Colors.blue : Colors.grey,),
                title: Text('插件', style: TextStyle(color: page == 1 ? Colors.blue : Colors.grey,),)),
            BottomNavigationBarItem(
                icon: Icon(Icons.apps, color: page == 2 ? Colors.blue : Colors.grey,),
                title: Text('iOS风格', style: TextStyle(color: page == 3 ? Colors.blue : Colors.grey,),)),
          ],
          onTap: (index) {
            setState(() {
              page = index;
            });
          }
      ),
    );
  }
}

class PageOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('页面一'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Center(
        child: Text('页面一'),
      ),
    );
  }
}

class PageTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('页面二'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Center(
        child: Text('页面二'),
      ),
    );
  }
}

class PageThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('页面三'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Center(
        child: Text('页面三'),
      ),
    );
  }
}