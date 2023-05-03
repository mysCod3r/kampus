import 'package:flutter/cupertino.dart';
import 'package:kampus/core/constants/navigation_constants.dart';
import 'package:kampus/core/init/navigation/navigation_service.dart';
import 'package:kampus/core/init/navigation/services/auth_navigation_service.dart';

class SplashViewModel extends ChangeNotifier {
  final AuthNavigationService _authNavigationService = AuthNavigationService.instance;

  // ignore: prefer_final_fields
  bool _isFirst = false;
  // ignore: prefer_final_fields
  bool _isLogin = true;

  bool get isFirst => _isFirst;
  bool get isLogin => _isLogin;

  void goOnboard() {
    NavigationService.instance.navigateToPageClear(path: NavigationConstants.ONBOARD, navigatorKey: _authNavigationService.navigatorKey);
  }

  void goLogin() {
    NavigationService.instance.navigateToPageClear(path: NavigationConstants.LOGIN, navigatorKey: _authNavigationService.navigatorKey);
  }

  void goRoot() {
    NavigationService.instance.navigateToPageClear(path: NavigationConstants.ROOT, navigatorKey: _authNavigationService.navigatorKey);
  }
}
