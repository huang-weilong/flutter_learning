import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum DateType { dateAndTime, date, time }

class DatePick extends StatefulWidget {
  DatePick({
    this.title,
    @required this.time,
    this.dateType: DateType.dateAndTime,
  }) : assert(time != null);

  final String title;
  final String time;
  final DateType dateType;

  @override
  _DatePickState createState() => _DatePickState();
}

class _DatePickState extends State<DatePick> {
  Map<String, int> pick;
  List<String> years = [];
  List<String> months = [];
  List<String> days = [];
  List<String> hours = [];
  List<String> minutes = [];
  List<String> seconds = [];
  String timeSelected;
  Map timeMap;

  @override
  void initState() {
    super.initState();
    years = <String>[
      '2017',
      '2018',
      '2019',
      '2020',
      '2021',
      '2022',
    ];

    for (int i = 1; i < 13; i++) {
      if (i < 10) {
        months.add('0$i');
      } else {
        months.add('$i');
      }
    }

    for (int i = 1; i < 32; i++) {
      if (i < 10) {
        days.add('0$i');
      } else {
        days.add('$i');
      }
    }

    for (int i = 0; i < 24; i++) {
      if (i < 10) {
        hours.add('0$i');
      } else {
        hours.add('$i');
      }
    }

    for (int i = 0; i < 60; i++) {
      if (i < 10) {
        minutes.add('0$i');
        seconds.add('0$i');
      } else {
        minutes.add('$i');
        seconds.add('$i');
      }
    }
    timeMap = splitTime(widget.time);

    pick = {
      'year': timeMap['year'],
      'month': timeMap['month'],
      'day': timeMap['day'],
      'hour': timeMap['hour'],
      'minute': timeMap['minute'],
      'second': timeMap['second']
    };
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title ?? '设置时间'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          widget.dateType != DateType.time
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SizedBox(height: 100.0, width: 60.0, child: _buildColorPicker(years, 'year')),
                    Text('年'),
                    SizedBox(height: 100.0, width: 60.0, child: _buildColorPicker(months, 'month')),
                    Text('月'),
                    SizedBox(height: 100.0, width: 60.0, child: _buildColorPicker(days, 'day')),
                    Text('日'),
                  ],
                )
              : Container(),
          widget.dateType != DateType.date
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 100.0, width: 60.0, child: _buildColorPicker(hours, 'hour')),
                    Text('时'),
                    SizedBox(height: 100.0, width: 60.0, child: _buildColorPicker(minutes, 'minute')),
                    Text('分'),
                    SizedBox(height: 100.0, width: 60.0, child: _buildColorPicker(seconds, 'second')),
                    Text('秒'),
                  ],
                )
              : Container(),
        ],
      ),
      actions: <Widget>[
        FlatButton(
          child: Text('取消'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        FlatButton(
          child: Text('设置', style: TextStyle(color: Colors.blue)),
          onPressed: () {
            setState(() {
              if (widget.dateType == DateType.dateAndTime) {
                timeSelected =
                    '${years[pick['year']]}-${months[pick['month']]}-${days[pick['day']]} ${hours[pick['hour']]}:${minutes[pick['minute']]}:${seconds[pick['second']]}';
              } else if (widget.dateType == DateType.date) {
                timeSelected = '${years[pick['year']]}-${months[pick['month']]}-${days[pick['day']]}';
              } else if (widget.dateType == DateType.time) {
                timeSelected = '${hours[pick['hour']]}:${minutes[pick['minute']]}:${seconds[pick['second']]}';
              }
            });
            Navigator.pop(context, timeSelected);
          },
        ),
      ],
    );
  }

  Widget _buildColorPicker(List<String> list, String unit) {
    FixedExtentScrollController scrollController = FixedExtentScrollController(initialItem: pick[unit]);
    return CupertinoPicker(
      looping: true,
      scrollController: scrollController,
      itemExtent: 32.0,
      backgroundColor: CupertinoColors.white,
      onSelectedItemChanged: (int index) {
        setState(() {
          pick[unit] = index;
          // 计算每个月的日期
          switch (months[pick['month']]) {
            case '04':
            case '06':
            case '09':
            case '11':
              calculationDay(30);
              break;
            case '01':
            case '03':
            case '05':
            case '07':
            case '08':
            case '10':
            case '12':
              calculationDay(31);
              break;
            case '02':
              calculationFebruary(years[pick['year']]);
              break;
          }
        });
      },
      children: List<Widget>.generate(list.length, (int index) {
        return Center(
          child: Text(list[index]),
        );
      }),
    );
  }

  void calculationDay(int day) {
    days.clear();
    for (int i = 1; i < day + 1; i++) {
      if (i < 10) {
        days.add('0$i');
      } else {
        days.add('$i');
      }
    }
  }

  // 计算2月天数
  void calculationFebruary(String year) {
    int y = int.parse(year);

    days.clear();
    // 闰年
    if ((y % 4 == 0 && y % 100 != 0) || y % 400 == 0) {
      for (int i = 1; i < 30; i++) {
        if (i < 10) {
          days.add('0$i');
        } else {
          days.add('$i');
        }
      }
    } else {
      for (int i = 1; i < 29; i++) {
        if (i < 10) {
          days.add('0$i');
        } else {
          days.add('$i');
        }
      }
    }
  }

  Map splitTime(String timeStr) {
    Map map;
    if (widget.dateType == DateType.dateAndTime) {
      map = {
        'year': years.indexOf(timeStr.substring(0, 4)),
        'month': months.indexOf(timeStr.substring(5, 7)),
        'day': days.indexOf(timeStr.substring(8, 10)),
        'hour': hours.indexOf(timeStr.substring(11, 13)),
        'minute': minutes.indexOf(timeStr.substring(14, 16)),
        'second': seconds.indexOf(timeStr.substring(17, 19)),
      };
    } else if (widget.dateType == DateType.date) {
      map = {
        'year': years.indexOf(timeStr.substring(0, 4)),
        'month': months.indexOf(timeStr.substring(5, 7)),
        'day': days.indexOf(timeStr.substring(8, 10))
      };
    } else if (widget.dateType == DateType.time) {
      map = {
        'hour': hours.indexOf(timeStr.substring(0, 2)),
        'minute': minutes.indexOf(timeStr.substring(3, 5)),
        'second': seconds.indexOf(timeStr.substring(6, 8)),
      };
    }

    print('splitResult== $map');
    return map;
  }
}
