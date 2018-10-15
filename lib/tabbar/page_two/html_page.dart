import 'package:flutter/material.dart';

import 'package:flutter_html/flutter_html.dart';

class HtmlPage extends StatefulWidget {
  @override
  _HtmlPageState createState() => _HtmlPageState();
}

class _HtmlPageState extends State<HtmlPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('html页面渲染'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Html(
        data:"""
    <!--For a much more extensive example, look at example/main.dart-->
    <div>
      <h1>Demo Page</h1>
      <p>This is a fantastic nonexistent product that you should buy!</p>
      <h2>Pricing</h2>
      <p>Lorem ipsum <b>dolor</b> sit amet.</p>
      <h2>The Team</h2>
      <p>There isn't <i>really</i> a team...</p>
      <h2>Installation</h2>
      <p>You <u>cannot</u> install a nonexistent product!</p>
      <!--You can pretty much put any html in here!-->
    </div>
  """,
      ),
    );
  }
}
