import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import '../../../../core/base/base_view_model.dart';
import '../../../../core/constants/navigation_constants.dart';

class MessagesViewModel with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => contextt = context;
  @override
  void init() {}

  void navigateToProfile({required GlobalKey<NavigatorState> navigatorKey}) {
    navigation.navigateToPage(navigatorKey: navigatorKey, path: NavigationConstants.PROFILE);
  }
}
