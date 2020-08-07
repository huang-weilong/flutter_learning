abstract class BasePickModel {
  String yearStringAtIndex(int index);
  String monthStringAtIndex(int index);
  String dayStringAtIndex(int index);
  String hourStringAtIndex(int index);
  String minuteStringAtIndex(int index);
  String secondStringAtIndex(int index);
  void setYearIndex(int index);
  void setMonthIndex(int index);
  void setDayIndex(int index);
  void setHourIndex(int index);
  void setMinuteIndex(int index);
  void setSecondIndex(int index);
  int currentYearIndex();
  int currentMonthIndex();
  int currentDayIndex();
  int currentHourIndex();
  int currentMinuteIndex();
  int currentSecondIndex();
  DateTime finalTime();
}

class CommonPickModel extends BasePickModel {
  List<String> yearList = [];
  List<String> monthList = [];
  List<String> dayList = [];
  List<String> hourList = [];
  List<String> minuteList = [];
  List<String> secondList = [];
  DateTime currentTime;
  int _currentYearIndex;
  int _currentMonthIndex;
  int _currentDayIndex;
  int _currentHourIndex;
  int _currentMinuteIndex;
  int _currentSecondIndex;

  @override
  String yearStringAtIndex(int index) {
    return null;
  }

  @override
  String monthStringAtIndex(int index) {
    return null;
  }

  @override
  String dayStringAtIndex(int index) {
    return null;
  }

  @override
  String hourStringAtIndex(int index) {
    return null;
  }

  @override
  String minuteStringAtIndex(int index) {
    return null;
  }

  @override
  String secondStringAtIndex(int index) {
    return null;
  }

  @override
  void setDayIndex(int index) {
    _currentDayIndex = index;
  }

  @override
  void setMonthIndex(int index) {
    _currentMonthIndex = index;
  }

  @override
  void setYearIndex(int index) {
    _currentYearIndex = index;
  }

  @override
  void setHourIndex(int index) {
    _currentHourIndex = index;
  }

  @override
  void setMinuteIndex(int index) {
    _currentMinuteIndex = index;
  }

  @override
  void setSecondIndex(int index) {
    _currentSecondIndex = index;
  }

  @override
  int currentYearIndex() => _currentYearIndex;

  @override
  int currentDayIndex() {
    return _currentDayIndex;
  }

  @override
  int currentMonthIndex() {
    return _currentMonthIndex;
  }

  @override
  DateTime finalTime() {
    return null;
  }

  @override
  int currentHourIndex() {
    return _currentHourIndex;
  }

  @override
  int currentMinuteIndex() {
    return _currentMinuteIndex;
  }

  @override
  int currentSecondIndex() {
    return _currentSecondIndex;
  }
}

class DatePickModel extends CommonPickModel {
  DateTime maxTime;
  DateTime minTime;

  DatePickModel({DateTime currentTime, DateTime maxTime, DateTime minTime}) {
    this.maxTime = maxTime ?? DateTime(2049, 12, 31);
    this.minTime = minTime ?? DateTime(1970, 1, 1);

    currentTime = currentTime ?? DateTime.now();
    if (currentTime != null) {
      if (currentTime.compareTo(this.maxTime) > 0) {
        currentTime = this.maxTime;
      } else if (currentTime.compareTo(this.minTime) < 0) {
        currentTime = this.minTime;
      }
    }
    this.currentTime = currentTime;

    _fillYearLists();
    _fillMonthLists();
    _fillDayLists();
    int minMonth = _minMonthOfCurrentYear();
    int minDay = _minDayOfCurrentMonth();
    _currentYearIndex = this.currentTime.year - this.minTime.year;
    _currentMonthIndex = this.currentTime.month - minMonth;
    _currentDayIndex = this.currentTime.day - minDay;
  }

  void _fillYearLists() {
    this.yearList = List.generate(maxTime.year - minTime.year + 1, (int index) {
      return '${minTime.year + index}';
    });
  }

  int _maxMonthOfCurrentYear() {
    return currentTime.year == maxTime.year ? maxTime.month : 12;
  }

  int _minMonthOfCurrentYear() {
    return currentTime.year == minTime.year ? minTime.month : 1;
  }

  int _maxDayOfCurrentMonth() {
    int dayCount = calcDateCount(currentTime.year, currentTime.month);
    return currentTime.year == maxTime.year && currentTime.month == maxTime.month ? maxTime.day : dayCount;
  }

  int _minDayOfCurrentMonth() {
    return currentTime.year == minTime.year && currentTime.month == minTime.month ? minTime.day : 1;
  }

  void _fillMonthLists() {
    int minMonth = _minMonthOfCurrentYear();
    int maxMonth = _maxMonthOfCurrentYear();
    print('minMonth = $minMonth   maxMonth = $maxMonth');

    this.monthList = List.generate(maxMonth - minMonth + 1, (int index) {
      return '${minMonth + index}';
    });
  }

  void _fillDayLists() {
    int maxDay = _maxDayOfCurrentMonth();
    int minDay = _minDayOfCurrentMonth();
    this.dayList = List.generate(maxDay - minDay + 1, (int index) {
      return '${minDay + index}';
    });
  }

  @override
  void setYearIndex(int index) {
    super.setYearIndex(index);
    //adjust month
    int destYear = index + minTime.year;
    int minMonth = _minMonthOfCurrentYear();
    DateTime newTime;
    //change date time
    if (currentTime.month == 2 && currentTime.day == 29) {
      newTime = currentTime.isUtc
          ? DateTime.utc(
              destYear,
              currentTime.month,
              calcDateCount(destYear, 2),
            )
          : DateTime(
              destYear,
              currentTime.month,
              calcDateCount(destYear, 2),
            );
    } else {
      newTime = currentTime.isUtc
          ? DateTime.utc(
              destYear,
              currentTime.month,
              currentTime.day,
            )
          : DateTime(
              destYear,
              currentTime.month,
              currentTime.day,
            );
    }
    //min/max check
    if (newTime.isAfter(maxTime)) {
      currentTime = maxTime;
    } else if (newTime.isBefore(minTime)) {
      currentTime = minTime;
    } else {
      currentTime = newTime;
    }

    _fillMonthLists();
    _fillDayLists();
    minMonth = _minMonthOfCurrentYear();
    int minDay = _minDayOfCurrentMonth();
    _currentMonthIndex = currentTime.month - minMonth;
    _currentDayIndex = currentTime.day - minDay;
  }

  @override
  void setMonthIndex(int index) {
    super.setMonthIndex(index);
    //adjust day
    int minMonth = _minMonthOfCurrentYear();
    int destMonth = minMonth + index;
    DateTime newTime;
    //change date time
    int dayCount = calcDateCount(currentTime.year, destMonth);
    newTime = currentTime.isUtc
        ? DateTime.utc(
            currentTime.year,
            destMonth,
            currentTime.day <= dayCount ? currentTime.day : dayCount,
          )
        : DateTime(
            currentTime.year,
            destMonth,
            currentTime.day <= dayCount ? currentTime.day : dayCount,
          );
    //min/max check
    if (newTime.isAfter(maxTime)) {
      currentTime = maxTime;
    } else if (newTime.isBefore(minTime)) {
      currentTime = minTime;
    } else {
      currentTime = newTime;
    }

    _fillDayLists();
    int minDay = _minDayOfCurrentMonth();
    _currentDayIndex = currentTime.day - minDay;
  }

  @override
  void setDayIndex(int index) {
    super.setDayIndex(index);
    int minDay = _minDayOfCurrentMonth();
    currentTime = currentTime.isUtc
        ? DateTime.utc(
            currentTime.year,
            currentTime.month,
            minDay + index,
          )
        : DateTime(
            currentTime.year,
            currentTime.month,
            minDay + index,
          );
  }

  @override
  void setHourIndex(int index) {
    super.setHourIndex(index);
  }

  @override
  String yearStringAtIndex(int index) {
    if (index >= 0 && index < yearList.length) {
      return yearList[index];
    } else {
      return null;
    }
  }

  @override
  String monthStringAtIndex(int index) {
    if (index >= 0 && index < monthList.length) {
      return monthList[index];
    } else {
      return null;
    }
  }

  @override
  String dayStringAtIndex(int index) {
    if (index >= 0 && index < dayList.length) {
      return dayList[index];
    } else {
      return null;
    }
  }

  @override
  DateTime finalTime() {
    return currentTime;
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
}
