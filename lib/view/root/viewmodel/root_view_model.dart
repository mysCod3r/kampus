import 'package:flutter/material.dart';
import 'package:kampus/core/constants/navigation_constants.dart';
import 'package:kampus/view/home/view/home_view.dart';
import 'package:kampus/view/messages/view/messages_view.dart';
import 'package:kampus/view/notifications/view/notifications_view.dart';
import 'package:kampus/view/search/view/search_view.dart';
import 'package:mobx/mobx.dart';
import '../../../core/base/base_view_model.dart';
import '../model/root_item_model.dart';

part 'root_view_model.g.dart';

class RootViewModel = RootViewModelBase with _$RootViewModel;

abstract class RootViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => contextt = context;

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  static final keys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];
  List tabPages = [];

  late GlobalKey<ScaffoldState> currentKey;

  @override
  void init() {
    tabPages = [
      RootItemModel(tab: const HomeView(), title: NavigationConstants.HOME, navigatorkey: keys[0]),
      RootItemModel(tab: const SearchView(), title: NavigationConstants.SEARCH, navigatorkey: keys[1]),
      RootItemModel(tab: const NotificationsView(), title: NavigationConstants.NOTIFICATIONS, navigatorkey: keys[2]),
      RootItemModel(tab: const MessagesView(), title: NavigationConstants.MESSAGES, navigatorkey: keys[3]),
    ];
  }

  Future<bool> onWillPop() async {
    final isFirstRouteInCurrentTab = !await Navigator.maybePop(contextt!);
    if (isFirstRouteInCurrentTab) {
      if (1 != 0) {
        return false;
      }
    }
    return isFirstRouteInCurrentTab;
  }

  void navigateToProfile() {
    navigation.navigateToPage(navigatorKey: keys[currentIndex], path: NavigationConstants.DENEME2);
  }

  @observable
  int currentIndex = 0;

  @action
  void setCurrentIndex(int index) {
    currentIndex = index;
  }

  GlobalKey<NavigatorState> get getCurrentKey => tabPages[currentIndex].navigatorKey;
}
