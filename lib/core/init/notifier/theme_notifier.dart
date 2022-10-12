import 'package:flutter/material.dart';
import 'package:kampus/core/init/theme/dark_theme.dart';
import '../theme/light_theme.dart';

class ThemeNotifier extends ChangeNotifier {
  bool isLightTheme = false;

  void changeTheme() {
    isLightTheme = !isLightTheme;
    notifyListeners();
  }

  ThemeData get currentTheme => !isLightTheme ? LightTheme().theme : DarkTheme().theme;
}
