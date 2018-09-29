// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

double _kPickerSheetHeight = 216.0;
double _kPickerItemHeight = 32.0;

class IndexCupertinoPicker extends StatefulWidget {
  static String routeName = '/cupertino/picker';

  @override
  _IndexCupertinoPickerState createState() => _IndexCupertinoPickerState();
}

class _IndexCupertinoPickerState extends State<IndexCupertinoPicker> {
  int _selectedColorIndex = 0;

  Duration timer = Duration();

  List<String> coolColorNames = <String>[
    'Sarcoline',
    'Coquelicot',
    'Smaragdine',
    'Mikado',
    'Glaucous',
    'Wenge',
    'Fulvous',
    'Xanadu',
    'Falu',
    'Eburnean',
    'Amaranth',
    'Australien',
    'Banan',
    'Falu',
    'Gingerline',
    'Incarnadine',
    'Labrador',
    'Nattier',
    'Pervenche',
    'Sinoper',
    'Verditer',
    'Watchet',
    'Zaffre',
  ];

  Widget _buildMenu(List<Widget> children) {
    return Container(
      decoration: BoxDecoration(
        color: CupertinoColors.white,
        border: Border(
          top: BorderSide(color: Color(0xFFBCBBC1), width: 0.0),
          bottom: BorderSide(color: Color(0xFFBCBBC1), width: 0.0),
        ),
      ),
      height: 44.0,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: SafeArea(
          top: false,
          bottom: false,
          child: DefaultTextStyle(
            style: TextStyle(
              letterSpacing: -0.24,
              fontSize: 17.0,
              color: CupertinoColors.black,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: children,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildColorPicker() {
    final FixedExtentScrollController scrollController = FixedExtentScrollController(initialItem: _selectedColorIndex);
    return CupertinoPicker(
      scrollController: scrollController,
      itemExtent: _kPickerItemHeight,
      backgroundColor: CupertinoColors.white,
      onSelectedItemChanged: (int index) {
        setState(() {
          _selectedColorIndex = index;
        });
      },
      children: List<Widget>.generate(coolColorNames.length, (int index) {
        return Center(
          child: Text(coolColorNames[index]),
        );
      }),
    );
  }

  Widget _buildBottomPicker(Widget picker) {
    return Container(
      height: _kPickerSheetHeight,
      color: CupertinoColors.white,
      child: DefaultTextStyle(
        style: TextStyle(
          color: CupertinoColors.black,
          fontSize: 22.0,
        ),
        child: GestureDetector(
          // Blocks taps from propagating to the modal sheet and popping.
          onTap: () {},
          child: SafeArea(
            child: picker,
          ),
        ),
      ),
    );
  }

  Widget _buildCountdownTimerPicker(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showCupertinoModalPopup<void>(
          context: context,
          builder: (BuildContext context) {
            return _buildBottomPicker(
              CupertinoTimerPicker(
                mode: CupertinoTimerPickerMode.hm,
                initialTimerDuration: timer,
                onTimerDurationChanged: (Duration newTimer) {
                  setState(() {
                    timer = newTimer;
                  });
                },
              ),
            );
          },
        );
      },
      child: _buildMenu(<Widget>[
        Text('Countdown Timer'),
        Text(
          '${timer.inHours}:'
              '${(timer.inMinutes % 60).toString().padLeft(2, '0')}:'
              '${(timer.inSeconds % 60).toString().padLeft(2, '0')}',
          style: TextStyle(color: CupertinoColors.inactiveGray),
        ),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cupertino Picker'),
      ),
      body: DefaultTextStyle(
        style: TextStyle(
          fontFamily: '.SF UI Text',
          fontSize: 17.0,
          color: CupertinoColors.black,
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(color: Color(0xFFEFEFF4)),
          child: ListView(
            children: <Widget>[
              Padding(padding: EdgeInsets.only(top: 32.0)),
              GestureDetector(
                onTap: () async {
                  await showCupertinoModalPopup<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return _buildBottomPicker(_buildColorPicker());
                    },
                  );
                },
                child: _buildMenu(<Widget>[
                  Text('Favorite Color'),
                  Text(
                    coolColorNames[_selectedColorIndex],
                    style: TextStyle(color: CupertinoColors.inactiveGray),
                  ),
                ]),
              ),
              _buildCountdownTimerPicker(context),
            ],
          ),
        ),
      ),
    );
  }
}
