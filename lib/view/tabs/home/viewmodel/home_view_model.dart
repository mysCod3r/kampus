import 'package:flutter/material.dart';
import 'package:kampus/core/base/base_view_model.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/constants/navigation_constants.dart';

part 'home_view_model.g.dart';

class HomeViewModel = HomeViewModelBase with _$HomeViewModel;

abstract class HomeViewModelBase with Store, BaseViewModel {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  void setContext(BuildContext context) => contextt = context;
  @override
  void init() {}

  void navigateToProfile({required GlobalKey<NavigatorState> navigatorKey}) {
    navigation.navigateToPage(navigatorKey: navigatorKey, path: NavigationConstants.PROFILE);
  }
}
