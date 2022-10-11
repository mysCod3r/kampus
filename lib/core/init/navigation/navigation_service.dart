import 'package:flutter/material.dart';

import 'INavigationService.dart';

class NavigationService implements INavigationService {
  static final NavigationService _instance = NavigationService._init();
  static NavigationService get instance => _instance;

  NavigationService._init();

  static final List<GlobalKey<NavigatorState>> navigatorKeys = [
    GlobalKey(debugLabel: "home"),
    GlobalKey(debugLabel: "categories"),
    GlobalKey(debugLabel: "notifications"),
    GlobalKey(debugLabel: "profile"),
  ];
  GlobalKey<NavigatorState> navigatorKey = navigatorKeys[0];

  final removeAllOldRoutes = (Route<dynamic> route) => false;

  @override
  Future<void> navigateToPage({String? path, Object? data, int? tabIndex}) async {
    navigatorKey = navigatorKeys[tabIndex!];
    await navigatorKey.currentState!.pushNamed(path!, arguments: data);
  }

  @override
  Future<void> navigateToPageReplace({String? path, Object? data, int? tabIndex}) async {
    navigatorKey = navigatorKeys[tabIndex!];
    await navigatorKey.currentState!.pushReplacementNamed(path!, arguments: data);
  }

  @override
  Future<void> navigateToPageClear({String? path, Object? data, int? tabIndex}) async {
    navigatorKey = navigatorKeys[tabIndex!];
    await navigatorKey.currentState!.pushNamedAndRemoveUntil(path!, removeAllOldRoutes, arguments: data);
  }

  Future<bool> onWillPop({int? tabIndex}) async {
    navigatorKey = navigatorKeys[tabIndex!];
    if (navigatorKey.currentState?.canPop() ?? false) {
      navigatorKey.currentState?.pop();
      return false;
    } else {
      return true;
    }
  }
}
