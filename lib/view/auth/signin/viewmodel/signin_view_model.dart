import 'package:flutter/material.dart';
import 'package:kampus/core/constants/navigation_constants.dart';
import 'package:kampus/product/init/service/auth_service.dart';

import '../../../../core/init/navigation/navigation_service.dart';

class SigninViewModel extends ChangeNotifier {
  final AuthService _authService = AuthService.instance;
  final NavigationService _navigatorKey = NavigationService.instance;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  Future<bool> signUp({required String email, required String password}) async {
    isLoadingChange();

    // UserCredential
    var result = await _authService.signUpWithEmail(email: email, password: password);
    isLoadingChange();
    if (result is bool) {
      if (result) {
        // Navigate to Root
        navigateToLogin();
      }
      return false; // General sign up failure. Please try again later
    } else {
      return false; // 'Sign Up Failure'
    }
  }

  void isLoadingChange() {
    isLoading = !isLoading;
    notifyListeners();
  }

  void navigateToLogin() {
    _navigatorKey.navigateToPageFromAuthWithPageClear(path: NavigationConstants.LOGIN);
  }
}
