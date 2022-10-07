import 'package:flutter/material.dart';

class DarkTheme {
  final _darkColor = _DarkColor();

  late ThemeData theme;

  DarkTheme() {
    theme = ThemeData(
        scaffoldBackgroundColor: _darkColor.black,
        textTheme: ThemeData.dark().textTheme.copyWith(
            subtitle1: TextStyle(fontSize: 25, color: _darkColor._textColor)));
  }
}

class _DarkColor {
  final Color _textColor = const Color.fromARGB(255, 255, 255, 255);
  final Color blueMenia = const Color.fromARGB(95, 188, 248, 1);
  final Color red = const Color.fromARGB(95, 255, 0, 0);
  final Color black = const Color.fromARGB(95, 0, 0, 0);
}
