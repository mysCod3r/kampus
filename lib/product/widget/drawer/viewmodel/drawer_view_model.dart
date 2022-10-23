import 'package:flutter/material.dart';
import 'package:kampus/core/base/base_view_model.dart';
import 'package:kampus/core/constants/navigation_constants.dart';
import 'package:mobx/mobx.dart';

import '../../../models/product_models/user_model.dart';
part 'drawer_view_model.g.dart';

class DrawerViewModel = _DrawerViewModelBase with _$DrawerViewModel;

abstract class _DrawerViewModelBase with Store, BaseViewModel {
  UserModel? currentUser;

  @override
  void setContext(BuildContext context) => contextt = context;
  @override
  void init() {
    fetchCurrentUser();
  }

  Future<void> fetchCurrentUser() async {
    changeLoading();
    currentUser = await firestoreService.getCurrentUserData();
    changeLoading();
  }

  void goProfile({required GlobalKey<NavigatorState> navigatorKey}) {
    navigation.navigateToPage(navigatorKey: navigatorKey, path: NavigationConstants.PROFILE);
  }

  void goFollowers({required GlobalKey<NavigatorState> navigatorKey}) {
    navigation.navigateToPage(navigatorKey: navigatorKey, path: NavigationConstants.FOLLOWERS);
  }

  void goFollowing({required GlobalKey<NavigatorState> navigatorKey}) {
    navigation.navigateToPage(navigatorKey: navigatorKey, path: NavigationConstants.FOLLOWING);
  }

  @observable
  bool isLoading = false;
  @action
  void changeLoading() {
    isLoading = !isLoading;
  }
}
