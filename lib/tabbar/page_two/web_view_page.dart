import 'package:flutter/material.dart';

import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebViewPage extends StatefulWidget {
  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: 'https://github.com/huang-weilong',
      appBar: AppBar(
        title: Text('GitHub:huang-weilong'),
      ),
    );
  }
}
