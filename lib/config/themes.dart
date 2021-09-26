import 'package:flutter/material.dart';
import 'package:flutter_learning/main.dart';
import 'package:provider/provider.dart';
import 'package:flutter_learning/util/sp_client.dart';

class Themes with ChangeNotifier {
  static final Map<String, Color> colorMap = {
    'blue': Colors.blue,
    'red': Colors.red,
  };

  Color _primaryColor = colorMap['blue'];

  void changeTheme(String theme) {
    SpClient.sp.setString('theme', theme);
    _primaryColor = colorMap[SpClient.sp.getString('theme')];
    notifyListeners();
  }

  static Color primaryColor(BuildContext context) {
    return Provider.of<Themes>(context)._primaryColor;
  }
}
