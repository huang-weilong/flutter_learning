import 'package:flutter/material.dart';

class IndexTextFieldPage extends StatefulWidget {
  @override
  _IndexTextFieldPageState createState() => _IndexTextFieldPageState();
}

class _IndexTextFieldPageState extends State<IndexTextFieldPage> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('textfield'),
          elevation: 0.0,
          actions: <Widget>[
            Placeholder(fallbackWidth: 50.0,)
          ],
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
                    decoration: InputDecoration(labelText: 'Username'),
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Password'),
                  ),
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
}
