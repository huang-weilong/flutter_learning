import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class IndexButtonPage extends StatefulWidget {
  @override
  _IndexButtonPageState createState() => _IndexButtonPageState();
}

class _IndexButtonPageState extends State<IndexButtonPage> {
  String dropdownValue1 = '选项一';
  String dropdownValue2;
  String dropdownValue3;
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('按钮'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          _buildRaisedButton(),
          _buildFlatButton(),
          _buildOutlineButton(),
          _buildDropdownButton(),
          _buildIconButton(),
          _buildCupertinoButton()
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Text('长按'),
        tooltip: '我是floatingActionButton',
        onPressed: null,
      ),
    );
  }

  _buildRaisedButton() {
    return Column(
      children: <Widget>[
        Text('RaisedButton',style: TextStyle(color: Colors.redAccent),),
        RaisedButton(
          textColor: Colors.white,
          color: Colors.blue,
          child: const Text('改变了文本颜色'),
          onPressed: (){},
        ),
        Padding(padding: EdgeInsets.all(5.0),),
        RaisedButton(
          disabledTextColor: Colors.white,
          disabledColor: Colors.grey,
          child: const Text('不可点击，颜色已更改(disabledxxx)'),
          onPressed: null,
        ),
        Padding(padding: EdgeInsets.all(5.0),),
        RaisedButton.icon(
          icon: const Icon(Icons.add),
          label: const Text('添加了小图标'),
          onPressed: (){},
        ),
        Padding(padding: EdgeInsets.all(5.0),),
        RaisedButton(
          textColor: Colors.white,
          color: Colors.blue,
          splashColor: Colors.redAccent,
          shape: StadiumBorder(),//圆角
          child: const Text('体育场边界使用shape: StadiumBorder()'),
          onPressed: (){},
        ),
      ],
    );
  }

  _buildFlatButton() {
    return Column(
      children: <Widget>[
        Padding(padding: EdgeInsets.only(top: 25.0),),
        Text('FlatButton',style: TextStyle(color: Colors.redAccent),),
        FlatButton(
          child: Text('长按有水波效果'),
          onPressed: (){},
        ),
        Padding(padding: EdgeInsets.all(5.0),),
        FlatButton(
          child: Text('不可点击'),
          onPressed: null,
        ),
        Padding(padding: EdgeInsets.all(5.0),),
        FlatButton.icon(
          icon: Icon(Icons.more),
          label: Text('添加了小图标'),
          onPressed: (){},
        ),
      ],
    );
  }

  _buildOutlineButton() {
    return Column(
      children: <Widget>[
        Padding(padding: EdgeInsets.only(top: 25.0),),
        Text('OutlineButton',style: TextStyle(color: Colors.redAccent),),
        OutlineButton(
          child: Text('有轮廓的按钮'),
          onPressed: (){},
        ),
        Padding(padding: EdgeInsets.all(5.0),),
        OutlineButton(
          child: Text('不可点击'),
          onPressed: null,
        ),
        Padding(padding: EdgeInsets.all(5.0),),
        OutlineButton.icon(
          icon: Icon(Icons.access_alarm),
          label: Text('添加了小图标'),
          onPressed: (){},
        ),
      ],
    );
  }

  _buildDropdownButton() {
    return Column(
      children: <Widget>[
        Padding(padding: EdgeInsets.only(top: 25.0),),
        Text('DropdownButton',style: TextStyle(color: Colors.redAccent),),
        DropdownButton<String>(
          value: dropdownValue1,
          onChanged: (String newValue) {
            setState(() {
              if(newValue != null)
                dropdownValue1 = newValue;
            });
          },
          items: <String>['simple dropdown','选项一','选项二','选项三','选项四'].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
        Padding(padding: EdgeInsets.all(5.0),),
        DropdownButton<String>(
          value: dropdownValue2,
          hint: Text('请选择'),
          onChanged: (String newValue) {
            setState(() {
              if(newValue != null)
                dropdownValue2 = newValue;
            });
          },
          items: <String>['hint属性设置了初始的值','选项一','选项二','选项三','选项四'].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
        Padding(padding: EdgeInsets.all(5.0),),
        DropdownButton<String>(
          value: dropdownValue3,
          hint: Text('可滑动的'),
          onChanged: (String newValue) {
            setState(() {
              if(newValue != null)
                dropdownValue3 = newValue;
            });
          },
          items: <String>['hint属性设置了初始的值','选项一','选项二','选项三','选项四',
          '5','6','7','8','9','10','11','12','13','14','15'].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ],
    );
  }

  _buildIconButton() {
    return Column(
      children: <Widget>[
        Padding(padding: EdgeInsets.only(top: 25.0),),
        Text('IconButton',style: TextStyle(color: Colors.redAccent),),
        IconButton(
          icon: Icon(Icons.thumb_up),
          onPressed: (){
            setState(() => value = !value);
            },
          color: value ? Colors.lightBlue : null,
        )
      ],
    );
  }

  _buildCupertinoButton() {
    return Column(
      children: <Widget>[
        Padding(padding: EdgeInsets.only(top: 25.0),),
        Text('iOS风格按钮',style: TextStyle(color: Colors.redAccent),),
        CupertinoButton(
          child: Text('最普通的',),
          onPressed: (){},
        ),
        CupertinoButton(
          child: Text('不可点击'),
          onPressed: null,
        ),
        CupertinoButton(
          child: Text('背景色'),
          color: Colors.lightBlue,
          onPressed: (){},
        ),
        CupertinoButton(
          child: Text('不可点击'),
          color: Colors.lightBlue,
          onPressed: null,
        ),
      ],
    );
  }

}
