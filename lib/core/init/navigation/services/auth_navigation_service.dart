import 'package:flutter/material.dart';

class AuthNavigationService {
  static final AuthNavigationService _instance = AuthNavigationService._init();
  static AuthNavigationService get instance => _instance;

  AuthNavigationService._init();

  GlobalKey<NavigatorState> navigatorKey = GlobalKey(debugLabel: "auth");
}
