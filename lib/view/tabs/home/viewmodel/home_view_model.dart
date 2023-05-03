import 'package:flutter/material.dart';
import 'package:kampus/core/constants/navigation_constants.dart';
import 'package:mobx/mobx.dart';
import '../../../../core/base/base_view_model.dart';

class HomeViewModel with Store, BaseViewModel {
  late GlobalKey<NavigatorState> myNavigatorKey;

  @override
  void setContext(BuildContext context) => contextt = context;
  @override
  void init() {}

  void navigateToProfile({required GlobalKey<NavigatorState> navigatorKey}) {
    navigation.navigateToPage(navigatorKey: navigatorKey, path: NavigationConstants.PROFILE);
  }
}
