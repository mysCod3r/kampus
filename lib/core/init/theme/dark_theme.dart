import 'package:flutter/material.dart';
import 'package:kampus/core/constants/color_constant.dart';

class DarkTheme {
  final _darkColor = _DarkColor();

  late ThemeData theme;

  DarkTheme() {
    theme = ThemeData(
        scaffoldBackgroundColor: _darkColor._black,
        textTheme: ThemeData.dark().textTheme.copyWith(
            subtitle1: TextStyle(fontSize: 25, color: _darkColor._white)));
  }
}

class _DarkColor {
  final Color _white = ColorConstants.WHITE;
  final Color _black = ColorConstants.BLACK;
  final Color _blue = ColorConstants.BLUE;
  final Color _red = ColorConstants.RED;
  final Color _grey_1 = ColorConstants.GREY_1;
  final Color _grey_2 = ColorConstants.GREY_2;
  final Color _grey_3 = ColorConstants.GREY_3;
  final Color _grey_4 = ColorConstants.GREY_4;
}
