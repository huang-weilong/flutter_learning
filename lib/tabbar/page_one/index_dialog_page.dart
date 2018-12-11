import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

enum DialogDemoAction {
  cancel,
  discard,
  disagree,
  agree,
}

class DialogDemoItem extends StatelessWidget {
  const DialogDemoItem({Key key, this.icon, this.color, this.text, this.onPressed}) : super(key: key);

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
            padding: EdgeInsets.only(left: 16.0),
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
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  TimeOfDay _selectedTime;

  @override
  void initState() {
    super.initState();
    final DateTime now = DateTime.now();
    _selectedTime = TimeOfDay(hour: now.hour, minute: now.minute);
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
              children: <Widget>[_buildAlert(), _buildAlertWithTitle(), _buildSimple(), _buildConfirmation()],
            ),
          ],
        ));
  }

  _buildAlert() {
    return RaisedButton(
        child: Text('ALERT'),
        onPressed: () {
          showDialog<DialogDemoAction>(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                    content: Text(
                      '提示内容',
                    ),
                    actions: <Widget>[
                      FlatButton(
                          child: Text('CANCEL'),
                          onPressed: () {
                            Navigator.pop(context, DialogDemoAction.cancel);
                          }),
                      FlatButton(
                          child: Text('DISCARD'),
                          onPressed: () {
                            Navigator.pop(context, DialogDemoAction.discard);
                          })
                    ]);
              });
        });
  }

  _buildAlertWithTitle() {
    return RaisedButton(
      child: Text('有标题的对话框'),
      onPressed: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('我是标题'),
                content: Text('提示内容'),
                actions: <Widget>[
                  FlatButton(
                    child: Text('确认'),
                    onPressed: () {},
                  ),
                  FlatButton(
                    child: Text('取消'),
                    onPressed: () {},
                  ),
                ],
              );
            });
      },
    );
  }

  _buildSimple() {
    return RaisedButton(
      child: Text('SimpleDialog'),
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return SimpleDialog(
              title: Text('我是标题'),
              children: <Widget>[
                DialogDemoItem(
                    icon: Icons.account_circle,
                    color: Colors.lightBlue,
                    text: 'username@gmail.com',
                    onPressed: () {
                      Navigator.pop(context, 'username@gmail.com');
                    }),
                DialogDemoItem(
                    icon: Icons.account_circle,
                    color: Colors.lightBlue,
                    text: 'user02@gmail.com',
                    onPressed: () {
                      Navigator.pop(context, 'user02@gmail.com');
                    }),
                DialogDemoItem(icon: Icons.add_circle, text: 'add account', color: Colors.grey)
              ],
            );
          },
        );
      },
    );
  }

  _buildConfirmation() {
    return RaisedButton(
      child: Text('TimePicker'),
      onPressed: () {
        showTimePicker(context: context, initialTime: _selectedTime).then<Null>((TimeOfDay value) {
          if (value != null && value != _selectedTime) {
            _selectedTime = value;
            _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('你选择了: ${value.format(context)}')));
          }
        });
      },
    );
  }
}
