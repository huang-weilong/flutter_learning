import 'package:flutter/material.dart';

class IndexTextPage extends StatefulWidget {
  @override
  _IndexTextPageState createState() => _IndexTextPageState();
}

class _IndexTextPageState extends State<IndexTextPage> {
  var clapping = '\u{1f44f}';
  Runes input = new Runes('\u2665  \u{1f604}  \u{1f60e}  \u{1f47b}  \u{1f596}  \u{1f44d}');
  Map aa = {'smile':'\u{1F601}'};
  TextEditingController controller = TextEditingController();
  FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              hintText: '初始化提示文字',
            ),
          ),
          TextField(
            decoration: InputDecoration(
              hintText: '这是一个表情'+clapping,
            ),
          ),
          TextField(
            decoration: InputDecoration(
              hintText: String.fromCharCodes(input),
            ),
          ),
          TextField(
            decoration: InputDecoration(
              hintText: aa['smile'],
            ),
            focusNode: focusNode,
            controller: controller,
          ),
        ],
      )
    );
  }

}
