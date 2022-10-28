import 'package:flutter/material.dart';
import 'package:kampus/core/constants/navigation_constants.dart';
import 'package:kampus/view/tabs/home/view/home_view.dart';
import 'package:kampus/view/tabs/messages/view/messages_view.dart';
import 'package:kampus/view/tabs/notifications/view/notifications_view.dart';
import 'package:kampus/view/tabs/search/view/search_view.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import '../../../core/base/base_view_model.dart';
import '../../../product/init/notifier/navigation_notifier.dart';
import '../../../product/models/user/user_model.dart';
import '../model/root_item_model.dart';

part 'root_view_model.g.dart';

class RootViewModel = _RootViewModelBase with _$RootViewModel;

abstract class _RootViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => contextt = context;

  late List tabPages = [];

  UserModel? currentUser;
  final PageController pageController = PageController();
  final double drawerMaxWidth = 300;
  late final List keys;

  @override
  void init() {
    WidgetsFlutterBinding.ensureInitialized();

    keys = [...contextt!.read<NavigationNotifier>().navigatorKeys];

    tabPages = [
      RootItemModel(tab: const HomeView(), title: NavigationConstants.HOME, navigatorkey: keys[0]),
      RootItemModel(tab: const SearchView(), title: NavigationConstants.SEARCH, navigatorkey: keys[1]),
      RootItemModel(tab: const NotificationsView(), title: NavigationConstants.NOTIFICATIONS, navigatorkey: keys[2]),
      RootItemModel(tab: const MessagesView(), title: NavigationConstants.MESSAGES, navigatorkey: keys[3]),
    ];
    fetchCurrentUser();
  }

  Future<void> fetchCurrentUser() async {
    changeLoading();
    await authService.loginWithEmail(email: "a@a.edu.tr", password: "admin123");
    currentUser = await firestoreService.getCurrentUserData();
    changeLoading();
  }

  void navigateTo(String path) {
    navigation.navigateToPage(navigatorKey: keys[currentIndex], path: path);
    if (isOpenDrawer) xOffset = 0;
  }

  @observable
  int currentIndex = 0;

  @action
  void setCurrentIndex(int index) {
    currentIndex = index;
    pageController.jumpToPage(index);
  }

  Future<bool> onWillPop() async {
    final currentState = keys[currentIndex].currentState;
    if (currentState?.canPop() ?? false) {
      currentState!.pop();
      return false;
    } else {
      if (currentIndex != 0) {
        setCurrentIndex(0);
        return false;
      }
      return true;
    }
  }

  void signOut() {
    authService.signOut();
  }

  @observable
  double xOffset = 0;

  @observable
  bool isOpenDrawer = false;

  @observable
  bool isLoading = false;

  @action
  void onHorizontalDragUpdate(DragUpdateDetails details) {
    if (xOffset > drawerMaxWidth || xOffset < 0) return;
    if (details.delta.dx > 0.5) {
      xOffset = xOffset + 1;
      isOpenDrawer = true;
    } else if (details.delta.dx < 0.5) {
      xOffset = xOffset - 1;
      isOpenDrawer = false;
    }
  }

  @action
  void onHorizontalDragEnd(DragEndDetails details) {
    isOpenDrawer ? xOffset = drawerMaxWidth : xOffset = 0;
  }

  @action
  void onTap() {
    isOpenDrawer = false;
    xOffset = 0;
  }

  @action
  void openDrawer() {
    isOpenDrawer = true;
    xOffset = drawerMaxWidth;
  }

  @action
  void changeLoading() {
    isLoading = !isLoading;
  }
}
