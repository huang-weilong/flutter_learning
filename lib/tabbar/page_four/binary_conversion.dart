import 'package:flutter/material.dart';

class BinaryConversion extends StatefulWidget {
  @override
  _BinaryConversionState createState() => _BinaryConversionState();
}

class _BinaryConversionState extends State<BinaryConversion> {
  List<TextEditingController> controller = List(6);
  List<String> result = List(6);

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 6; i++) {
      controller[i] = TextEditingController();
      result[i] = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('进制转换'),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            buildItem('十六进制转二进制', '请输入十六进制数如AA', 16, 2, 0),
            buildItem('十六进制转十进制', '请输入十六进制数如AA', 16, 10, 1),
            buildItem('十进制转二进制', '请输入十进制数如12', 10, 2, 2),
            buildItem('十进制转十六进制', '请输入十进制数如12', 10, 16, 3),
            buildItem('二进制转十进制', '请输入二进制数如1101', 2, 10, 4),
            buildItem('二进制转十六进制', '请输入二进制数如1101', 2, 16, 5)
          ],
        ),
      ),
    );
  }

  /// [title]标题 [hintText]提示文字 [radix]输入数字的进制
  /// [toRadix]要转换的目标进制 [index]数组下标
  buildItem(String title, String hintText, int radix, int toRadix, int index) {
    return Column(
      children: <Widget>[
        Text(title),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            controller: controller[index],
            decoration: InputDecoration(hintText: hintText),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            RaisedButton(
                child: Text('转换'),
                onPressed: () {
                  setState(() {
                    try {
                      result[index] = int.parse(controller[index].text, radix: radix).toRadixString(toRadix);
                    } catch (e) {
                      result[index] = '输入内容有误！';
                    }
                  });
                }),
            Text('结果：${result[index]}')
          ],
        ),
      ],
    );
  }
}
