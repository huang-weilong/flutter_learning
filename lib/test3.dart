import 'package:flutter/material.dart';

class Test3 extends StatefulWidget {
  @override
  _Test3State createState() => _Test3State();
}

class _Test3State extends State<Test3> {
  bool flag = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
//                ModalRoute.of(context);

                setState(() {
                  flag = !flag;
                });
              })
        ],
      ),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Text(
                  'ddddd',
                  style: TextStyle(fontSize: 30.0),
                ),
                Text(
                  'ddddd',
                  style: TextStyle(fontSize: 30.0),
                ),
                Text(
                  'ddddd',
                  style: TextStyle(fontSize: 30.0),
                ),
                Text(
                  'ddddd',
                  style: TextStyle(fontSize: 30.0),
                ),
                Text(
                  'ddddd',
                  style: TextStyle(fontSize: 30.0),
                ),
                Text(
                  'ddddd',
                  style: TextStyle(fontSize: 30.0),
                ),
                Text(
                  'ddddd',
                  style: TextStyle(fontSize: 30.0),
                ),
                Text(
                  'ddddd',
                  style: TextStyle(fontSize: 30.0),
                ),
                Text(
                  'ddddd',
                  style: TextStyle(fontSize: 30.0),
                ),
                Text(
                  'ddddd',
                  style: TextStyle(fontSize: 30.0),
                ),
                Text(
                  'ddddd',
                  style: TextStyle(fontSize: 30.0),
                ),
                Text(
                  'ddddd',
                  style: TextStyle(fontSize: 30.0),
                ),
                Text(
                  'ddddd',
                  style: TextStyle(fontSize: 30.0),
                ),
                Text(
                  'ddddd',
                  style: TextStyle(fontSize: 30.0),
                ),
                Text(
                  'ddddd',
                  style: TextStyle(fontSize: 30.0),
                ),
                Text(
                  'ddddd',
                  style: TextStyle(fontSize: 30.0),
                ),
                Text(
                  'ddddd',
                  style: TextStyle(fontSize: 30.0),
                ),
                Text(
                  'ddddd',
                  style: TextStyle(fontSize: 30.0),
                ),
              ],
            ),
          ),
          flag
              ? Column(
                  children: <Widget>[
                    Expanded(child: Container()),
                    Stack(
                      children: <Widget>[
                        Container(
                          color: Colors.red,
                          height: 400.0,
                          width: MediaQuery.of(context).size.width,
                        ),
                        Positioned(
                          top: -20.0,
                          child: Container(
                            color: Colors.green,
                            height: 30.0,
                            width: 30.0,
                          ),
                        )
                      ],
                    )
                  ],
                )
              : Container(),
        ],
      ),
    );
  }
}

class TTT extends StatefulWidget {
  @override
  _TTTState createState() => _TTTState();
}

class _TTTState extends State<TTT> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: <Widget>[
          Container(
            color: Colors.red,
            height: 100.0,
            width: 100.0,
          ),
        ],
      ),
    );
  }
}
