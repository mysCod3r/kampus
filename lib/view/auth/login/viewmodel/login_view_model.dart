import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/navigation_constants.dart';
import '../../../../core/init/navigation/navigation_service.dart';
import '../../../../product/init/service/auth_service.dart';

class LoginViewModel extends ChangeNotifier {
  final AuthService _authService = AuthService.instance;
  final NavigationService _navigatorKey = NavigationService.instance;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  Future login({required String email, required String password}) async {
    isLoadingChange();
    UserCredential result = await _authService.loginWithEmail(email: email, password: password);
    isLoadingChange();
    if (result.user != null) {
      if (1 == 1) {
        _navigatorKey.navigateToPageFromAuthWithPageClear(path: NavigationConstants.ROOT);
        // Navigate to Root
      } else {
        // Couldn\'t login at this moment. Please try again later

      }
    } else {
      // Login Failure
    }
  }

  void isLoadingChange() {
    isLoading = !isLoading;
    notifyListeners();
  }

  void navigateToRegister() {
    _navigatorKey.navigateToPageFromAuth(path: NavigationConstants.SIGNIN);
  }
}
