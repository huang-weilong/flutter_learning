import 'package:flutter/material.dart';
import 'widget/select_highlight.dart';

class Test3 extends StatefulWidget {
  @override
  _Test3State createState() => _Test3State();
}

class _Test3State extends State<Test3> {
  Color color = Colors.white;
  Color grey = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('test3'),
          centerTitle: true,
          elevation: 0.0,
        ),
        body: ListView(
          children: <Widget>[
            SelectHighlight(
              margin: EdgeInsets.only(top: 10.0),
              child: ListTile(
                title: Text('ffffffffff'),
                leading: Icon(Icons.android),
                trailing: Icon(Icons.chevron_right),
              ),
              onTap: (){
                print('===========');
              },
            ),
            SelectHighlight(
              margin: EdgeInsets.only(top: 10.0),
              normalColor: Colors.lightBlue,
              selectColor: Colors.orange,
              child: ListTile(
                title: Text('ffffffffff'),
                leading: Icon(Icons.android),
                trailing: Icon(Icons.chevron_right),
              ),
              onTap: (){
                print('===========');
              },
            ),
            SelectHighlight(
              margin: EdgeInsets.only(top: 10.0),
              padding: EdgeInsets.all(10.0),
              child: Row(
                children: <Widget>[
                  Icon(Icons.ac_unit),
                  Text('dsadsa'),
                  Expanded(child: Container()),
                  Icon(Icons.chevron_right)
                ],
              ),
              onTap: (){
                print('===========');
              },
            ),
          ],
        )

//        RawMaterialButton(
//          highlightColor: Colors.orange,
//          splashColor: Colors.orange,
//          child: Container(
//            color: Colors.white,
//            child: ListTile(title: Text('dsadas'),onTap: (){},),
//          ),
//          onPressed: (){
//
//          },
//        )
    );
  }
}
