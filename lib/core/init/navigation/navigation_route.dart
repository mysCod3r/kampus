import 'package:flutter/material.dart';
import 'package:kampus/view/test/test_view.dart';

import '../../../view/test/second_test_view.dart';
import '../../constants/navigation_constants.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.DEFAULT:
        return normalNavigate(const TestView(), NavigationConstants.DEFAULT);
      case NavigationConstants.TEST_VIEW:
        return normalNavigate(const TestView(), NavigationConstants.TEST_VIEW);
      case NavigationConstants.SECOND_TEST_VIEW:
        return normalNavigate(
            const SecondTestView(), NavigationConstants.SECOND_TEST_VIEW);

      default:
        return MaterialPageRoute(
          builder: (context) => const TestView(),
        );
    }
  }

  MaterialPageRoute normalNavigate(Widget widget, String pageName) {
    return MaterialPageRoute(
        builder: (context) => widget, settings: RouteSettings(name: pageName));
  }
}
