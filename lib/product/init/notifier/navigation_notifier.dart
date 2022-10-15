import 'package:flutter/material.dart';

class NavigationNotifier extends ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  set currentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  set currentPath(String path) {
    notifyListeners();
  }
}
