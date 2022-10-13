import 'package:flutter/cupertino.dart';

import '../../../../core/constants/navigation_constants.dart';
import '../../../../core/init/navigation/navigation_service.dart';

class SplashViewModel extends ChangeNotifier {
  final GlobalKey<NavigatorState> _navigatorKey = NavigationService.authNavigateKey;

  Key get key => _navigatorKey;

  void navigateToLogin() {
    _navigatorKey.currentState!.pushNamedAndRemoveUntil(NavigationConstants.LOGIN, (route) => false);
  }
}
