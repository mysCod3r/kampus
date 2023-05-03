import 'package:flutter/material.dart';

class ProfileNavigationService {
  static final ProfileNavigationService _instance = ProfileNavigationService._init();
  static ProfileNavigationService get instance => _instance;

  ProfileNavigationService._init();

  GlobalKey<NavigatorState> navigatorKey = GlobalKey(debugLabel: "profile");
}
