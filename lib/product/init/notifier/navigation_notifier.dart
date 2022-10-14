import 'package:flutter/material.dart';
import 'package:kampus/core/init/navigation/services/categories_navigation_service.dart';
import 'package:kampus/core/init/navigation/services/home_navigation_service.dart';
import 'package:kampus/core/init/navigation/services/notifications_navigation_service.dart';
import 'package:kampus/core/init/navigation/services/profile_navigation_service.dart';

class NavigationNotifier extends ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  String _currentPath = "";
  String get currentPath => _currentPath;

  List<GlobalKey<NavigatorState>> navigationKeys = [
    HomeNavigationService.instance.navigatorKey,
    NotificationsNavigationService.instance.navigatorKey,
    CategoriesNavigationService.instance.navigatorKey,
    ProfileNavigationService.instance.navigatorKey,
  ];

  GlobalKey<NavigatorState> get currentKey => navigationKeys[_currentIndex];

  set currentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  set currentPath(String path) {
    _currentPath = path;
    notifyListeners();
  }

  Future<bool> onWillPop() async {
    final isFirstRouteInCurrentTab = !await currentKey.currentState!.maybePop();
    if (isFirstRouteInCurrentTab) {
      if (currentIndex != 0) {
        currentIndex = 0;
        return false;
      }
    }
    return isFirstRouteInCurrentTab;
  }
}
