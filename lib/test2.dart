import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';

class HandleSQLiteDataWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _HandleSQLiteDataWidgetState();
  }
}

class _HandleSQLiteDataWidgetState extends State<HandleSQLiteDataWidget> {
  // TODO: implement build

  String dbName = 'user.db';
  String dbPath;

  String sql_createTable = 'CREATE TABLE user_table (id INTEGER PRIMARY KEY, username TEXT,pwd Text)';

  String sql_query_count = 'SELECT COUNT(*) FROM user_table';

  String sql_query = 'SELECT * FROM user_table';

  var _result;

  Future<String> _createNewDb() async {
    String documentsDirectory = await getDatabasesPath();

    String path = join(documentsDirectory, 'user.db');

    if (await new Directory(dirname(path)).exists()) {
      await deleteDatabase(path);
    } else {
      try {
        await new Directory(dirname(path)).create(recursive: true);
      } catch (e) {
        print(e);
      }
    }
    return path;
  }

  _create() async {
    dbPath = await _createNewDb();
    Database db = await openDatabase(dbPath);

    await db.execute(sql_createTable);
    await db.close();
    setState(() {
      _result = '创建user.db成功，创建user_table成功';
    });
  }

  _add() async {
    Database db = await openDatabase(dbPath);

    String sql = "INSERT INTO user_table(username,pwd) VALUES('sss','ccc')";
    await db.transaction((txn) async {
      int id = await txn.rawInsert(sql);
    });

    await db.close();

    setState(() {
      _result = "插入username=,pwd=数据成功";
    });
  }

  _delete() async {
    Database db = await openDatabase(dbPath);

    String sql = "DELETE FROM user_table WHERE id = ?";

    int count = await db.rawDelete(sql, ['1']);

    await db.close();

    setState(() {
      if (count == 1) {
        _result = "删除成功，请查看";
      } else {
        _result = "删除失败，请看log";
      }
    });
  }

  _update() async {
    Database db = await openDatabase(dbPath);
    String sql = "UPDATE user_table SET pwd = ? WHERE id = ?";
    int count = await db.rawUpdate(sql, ["654321", '1']);
    print(count);
    await db.close();
    setState(() {
      _result = "更新数据成功，请查看";
    });
  }

  _queryNum() async {
    Database db = await openDatabase(dbPath);
    int count = Sqflite.firstIntValue(await db.rawQuery(sql_query_count));
    await db.close();
    setState(() {
      _result = "数据条数：$count";
    });
  }

  _query() async {
    String documentsDirectory = await getDatabasesPath();
    String path = join(documentsDirectory, 'user.db');

    Database db = await openDatabase(path);
    List<Map> list = await db.rawQuery(sql_query);
    await db.close();
    setState(() {
      _result = "数据详情：$list";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('da'),
      ),
      body: new Column(
        children: <Widget>[
          new Padding(
            padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
            child: new Text('sqflite用法'),
          ),
          new Row(
            children: <Widget>[
              new RaisedButton(textColor: Colors.black, child: new Text('创建'), onPressed: _create),
              new RaisedButton(textColor: Colors.black, child: new Text('增'), onPressed: _add),
              new RaisedButton(textColor: Colors.black, child: new Text('删'), onPressed: _delete),
              new RaisedButton(textColor: Colors.black, child: new Text('改'), onPressed: _update),
            ],
          ),
          new Row(
            children: <Widget>[
              new RaisedButton(textColor: Colors.black, child: new Text('查条数'), onPressed: _queryNum),
              new RaisedButton(textColor: Colors.black, child: new Text('查详情'), onPressed: _query),
            ],
          ),
          new Padding(
            padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
            child: new Text('结果：$_result'),
          ),
        ],
      ),
    );
  }
}
