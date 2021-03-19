import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learning/config/themes.dart';
import 'package:flutter_learning/util/sp_client.dart';
import 'package:provider/provider.dart';

class Test2 extends StatefulWidget {
  @override
  _Test2State createState() => _Test2State();
}

class _Test2State extends State<Test2> {
  bool flag = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('测试2'),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Themes.primaryColor(context),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          if (flag == true) Offstage(offstage: true, child: Container()),
//          Opacity(opacity: 0.1, child: Container(height: 0.0, width: 0.0)),
          RaisedButton(
            onPressed: () {
              var overlayState = Overlay.of(context);
              OverlayEntry overlayEntry = new OverlayEntry(builder: (context) {
                return Align(
                  alignment: Alignment.topCenter,
                  child: Container(height: 200, width: 200, color: Colors.blue.withOpacity(0.4)),
                );
              });
              overlayState.insert(overlayEntry);
              setState(() {
                flag = !flag;
              });
            },
            child: Text('测试'),
          ),
          flag ? Text('22222222') : T2(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: Themes.colorMap.keys.map((e) {
              return GestureDetector(
                onTap: () {
                  Provider.of<Themes>(context, listen: false).changeTheme(e);
                },
                child: Container(
                  color: Themes.colorMap[e],
                  height: 50.0,
                  width: 50.0,
                  child: Icon(Icons.check, color: (SpClient.sp.getString('theme') ?? 'blue') == e ? Colors.white : Themes.colorMap[e]),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class T2 extends StatefulWidget {
  @override
  _T2State createState() => _T2State();
}

class _T2State extends State<T2> {
  @override
  void dispose() {
    print('-------------------------------');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text('data');
  }
}

class P with ChangeNotifier {
  void d() {
    notifyListeners();
  }
}
