import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeManager extends ChangeNotifier {
  static bool isDark = false;

  ThemeManager([ThemeData? initialTheme])
      : _themeData = initialTheme ?? lightTheme;

  ThemeData _themeData;

// return the current theme
  ThemeData get themeData => _themeData;

// Sets the current theme
  set themeData(ThemeData value) {
    _themeData = value;
    notifyListeners();
  }

  static ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.lightGreen,
      primarySwatch: Colors.lightGreen);

  static ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.amber,
      primarySwatch: Colors.amber);
}
