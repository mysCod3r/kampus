// ignore_for_file: unused_field

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
          backgroundColor: _lightColor._purple_1,
          animationDuration: const Duration(seconds: 1),
          shape: const StadiumBorder(),
          disabledForegroundColor: _lightColor._grey_1,
          disabledBackgroundColor: _lightColor._grey_2,
          padding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 24,
          ),
        ),
      ),
      textTheme: ThemeData.light().textTheme.copyWith(
            headline1: TextStyle(fontSize: 32, color: _lightColor._black),
            subtitle1: TextStyle(fontSize: 16, color: _lightColor._black),
            subtitle2: TextStyle(fontSize: 12, color: _lightColor._black),
            bodyText1: TextStyle(fontSize: 16, color: _lightColor._black),
          ),
      appBarTheme: AppBarTheme(
        centerTitle: true,
        toolbarHeight: 50,
        elevation: 0.5,
        color: _lightColor._white,
        titleTextStyle: TextStyle(fontSize: 24, color: _lightColor._black),
        iconTheme: IconThemeData(color: _lightColor._black, size: 30),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: _lightColor._white,
        unselectedIconTheme: IconThemeData(color: _lightColor._black),
        selectedIconTheme: IconThemeData(color: _lightColor._blue),
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: _lightColor._white_2,
        filled: true,
        iconColor: _lightColor._purple_1,
        labelStyle: TextStyle(color: _lightColor._grey_2),
        errorStyle: TextStyle(color: _lightColor._red, decorationColor: _lightColor._red),
        hintStyle: TextStyle(color: _lightColor._red),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 3, color: _lightColor._purple_1),
          borderRadius: BorderRadius.circular(30),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: _lightColor._purple_2),
          borderRadius: BorderRadius.circular(30),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 4, color: _lightColor._red),
          borderRadius: BorderRadius.circular(30),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 3, color: _lightColor._grey_2),
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      iconTheme: IconThemeData(color: _lightColor._purple_1),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          disabledForegroundColor: _lightColor._grey_3,
          foregroundColor: _lightColor._purple_1,
        ),
      ),
    );
  }
}

class _LightColor {
  final Color _white = ColorConstants.WHITE;
  final Color _white_2 = ColorConstants.WHITE_2;
  final Color _black = ColorConstants.BLACK;
  final Color _blue = ColorConstants.BLUE;
  final Color _red = ColorConstants.RED;
  final Color _purple_1 = ColorConstants.PURPLE;
  final Color _purple_2 = ColorConstants.PURPLE_SH;
  final Color _grey_1 = ColorConstants.GREY_1;
  final Color _grey_2 = ColorConstants.GREY_2;
  final Color _grey_3 = ColorConstants.GREY_3;
  final Color _grey_4 = ColorConstants.GREY_4;
}
