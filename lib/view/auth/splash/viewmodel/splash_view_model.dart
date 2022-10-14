import 'package:flutter/cupertino.dart';
import 'package:kampus/core/constants/navigation_constants.dart';
import 'package:kampus/core/init/navigation/navigation_service.dart';
import 'package:kampus/core/init/navigation/services/auth_navigation_service.dart';
import 'package:kampus/view/auth/login/view/login_view.dart';
import 'package:kampus/view/auth/splash/model/splash_model.dart';
import 'package:kampus/view/root/view/root_view.dart';

class SplashViewModel extends ChangeNotifier {
  final AuthNavigationService _authNavigationService = AuthNavigationService.instance;

  // ignore: prefer_final_fields
  bool _isFirst = false;
  // ignore: prefer_final_fields
  bool _isLogin = false;

  bool get isFirst => _isFirst;
  bool get isLogin => _isLogin;

  List get pages => [
        SplashModel(page: const RootView()),
        SplashModel(page: const LoginView(), navigatorkey: _authNavigationService.navigatorKey),
      ];

  void goOnboard() async {
    await Future.delayed(const Duration(seconds: 1), () {
      NavigationService.instance.navigateToPageClear(path: NavigationConstants.ONBOARD, navigatorKey: _authNavigationService.navigatorKey);
    });
  }

  void goLogin() async {
    await Future.delayed(const Duration(seconds: 1), () {
      NavigationService.instance.navigateToPageClear(path: NavigationConstants.LOGIN, navigatorKey: _authNavigationService.navigatorKey);
    });
  }

  void goRoot() async {
    await Future.delayed(const Duration(seconds: 1), () {
      NavigationService.instance.navigateToPageClear(path: NavigationConstants.ROOT, navigatorKey: _authNavigationService.navigatorKey);
    });
  }
}
