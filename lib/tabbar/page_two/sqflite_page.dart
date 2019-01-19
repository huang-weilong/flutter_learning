import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';

import '../../database/database_helper.dart';
import '../../data/client_data.dart';
import '../../model/model.dart';

class SqflitePage extends StatefulWidget {
  @override
  _SqflitePageState createState() => _SqflitePageState();
}

class _SqflitePageState extends State<SqflitePage> {
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  TextEditingController controller4 = TextEditingController();
  TextEditingController controller5 = TextEditingController();
  TextEditingController controller6 = TextEditingController();
  Student student;
  Student student2;
  int flag = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('sqflite'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text('创建数据库'),
              onPressed: () {
                DatabaseHelper.instance.initDatabase();
              },
            ),
            TextField(
              controller: controller1,
              decoration: InputDecoration(hintText: '学生姓名'),
            ),
            TextField(
              controller: controller2,
              decoration: InputDecoration(hintText: '学生学号'),
            ),
            TextField(
              controller: controller3,
              decoration: InputDecoration(hintText: '学生班级'),
            ),
            RaisedButton(
              child: Text('插入学生信息'),
              onPressed: () async {
                student = Student('id${flag++}', controller1.text, controller2.text, controller3.text);
                int a = await DatabaseHelper.instance.insertStudent(student);
                Fluttertoast.showToast(msg: 'result is $a', gravity: ToastGravity.CENTER);
              },
            ),
            RaisedButton(
              child: Text('批量插入'),
              onPressed: () async {
                for (int i = 0; i < 100; i++) {
                  Student ss = Student('test$i', 'name$i', '2014$i', '软件4班');
                  await DatabaseHelper.instance.insertStudent(ss);
                }
              },
            ),
            TextField(
              controller: controller4,
              decoration: InputDecoration(hintText: '输入要查找的学生学号'),
            ),
            Text('name: ${student2?.name ?? "空"}'),
            Text('code: ${student2?.code ?? "空"}'),
            Text('className: ${student2?.classRoom ?? "空"}'),
            TextField(
              controller: controller6,
              decoration: InputDecoration(hintText: '修改查找出来的对象的name'),
            ),
            Row(
              children: <Widget>[
                RaisedButton(
                  child: Text('查找'),
                  onPressed: () async {
                    student2 = await DatabaseHelper.instance.getStudent(controller4.text);
                    setState(() {});
                  },
                ),
                RaisedButton(
                  child: Text('修改'),
                  onPressed: () async {
                    int a = await DatabaseHelper.instance.updateStudent(student2.id, controller6.text);
                    Fluttertoast.showToast(msg: 'update result is $a', gravity: ToastGravity.CENTER);
                    setState(() {});
                  },
                ),
              ],
            ),
            RaisedButton(
              child: Text('查找所有（查看控制台）'),
              onPressed: () async {
                List<Student> s = await DatabaseHelper.instance.getStudentList();
                for (var c in s) {
                  print(c.toJson());
                }
              },
            ),
            TextField(
              controller: controller5,
              decoration: InputDecoration(hintText: '删除指定id的学生'),
            ),
            RaisedButton(
              child: Text('删除'),
              onPressed: () async {
                int a = await DatabaseHelper.instance.deleteStudent(controller5.text);
                Fluttertoast.showToast(msg: 'result is $a', gravity: ToastGravity.CENTER);
              },
            ),
          ],
        ),
      ),
    );
  }
}
