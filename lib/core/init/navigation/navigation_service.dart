import 'package:flutter/material.dart';

class NavigationService {
  static final NavigationService _instance = NavigationService._init();
  static NavigationService get instance => _instance;

  NavigationService._init();

  final removeAllOldRoutes = (Route<dynamic> route) => false;

  @override
  Future<void> navigateToPage({required GlobalKey<NavigatorState> navigatorKey, String? path, Object? data}) async {
    await navigatorKey.currentState!.pushNamed(path!, arguments: data);
  }

  @override
  Future<void> navigateToPageClear({required GlobalKey<NavigatorState> navigatorKey, String? path, Object? data}) async {
    await navigatorKey.currentState!.pushNamedAndRemoveUntil(path!, removeAllOldRoutes, arguments: data);
  }

  @override
  Future<void> navigateToPageReplace({String? path, Object? data, int? tabIndex}) {
    // TODO: implement navigateToPageReplace
    throw UnimplementedError();
  }
}
