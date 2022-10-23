import 'package:flutter/material.dart';

abstract class INavigationService {
  Future<void> navigateToPage({required GlobalKey<NavigatorState> navigatorKey, required String path, Object? data});
  Future<void> navigateToPageClear({required GlobalKey<NavigatorState> navigatorKey, required String path, Object? data});
  Future<void> navigateToPageReplace({required GlobalKey<NavigatorState> navigatorKey, required String path, Object? data});
}
