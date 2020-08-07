import 'package:flutter/material.dart';

class IndexTextFieldPage extends StatefulWidget {
  @override
  _IndexTextFieldPageState createState() => _IndexTextFieldPageState();
}

class _IndexTextFieldPageState extends State<IndexTextFieldPage> {
  TextEditingController controller = TextEditingController();
  FocusNode focusNode = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.addListener(() {
      print('--------------${controller.text}');
    });
    focusNode.addListener(() {
      print('==================${controller.text}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('textfield'),
          elevation: 0.0,
        ),
        body: Container(
//          height: 500.0,
          child: GestureDetector(
            onTap: () {
              // 通过GestureDetector捕获点击事件，再通过FocusScope将焦点转移至空焦点——new FocusNode()
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: Container(
                child: ListView(children: <Widget>[
              TextField(
                controller: controller,
                focusNode: focusNode,
                decoration: InputDecoration(labelText: 'Username'),
                maxLength: 100, // 最大长度，设置此项会让TextField右下角有一个输入数量的统计字符串
                maxLines: 1, //最大行数
                autocorrect: true, //是否自动更正
//                    textAlign: TextAlign.center,//文本对齐方式
                style: TextStyle(fontSize: 30.0, color: Colors.blue), //输入文本的样式
                onChanged: (text) {
                  //内容改变的回调
                  print('change $text');
                },
                onSubmitted: (text) {
                  //内容提交(按回车)的回调
                  print('submit $text');
                },
//                enabled: false, //是否禁用
              ),
              TextField(
                decoration: InputDecoration(
                    labelText: 'Password',
                    fillColor: Colors.orange,
                    filled: true,
                    errorText: 'error',
                    prefixIcon: Icon(Icons.lock),
                    suffixText: 'password'),
                obscureText: true, //是否是密码
              ),
              Theme(
                data: ThemeData(primaryColor: Colors.green, hintColor: Colors.orangeAccent),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: '改变hintText颜色、边框颜色、边框',
                      contentPadding: EdgeInsets.all(10.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
//            borderSide: BorderSide(color: Colors.red, width: 3.0, style: BorderStyle.solid)//没什么luan效果
                      )),
                ),
              ),
              buildTextField(),
              Container(
                decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.green))),
                child: SingleChildScrollView(
                  reverse: true,
                  child: TextField(
                    maxLines: null,
                    onChanged: (_) {
                      setState(() {});
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: '可输入多行',
                    ),
                  ),
                ),
              ),
            ])),
          ),
        ));
  }

  Widget buildTextField() {
    return Container(
      padding: const EdgeInsets.all(8.0),
      alignment: Alignment.center,
      height: 60.0,
      decoration: new BoxDecoration(
          color: Colors.blueGrey, border: new Border.all(color: Colors.black54, width: 4.0), borderRadius: new BorderRadius.circular(12.0)),
      child: new TextFormField(
        decoration: InputDecoration.collapsed(hintText: '使用Container的装饰'),
      ),
    );
  }
}
