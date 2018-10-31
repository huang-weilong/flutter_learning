import 'package:flutter/material.dart';
import 'package:share/share.dart';

class SharePage extends StatefulWidget {
  @override
  _SharePageState createState() => _SharePageState();
}

class _SharePageState extends State<SharePage> {
  String text = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('share分享'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: 'Share:',
                hintText: 'Enter some text and/or link to share',
              ),
              maxLines: 2,
              onChanged: (String value) => setState(() {
                text = value;
              }),
            ),
            Padding(padding: EdgeInsets.only(top: 24.0)),
            Builder(
              builder: (BuildContext context) {
                return RaisedButton(
                  child: Text('Share'),
                  onPressed: text.isEmpty
                      ? null
                      : () {
                    // A builder is used to retrieve the context immediately
                    // surrounding the RaisedButton.
                    //
                    // The context's `findRenderObject` returns the first
                    // RenderObject in its descendent tree when it's not
                    // a RenderObjectWidget. The RaisedButton's RenderObject
                    // has its position and size after it's built.
                    final RenderBox box = context.findRenderObject();
                    Share.share(text,
                        sharePositionOrigin:
                        box.localToGlobal(Offset.zero) &
                        box.size);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
