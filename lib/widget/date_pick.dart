import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum DateType {
  yyyyMM, // 年月
  yyyyMMdd, // 年月日
  yyyyMMddHHmmss, // 年月日时分秒
  HHmmss,
}

class DatePick extends StatefulWidget {
  DatePick({
    this.title,
    @required this.time,
    this.dateType: DateType.yyyyMMddHHmmss,
  }) : assert(time != null);

  final String title;
  final String time;
  final DateType dateType;

  @override
  _DatePickState createState() => _DatePickState();
}

class _DatePickState extends State<DatePick> {
  DateTime maxTime = DateTime(2049, 12, 31);
  DateTime minTime = DateTime(1970, 1, 1);
  DateTime currentTime;

  Map<String, int> pick;
  List<String> years = [];
  List<String> months = [];
  List<String> days = [];
  List<String> hours = [];
  List<String> minutes = [];
  List<String> seconds = [];
  String timeSelected;
  Map timeMap;

  String _show = '111111'; // 0隐藏 1显示 年月日时分秒

  void _computedShow() {
    switch (widget.dateType) {
      case DateType.HHmmss:
        _show = '000111';
        break;
      case DateType.yyyyMMdd:
        _show = '111000';
        break;
      case DateType.yyyyMM:
        _show = '110000';
        break;
      case DateType.yyyyMMddHHmmss:
        _show = '111111';
        break;
    }
  }

  void _fillYear() {
    years = List.generate(maxTime.year - minTime.year + 1, (int index) {
      return '${minTime.year + index}';
    });
  }

  void _fillMonth() {
    months = List.generate(maxTime.month - minTime.month + 1, (int index) {
      int m = minTime.month + index;
      return '${m < 10 ? '0$m' : m}';
    });
  }

  void _fillDay(int num) {
    days = List.generate(num, (int index) {
      int d = minTime.day + index;
      return '${d < 10 ? '0$d' : d}';
    });
  }

  void _fillHours() {
    hours = List.generate(24, (int index) {
      int h = minTime.day + index;
      return '${h < 10 ? '0$h' : h}';
    });
  }

  void _fillMinutes() {
    minutes = List.generate(60, (int index) {
      int m = minTime.day + index;
      return '${m < 10 ? '0$m' : m}';
    });
  }

  void _fillSeconds() {
    seconds = List.generate(60, (int index) {
      int s = minTime.day + index;
      return '${s < 10 ? '0$s' : s}';
    });
  }

  List<int> _leapYearMonths = const <int>[1, 3, 5, 7, 8, 10, 12];

  int calcDateCount(int year, int month) {
    if (_leapYearMonths.contains(month)) {
      return 31;
    } else if (month == 2) {
      if ((year % 4 == 0 && year % 100 != 0) || year % 400 == 0) {
        return 29;
      }
      return 28;
    }
    return 30;
  }

  @override
  void initState() {
    super.initState();
    _computedShow();
    _fillYear();
    _fillMonth();
    _fillDay(maxTime.day - minTime.day + 1);
    _fillHours();
    _fillMinutes();
    _fillSeconds();

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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              if (_show.substring(0, 1) == '1') _buildColorPicker(ValueKey(pick['year']), years, 'year'),
              if (_show.substring(0, 1) == '1') Text('年'),
              if (_show.substring(1, 2) == '1') _buildColorPicker(ValueKey(pick['year']), months, 'month'),
              if (_show.substring(1, 2) == '1') Text('月'),
              if (_show.substring(2, 3) == '1') _buildColorPicker(ValueKey(pick['year'] + pick['month']), days, 'day'),
              if (_show.substring(2, 3) == '1') Text('日'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              if (_show.substring(3, 4) == '1') _buildColorPicker(ValueKey(pick['year']), hours, 'hour'),
              if (_show.substring(3, 4) == '1') Text('时'),
              if (_show.substring(4, 5) == '1') _buildColorPicker(ValueKey(pick['year']), minutes, 'minute'),
              if (_show.substring(4, 5) == '1') Text('分'),
              if (_show.substring(5, 6) == '1') _buildColorPicker(ValueKey(pick['year']), seconds, 'second'),
              if (_show.substring(5, 6) == '1') Text('秒'),
            ],
          )
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
              if (widget.dateType == DateType.yyyyMMddHHmmss) {
                timeSelected =
                    '${years[pick['year']]}-${months[pick['month']]}-${days[pick['day']]} ${hours[pick['hour']]}:${minutes[pick['minute']]}:${seconds[pick['second']]}';
              } else if (widget.dateType == DateType.yyyyMMdd) {
                timeSelected = '${years[pick['year']]}-${months[pick['month']]}-${days[pick['day']]}';
              } else if (widget.dateType == DateType.HHmmss) {
                timeSelected = '${hours[pick['hour']]}:${minutes[pick['minute']]}:${seconds[pick['second']]}';
              }
            });
            Navigator.pop(context, timeSelected);
          },
        ),
      ],
    );
  }

  Widget _buildColorPicker(ValueKey key, List<String> list, String unit) {
    FixedExtentScrollController scrollController = FixedExtentScrollController(initialItem: pick[unit]);
    return SizedBox(
      height: 100.0,
      width: 60.0,
      child: CupertinoPicker(
        key: key,
        looping: false,
        scrollController: scrollController,
        itemExtent: 32.0,
//      useMagnifier: true,
        backgroundColor: CupertinoColors.white,
        onSelectedItemChanged: (int index) {
          setState(() {
            selectChange(unit, index);
          });
        },
        children: list.map((item) => Center(child: Text(item))).toList(),
      ),
    );
  }

  void selectChange(String unit, int index) {
    // index=2  ->3月份
    pick[unit] = index;
    _fillDay(calcDateCount(pick['year'], pick['month']));
  }

  Map splitTime(String timeStr) {
    Map map;
    if (widget.dateType == DateType.yyyyMMddHHmmss) {
      map = {
        'year': years.indexOf(timeStr.substring(0, 4)),
        'month': months.indexOf(timeStr.substring(5, 7)),
        'day': days.indexOf(timeStr.substring(8, 10)),
        'hour': hours.indexOf(timeStr.substring(11, 13)),
        'minute': minutes.indexOf(timeStr.substring(14, 16)),
        'second': seconds.indexOf(timeStr.substring(17, 19)),
      };
    } else if (widget.dateType == DateType.yyyyMMdd) {
      map = {
        'year': years.indexOf(timeStr.substring(0, 4)),
        'month': months.indexOf(timeStr.substring(5, 7)),
        'day': days.indexOf(timeStr.substring(8, 10))
      };
    } else if (widget.dateType == DateType.HHmmss) {
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
