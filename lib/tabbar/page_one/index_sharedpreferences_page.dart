import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IndexSharedPreferencePage extends StatefulWidget {
  @override
  _IndexSharedPreferencePageState createState() => _IndexSharedPreferencePageState();
}

class _IndexSharedPreferencePageState extends State<IndexSharedPreferencePage> {
  int _counter = 0;
  String text = 'str:';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SharedPreferences的使用'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '点击按钮次数:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            RaisedButton(
              onPressed: _addStr,
              child: Text('字符串初始值'),
            ),
            RaisedButton(
                onPressed: _editStr,
                child: Text('修改字符串')
            ),
            RaisedButton(
                onPressed: _getStr,
                child: Text('读取str的值')
            ),
            RaisedButton(
              onPressed: _del,
              child: Text('删除str'),
            ),
            Text(text),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  @override
  void initState() {
    super.initState();
    _loadCounter();
  }

  //运行时加载数据
  _loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print('获取counter的数值'+prefs.getInt('counter').toString());
    setState(() {
      _counter = (prefs.getInt('counter') ?? 0);
    });
  }

  //Incrementing counter after click
  _incrementCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _counter = (prefs.getInt('counter') ?? 0) + 1;
    setState(() {
      _counter;
    });
    prefs.setInt('counter', _counter);
  }

  _addStr() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('str', '初始字符串');
    setState(() {
      text ='str: ' + preferences.get('str');
    });
  }

  _del() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove('str');
    setState(() {
      text ='str: ' + (preferences.get('str')??'该key已被删除');
    });
  }

  _editStr() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('str', '被修改的字符串');
    setState(() {
      text ='str: ' + preferences.get('str');
    });
  }

  _getStr() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      text = 'str: '+ (preferences.get('str') ?? '该key不存在，或已被删除');
    });
  }
}
