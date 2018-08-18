import 'package:flutter/material.dart';

class IndexTextPage extends StatefulWidget {
  @override
  _IndexTextPageState createState() => _IndexTextPageState();
}

class _IndexTextPageState extends State<IndexTextPage> {
  var clapping = '\u{1f44f}';
  Runes input = Runes('\u2665  \u{1f604}  \u{1f60e}  \u{1f47b} \u{1f44d}');
  Map aa = {'smile':'\u{1F601}'};
  TextEditingController controller = TextEditingController();
  FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('textfield'),
      ),
      body: ListView(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              hintText: '这是hintText',
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
          ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: 70.0
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: '这是一个类似微信聊天的输入框，但是还不完善'
              ),
              maxLines: 3,
              maxLengthEnforced: false,
              keyboardType: TextInputType.multiline,
            ),
          ),
//          IconButton(icon: Icon(Icons.access_alarm), onPressed: (){}),
        ],
      )
    );
  }

}
