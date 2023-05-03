import 'package:flutter/material.dart';

import '../../constants/color_constant.dart';

class LightTheme {
  final _lightColor = _LightColor();

  late ThemeData theme;

  LightTheme() {
    theme = ThemeData(
      scaffoldBackgroundColor: _lightColor._white,
      errorColor: _lightColor._red,
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: _lightColor._blue,
              disabledBackgroundColor: _lightColor._grey_1,
              textStyle: TextStyle(fontSize: 16, color: _lightColor._black),
              padding: const EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 24,
              ))),
      textTheme: ThemeData.light().textTheme.copyWith(
            headline1: TextStyle(fontSize: 32, color: _lightColor._black),
            subtitle1: TextStyle(fontSize: 24, color: _lightColor._black),
            subtitle2: TextStyle(fontSize: 20, color: _lightColor._black),
            bodyText1: TextStyle(fontSize: 16, color: _lightColor._black),
          ),
      appBarTheme: AppBarTheme(
        elevation: 1.0,
        color: _lightColor._white,
        titleTextStyle: TextStyle(fontSize: 24, color: _lightColor._black),
        iconTheme: IconThemeData(color: _lightColor._black),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: _lightColor._white,
        unselectedIconTheme: IconThemeData(color: _lightColor._black),
        selectedIconTheme: IconThemeData(color: _lightColor._blue),
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }
}

class _LightColor {
  final Color _white = ColorConstants.WHITE;
  final Color _black = ColorConstants.BLACK;
  final Color _blue = ColorConstants.BLUE;
  final Color _red = ColorConstants.RED;
  final Color _grey_1 = ColorConstants.GREY_1;
  final Color _grey_2 = ColorConstants.GREY_2;
  final Color _grey_3 = ColorConstants.GREY_3;
  final Color _grey_4 = ColorConstants.GREY_4;
}
