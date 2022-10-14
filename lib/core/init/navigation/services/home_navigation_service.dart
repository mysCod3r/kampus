import 'package:flutter/material.dart';

class HomeNavigationService {
  static final HomeNavigationService _instance = HomeNavigationService._init();
  static HomeNavigationService get instance => _instance;

  HomeNavigationService._init();

  GlobalKey<NavigatorState> navigatorKey = GlobalKey(debugLabel: "home");
}
