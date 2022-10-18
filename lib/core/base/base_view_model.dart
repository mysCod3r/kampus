import 'package:flutter/material.dart';
import 'package:kampus/core/init/navigation/navigation_service.dart';
import 'package:kampus/core/service/auth/auth_service.dart';
import 'package:kampus/core/service/db/firestore_service.dart';

abstract class BaseViewModel {
  BuildContext? contextt;

  NavigationService navigation = NavigationService.instance;
  AuthService authService = AuthService.instance;
  FirestoreService firestoreService = FirestoreService.instance;
//  LocaleManager localeManager = LocaleManager.instance;

  void setContext(BuildContext context);
  void init();
}
