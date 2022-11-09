import 'package:flutter/material.dart';

class theme {
  static bool isDark = false;

  static var dark = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.amber,
    primarySwatch: Colors.amber,
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        primary: Colors.white,
        side: BorderSide(
          color: Colors.white,
          width: 2,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    ),
  );

  static var light = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.amber,
    primarySwatch: Colors.amber,
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        primary: Colors.black,
        side: BorderSide(
          color: Colors.black,
          width: 2,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    ),
  );
}

class changedata {
  static var change = theme.isDark ? theme.dark : theme.light;
}
