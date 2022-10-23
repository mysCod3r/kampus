import 'package:flutter/material.dart';
import 'package:kampus/core/init/navigation/i_navigation_service.dart';

class NavigationService extends INavigationService {
  static final NavigationService _instance = NavigationService._init();
  static NavigationService get instance => _instance;

  NavigationService._init();

  final removeAllOldRoutes = (Route<dynamic> route) => false;

  @override
  Future<void> navigateToPage({required GlobalKey<NavigatorState> navigatorKey, required String path, Object? data}) async {
    await navigatorKey.currentState!.pushNamed(path);
  }

  Future<void> navigateToPopAndPushPage({required GlobalKey<NavigatorState> navigatorKey, required String path, Object? data}) async {
    await navigatorKey.currentState!.popAndPushNamed(path);
  }

  void navigatePop({required context, required String path, Object? data}) {
    Navigator.of(context).pop();
  }

  @override
  Future<void> navigateToPageClear({required GlobalKey<NavigatorState> navigatorKey, String? path, Object? data}) async {
    await navigatorKey.currentState!.pushNamedAndRemoveUntil(path!, removeAllOldRoutes, arguments: data);
  }

  @override
  Future<void> navigateToPageReplace({required GlobalKey<NavigatorState> navigatorKey, required String path, Object? data}) {
    throw UnimplementedError();
  }
}
