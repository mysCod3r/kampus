import 'package:flutter/material.dart';

class CategoriesNavigationService {
  static final CategoriesNavigationService _instance = CategoriesNavigationService._init();
  static CategoriesNavigationService get instance => _instance;

  CategoriesNavigationService._init();

  GlobalKey<NavigatorState> navigatorKey = GlobalKey(debugLabel: "categories");
}
