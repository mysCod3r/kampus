import 'package:flutter/material.dart';

class LightTheme {
  final _lightColor = _LightColor();

  late ThemeData theme;

  LightTheme() {
    theme = ThemeData(
        scaffoldBackgroundColor: _lightColor.white,
        textTheme: ThemeData.light().textTheme.copyWith(
            subtitle1: TextStyle(fontSize: 25, color: _lightColor._textColor)));
  }
}

class _LightColor {
  final Color _textColor = const Color.fromARGB(255, 0, 0, 0);
  final Color blueMenia = const Color.fromARGB(95, 188, 248, 1);
  final Color red = const Color.fromARGB(95, 255, 0, 0);
  final Color black = const Color.fromARGB(95, 0, 0, 0);
  final Color white = const Color.fromARGB(255, 255, 255, 255);
}
