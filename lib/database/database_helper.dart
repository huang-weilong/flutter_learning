import 'dart:async';
import 'dart:io' as io;

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../model/model.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper();

  static DatabaseHelper get instance => _instance;

  // 获取数据库路径
  Future<String> _getDBPath() async {
    String dbPath = await getDatabasesPath();
    return join(dbPath, "flutter_learning.db");
  }

  //创建数据库
  Future<void> _createNewDb(String path) async {
    if (await io.Directory(dirname(path)).exists()) {
      await deleteDatabase(path);
    } else {
      try {
        await io.Directory(dirname(path)).create(recursive: true);
      } catch (e) {
        print(e);
      }
    }
  }

  // 初始化数据库
  initDatabase() async {
    String path = await _getDBPath();
    await _createNewDb(path);
    Database db = await openDatabase(path);
    await _createTable(db);
    await db.close();
  }

  Future _createTable(Database db) async {
    await db.execute('''
        CREATE TABLE student (
          id TEXT PRIMARY KEY NOT NULL COLLATE NOCASE,
          name TEXT,
          code TEXT,
          class_room TEXT
        )''');
  }

  // 增
  Future<int> insertStudent(Student student) async {
    String path = await _getDBPath();
    Database db = await openDatabase(path);
    int a = await db.insert('student', student.toJson(), conflictAlgorithm: ConflictAlgorithm.replace);
    await db.close();
    return a;
  }

  // 查
  Future<Student> getStudent(String id) async {
    String path = await _getDBPath();
    Database db = await openDatabase(path);
    List<Map> maps = await db.rawQuery('SELECT * FROM student WHERE id = ?', [id]);
    await db.close();
    if (maps.length > 0) {
      return Student.fromJson(maps.first);
    }
    return null;
  }

  Future<List<Student>> getStudentList() async {
    String path = await _getDBPath();
    Database db = await openDatabase(path);
    List<Map> maps = await db.rawQuery('SELECT * FROM student');
    await db.close();
    List<Student> studentList = [];
    for (int i = 0; i < maps.length; i++) studentList.add(Student.fromJson(maps[i]));
    return studentList;
  }

  // 删
  Future<int> deleteStudent(String id) async {
    String path = await _getDBPath();
    Database db = await openDatabase(path);
    int a = await db.rawDelete('DELETE FROM student WHERE id = ?', [id]);
    await db.close();
    return a;
  }

  // 改
  Future<int> updateStudent(String id, String name) async {
    String path = await _getDBPath();
    Database db = await openDatabase(path);
    int a = await db.rawUpdate('UPDATE student SET name = ? WHERE id = ?', [name, id]);
    await db.close();
    return a;
  }
}
