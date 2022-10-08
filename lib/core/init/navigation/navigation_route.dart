import 'package:flutter/material.dart';
import 'package:kampus/view/tab/home/view/home_view.dart';
import 'package:kampus/view/tab/notifications/view/notifications_view.dart';
import 'package:kampus/view/tab/profile/view/profile_view.dart';

import '../../../view/tab/categories/view/categories_view.dart';
import '../../../view/test/second_test_view.dart';
import '../../../view/test/test_view.dart';
import '../../constants/navigation_constants.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.DEFAULT:
        return normalNavigate(const HomeView(), NavigationConstants.DEFAULT);
      case NavigationConstants.TEST_VIEW:
        return normalNavigate(const TestView(), NavigationConstants.TEST_VIEW);
      case NavigationConstants.SECOND_TEST_VIEW:
        return normalNavigate(
            const SecondTestView(), NavigationConstants.SECOND_TEST_VIEW);
      case NavigationConstants.HOME:
        return normalNavigate(const HomeView(), NavigationConstants.HOME);
      case NavigationConstants.CATEGORIES:
        return normalNavigate(
            const CategoriesView(), NavigationConstants.CATEGORIES);
      case NavigationConstants.NOTIFICATIONS:
        return normalNavigate(
            const NotificationsView(), NavigationConstants.NOTIFICATIONS);
      case NavigationConstants.PROFILE:
        return normalNavigate(const ProfileView(), NavigationConstants.PROFILE);

      default:
        return normalNavigate(const ProfileView(), NavigationConstants.PROFILE);
    }
  }

  MaterialPageRoute normalNavigate(Widget widget, String pageName) {
    return MaterialPageRoute(
        builder: (context) => widget, settings: RouteSettings(name: pageName));
  }
}
