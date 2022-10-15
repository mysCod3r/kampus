import 'package:flutter/material.dart';
import 'package:kampus/core/init/navigation/navigation_service.dart';

abstract class BaseViewModel {
  BuildContext? contextt;

  NavigationService navigation = NavigationService.instance;
//  LocaleManager localeManager = LocaleManager.instance;

  void setContext(BuildContext context);
  void init();
}
