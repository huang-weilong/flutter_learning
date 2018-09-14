import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


enum DialogDemoAction {
  cancel,
  discard,
  disagree,
  agree,
}

class DialogDemoItem extends StatelessWidget {
  const DialogDemoItem({ Key key, this.icon, this.color, this.text, this.onPressed }) : super(key: key);

  final IconData icon;
  final Color color;
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SimpleDialogOption(
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(icon, size: 36.0, color: color),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(text),
          ),
        ],
      ),
    );
  }
}


class IndexDialogPage extends StatefulWidget {
  @override
  _IndexDialogPageState createState() => _IndexDialogPageState();
}

class _IndexDialogPageState extends State<IndexDialogPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TimeOfDay _selectedTime;

  @override
  void initState() {
    super.initState();
    final DateTime now = new DateTime.now();
    _selectedTime = new TimeOfDay(hour: now.hour, minute: now.minute);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Alert对话框'),
        elevation: 0.0,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _buildAlert(),
              _buildAlertWithTitle(),
              _buildSimple(),
              _buildConfirmation(),
              _buildCupertinoDialogs()
            ],
          ),
        ],
      )
    );
  }

//  void showDemoDialog<T>({ BuildContext context, Widget child }) {
//    showDialog<T>(
//      context: context,
//      builder: (BuildContext context) => child,
//    )
//        .then<void>((T value) { // The value passed to Navigator.pop() or null.
//      if (value != null) {
//        _scaffoldKey.currentState.showSnackBar(new SnackBar(
//            content: new Text('You selected: $value')
//        ));
//      }
//    });
//  }

  _buildAlert() {
    return RaisedButton(
        child: const Text('ALERT'),
        onPressed: () {
          showDialog<DialogDemoAction>(
              context: context,
              child: new AlertDialog(
                  content: new Text(
                      '提示内容',
                  ),
                  actions: <Widget>[
                    new FlatButton(
                        child: const Text('CANCEL'),
                        onPressed: () { Navigator.pop(context, DialogDemoAction.cancel); }
                    ),
                    new FlatButton(
                        child: const Text('DISCARD'),
                        onPressed: () { Navigator.pop(context, DialogDemoAction.discard); }
                    )
                  ]
              )
          );
        }
    );
  }

  _buildAlertWithTitle() {
    return RaisedButton(
      child: const Text('有标题的对话框'),
      onPressed: (){
        showDialog(
          context: context,
          child: AlertDialog(
            title: Text('我是标题'),
            content: Text('提示内容'),
            actions: <Widget>[
              FlatButton(
                child: const Text('确认'),
                onPressed: (){},
              ),
              FlatButton(
                child: const Text('取消'),
                onPressed: (){},
              ),
            ],
          )
        );
      },
    );
  }

  _buildSimple() {
    return RaisedButton(
      child: const Text('SimpleDialog'),
      onPressed: (){
        showDialog(
          context: context,
          child: SimpleDialog(
            title: Text('我是标题'),
            children: <Widget>[
              DialogDemoItem(
                  icon: Icons.account_circle,
                  color: Colors.lightBlue,
                  text: 'username@gmail.com',
                  onPressed: () { Navigator.pop(context, 'username@gmail.com'); }
              ),
              DialogDemoItem(
                  icon: Icons.account_circle,
                  color: Colors.lightBlue,
                  text: 'user02@gmail.com',
                  onPressed: () { Navigator.pop(context, 'user02@gmail.com'); }
              ),
              DialogDemoItem(
                  icon: Icons.add_circle,
                  text: 'add account',
                  color: Colors.grey
              )
            ],
          )
        );
      },
    );
  }

  _buildConfirmation() {
    return RaisedButton(
      child: const Text('confirmation'),
      onPressed: (){
        showTimePicker(context: context, initialTime: _selectedTime)
            .then<Null>((TimeOfDay value) {
              if(value != null && value != _selectedTime) {
                _selectedTime = value;
                _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('你选择了: ${value.format(context)}')));
              }
        });
      },
    );
  }

  _buildCupertinoDialogs() {
    return Column(
      children: <Widget>[
        Text('iOS风格的对话框',style: TextStyle(color: Colors.redAccent),),
        CupertinoButton(
          child: const Text('iOS对话框'),
          color: Colors.blue,
          onPressed: (){
            showDialog(
              context: context,
              child: CupertinoAlertDialog(
                title: Text('我是标题'),
                content: Text('我是描述信息'),
                actions: <Widget>[
                  CupertinoDialogAction(
                    child: const Text('确认'),
                    isDestructiveAction: true,//颜色变红(删除、取消的意思）
                    onPressed: (){Navigator.pop(context);},
                  ),
                  CupertinoDialogAction(
                    child: const Text('取消'),
                    isDefaultAction: true,//内容加粗
                    onPressed: (){Navigator.pop(context);},
                  )
                ],
              )
            );
          },
        ),
      ],
    );
  }
}
