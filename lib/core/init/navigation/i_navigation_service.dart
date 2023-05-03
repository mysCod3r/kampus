import 'package:flutter/material.dart';

abstract class INavigationService {
  Future<void> navigateToPage({required GlobalKey<NavigatorState> navigatorKey, String? path, Object? data, int? tabIndex});
  Future<void> navigateToPageClear({required GlobalKey<NavigatorState> navigatorKey, String? path, Object? data, int? tabIndex});
  Future<void> navigateToPageReplace({required GlobalKey<NavigatorState> navigatorKey, String? path, Object? data, int? tabIndex});
}
