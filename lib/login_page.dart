import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_learning/main.dart';
import 'dart:async';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: Container(
              decoration: BoxDecoration(),
            ),
          ),
          SingleChildScrollView(
            child: SafeArea(
              child: Container(
                padding: EdgeInsets.fromLTRB(24.0, MediaQuery.of(context).padding.top, 24.0, 0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(top: 60.0, bottom: 10.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16.0),
                          child: Image.asset(
                            'assets/images/067.jpg',
                            width: 100.0,
                          ),
                        )),
                    Padding(
                      padding: EdgeInsets.only(bottom: 16.0),
                      child: Text(
                        'flutter_learning Login Page',
                        style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 18.0),
                      ),
                    ),
                    TextField(
                      controller: _phoneController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: '请输入用户名',
                        icon: Text('用户名:', style: TextStyle(fontSize: 16.0)),
                        border: InputBorder.none,
                      ),
                      onSubmitted: (value) {},
                    ),
                    Divider(height: 0.0, color: Colors.blue),
                    TextField(
                      controller: _passwordController,
                      obscureText: true,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: '请输入登录密码',
                        icon: Text('密   码:', style: TextStyle(fontSize: 16.0)),
                        border: InputBorder.none,
                      ),
                      onSubmitted: (value) {},
                    ),
                    Divider(height: 0.0, color: Colors.blue),
                    Container(
                      margin: EdgeInsets.only(top: 36.0),
                      child: CupertinoButton(
                        color: Colors.blue,
                        pressedOpacity: 0.8,
                        borderRadius: BorderRadius.circular(3.0),
                        child: Center(
                          child: Text('登录'),
                        ),
                        onPressed: () {
                          if (_phoneController.text.trim().length == 0) {
                            Fluttertoast.showToast(msg: '请输入用户名！', gravity: ToastGravity.CENTER);
                            return;
                          }

                          if (_passwordController.text.trim().length == 0) {
                            Fluttertoast.showToast(msg: '请输入密码！', gravity: ToastGravity.CENTER);
                            return;
                          }

                          Timer.periodic(const Duration(milliseconds: 500), _checkForLogin);

                          showDialog<void>(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext context) {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              });
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        FlatButton(
                          padding: EdgeInsets.only(right: 0.0),
                          child: Text(
                            '忘记密码？',
                            style: TextStyle(color: Colors.blue),
                          ),
                          onPressed: () {},
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void _checkForLogin(Timer timer) {
    if (_phoneController.text == 'long' && _passwordController.text == '123456') {
      timer.cancel();
      _saveUserInfo();
      Navigator.pop(context);
      Navigator.of(context)
          .pushAndRemoveUntil(CupertinoPageRoute(builder: (BuildContext context) => MyHomePage()), (Route route) => route == null);
    } else {
      timer.cancel();
      Navigator.of(context, rootNavigator: true).pop();
      Fluttertoast.showToast(msg: '账号或密码错误！', gravity: ToastGravity.CENTER);
    }
  }

  // 保存用户登录数据
  _saveUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username', 'long');
    prefs.setString('password', '123456');
  }
}
