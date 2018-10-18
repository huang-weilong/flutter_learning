import 'package:flutter/material.dart';

import '../../widget/click_effect.dart';

class SelectHighlightExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('点击下列项有选中效果'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ListView(
        children: <Widget>[
          ClickEffect(
            margin: EdgeInsets.only(top: 10.0),
            child: ListTile(
              title: Text('Android'),
              leading: Icon(Icons.android, color: Colors.green,),
              trailing: Icon(Icons.chevron_right),
            ),
            onTap: (){
            },
          ),
          ClickEffect(
            margin: EdgeInsets.only(top: 10.0),
            child: ListTile(
              title: Text('设置'),
              leading: Icon(Icons.settings, color: Colors.blueGrey,),
              trailing: Icon(Icons.chevron_right),
            ),
            onTap: (){
            },
          ),
          ClickEffect(
            margin: EdgeInsets.only(top: 10.0),
            child: ListTile(
              title: Text('关于'),
              leading: Icon(Icons.error_outline),
              trailing: Icon(Icons.chevron_right),
            ),
            onTap: (){
            },
          ),
        ],
      )
    );
  }
}
