import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learning/pick_model.dart';

typedef DateChangedCallback(DateTime time);
typedef String StringAtIndexCallBack(int index);

//////////// example //////////////////
class Test3 extends StatefulWidget {
  @override
  _Test3State createState() => _Test3State();
}

class _Test3State extends State<Test3> {
  String date = '2019-02-02';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('测试'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text(date),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return DatePick(dateType: DateType.YYYY_MM);
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
              onPressed: () {
                DatePicker.showDatePicker(context, minTime: DateTime(2019, 1, 1), maxTime: DateTime(2020, 3, 6));
              },
              child: Text('test'),
            ),
          ],
        ),
      ),
    );
  }
}

//////////////////////////// plugin //////////////////////////////////
class DatePicker {
  static void showDatePicker(
    BuildContext context, {
    DateTime minTime,
    DateTime maxTime,
    DateType dateType,
  }) {
    showModalBottomSheet(
      context: context,
      builder: (_) => DatePick(
        dateType: DateType.YYYY_MM,
        pickModel: DatePickModel(maxTime: maxTime, minTime: minTime),
      ),
    );
  }
}

enum DateType {
  YYYY,
  YYYY_MM,
  YYYY_MM_dd,
  YYYY_MM_dd_HH_mm_ss,
}

class DatePick extends StatefulWidget {
  DatePick({
    @required this.dateType,
    pickModel,
  }) : this.pickerModel = pickModel ?? DatePickModel();

  final DateType dateType;
  final BasePickModel pickerModel;

  @override
  _DatePickState createState() => _DatePickState();
}

class _DatePickState extends State<DatePick> {
  FixedExtentScrollController yearScrollCtrl, monthScrollCtrl, dayScrollCtrl, hourScrollCtrl, minuteScrollCtrl, secondScrollCtrl;
  String _show = '';

  @override
  void initState() {
    super.initState();
    _computedShow();
    refreshScrollOffset();
  }

  void refreshScrollOffset() {
    yearScrollCtrl = FixedExtentScrollController(initialItem: widget.pickerModel.currentYearIndex());
    monthScrollCtrl = FixedExtentScrollController(initialItem: widget.pickerModel.currentMonthIndex());
    dayScrollCtrl = FixedExtentScrollController(initialItem: widget.pickerModel.currentDayIndex());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              print('---->>>${widget.pickerModel.finalTime()}');
            },
            child: Text('确定'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              if (_show.substring(0, 1) == '1')
                _buildPick(ValueKey(widget.pickerModel.currentYearIndex()), yearScrollCtrl, widget.pickerModel.yearStringAtIndex, (index) {
                  widget.pickerModel.setYearIndex(index);
                }, (index) {
                  setState(() {
                    refreshScrollOffset();
                  });
                }),
              if (_show.substring(1, 2) == '1')
                _buildPick(ValueKey(widget.pickerModel.currentYearIndex()), monthScrollCtrl, widget.pickerModel.monthStringAtIndex,
                    (index) {
                  widget.pickerModel.setMonthIndex(index);
                }, (index) {
                  setState(() {
                    refreshScrollOffset();
                  });
                }),
              if (_show.substring(2, 3) == '1')
                _buildPick(ValueKey(widget.pickerModel.currentMonthIndex() + widget.pickerModel.currentYearIndex()), dayScrollCtrl,
                    widget.pickerModel.dayStringAtIndex, (index) {
                  widget.pickerModel.setDayIndex(index);
                }, null),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildPick(
    ValueKey key,
    FixedExtentScrollController scrollController,
    StringAtIndexCallBack stringAtIndexCB,
    ValueChanged<int> selectedChangedWhenScrolling,
    ValueChanged<int> selectedChangedWhenScrollEnd,
  ) {
    return SizedBox(
      height: 300.0,
      width: 60.0,
      child: NotificationListener(
        onNotification: (ScrollNotification notification) {
          if (notification.depth == 0 &&
              selectedChangedWhenScrollEnd != null &&
              notification is ScrollEndNotification &&
              notification.metrics is FixedExtentMetrics) {
            final FixedExtentMetrics metrics = notification.metrics;
            final int currentItemIndex = metrics.itemIndex;
            selectedChangedWhenScrollEnd(currentItemIndex);
          }
          return false;
        },
        child: CupertinoPicker.builder(
            key: key,
            backgroundColor: Colors.white,
            scrollController: scrollController,
            itemExtent: 30.0,
            onSelectedItemChanged: (int index) {
              selectedChangedWhenScrolling(index);
            },
            useMagnifier: true,
            itemBuilder: (BuildContext context, int index) {
              final content = stringAtIndexCB(index);
              if (content == null) {
                return null;
              }
              return Container(
                height: 30.0,
                alignment: Alignment.center,
                child: Text(
                  content,
                  textAlign: TextAlign.start,
                ),
              );
            }),
      ),
    );
  }

  void _computedShow() {
    switch (widget.dateType) {
      case DateType.YYYY:
        _show = '100000';
        break;
      case DateType.YYYY_MM_dd:
        _show = '111000';
        break;
      case DateType.YYYY_MM:
        _show = '110000';
        break;
      case DateType.YYYY_MM_dd_HH_mm_ss:
        _show = '111111';
        break;
    }
  }
}
