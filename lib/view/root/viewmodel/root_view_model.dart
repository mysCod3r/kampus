import 'package:flutter/material.dart';
import 'package:kampus/core/constants/navigation_constants.dart';
import 'package:kampus/product/init/notifier/navigation_notifier.dart';
import 'package:kampus/view/tabs/home/view/home_view.dart';
import 'package:kampus/view/tabs/messages/view/messages_view.dart';
import 'package:kampus/view/tabs/notifications/view/notifications_view.dart';
import 'package:kampus/view/tabs/search/view/search_view.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import '../../../core/base/base_view_model.dart';
import '../model/root_item_model.dart';

part 'root_view_model.g.dart';

class RootViewModel = RootViewModelBase with _$RootViewModel;

abstract class RootViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => contextt = context;

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  List<GlobalKey<NavigatorState>> keys = [];
  List tabPages = [];

  @override
  void init() {
    keys = [...contextt!.read<NavigationNotifier>().navigatorKeys];

    tabPages = [
      RootItemModel(tab: const HomeView(), title: NavigationConstants.HOME, navigatorkey: keys[0]),
      RootItemModel(tab: const SearchView(), title: NavigationConstants.SEARCH, navigatorkey: keys[1]),
      RootItemModel(tab: const NotificationsView(), title: NavigationConstants.NOTIFICATIONS, navigatorkey: keys[2]),
      RootItemModel(tab: const MessagesView(), title: NavigationConstants.MESSAGES, navigatorkey: keys[3]),
    ];
  }

  @observable
  int currentIndex = 0;

  @action
  void setCurrentIndex(int index) {
    currentIndex = index;
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
    navigation.navigateToPage(navigatorKey: keys[currentIndex], path: NavigationConstants.PROFILE);
  }
}
