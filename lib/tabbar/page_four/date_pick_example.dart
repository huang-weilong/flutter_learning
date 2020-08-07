import 'package:flutter/material.dart';

import '../../widget/date_pick.dart';

class DatePickExample extends StatefulWidget {
  @override
  _DatePickExampleState createState() => _DatePickExampleState();
}

class _DatePickExampleState extends State<DatePickExample> {
  String date = '2019-02-02';
  String time = '23:45:59';
  String dateAndTime = '2019-02-14 01:23:45';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('时间选择器'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            RaisedButton(
              child: Text(date),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return DatePick(title: '选择时间', time: date, dateType: DateType.yyyyMMdd);
                  },
                ).then((result) {
                  if (result != null) {
                    setState(() {
                      date = result;
                    });
                  }
                });
              },
            ),
            RaisedButton(
              child: Text(time),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return DatePick(title: '选择时间', time: time, dateType: DateType.HHmmss);
                  },
                ).then((result) {
                  if (result != null) {
                    setState(() {
                      time = result;
                    });
                  }
                });
              },
            ),
            RaisedButton(
              child: Text(dateAndTime),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return DatePick(title: '选择时间', time: dateAndTime);
                  },
                ).then((result) {
                  if (result != null) {
                    setState(() {
                      dateAndTime = result;
                    });
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
