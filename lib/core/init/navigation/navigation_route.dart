import 'package:flutter/material.dart';
import 'package:kampus/view/deneme/view/deneme_view.dart';
import 'package:kampus/view/deneme2/view/deneme2_view.dart';

import '../../../view/root/view/root_view.dart';

import '../../constants/navigation_constants.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.DEFAULT:
        return normalNavigate(const RootView(), NavigationConstants.DEFAULT);
      case NavigationConstants.DENEME:
        return normalNavigate(const DenemeView(), NavigationConstants.DENEME);
      case NavigationConstants.DENEME2:
        return normalNavigate(const Deneme2View(), NavigationConstants.DENEME2);

      default:
        return normalNavigate(const RootView(), NavigationConstants.DEFAULT);
    }
  }

  MaterialPageRoute normalNavigate(Widget widget, String pageName) {
    return MaterialPageRoute(builder: (context) => widget, settings: RouteSettings(name: pageName));
  }
}

class SlideLeftRoute<T> extends MaterialPageRoute<T> {
  SlideLeftRoute({required WidgetBuilder builder, RouteSettings? settings}) : super(builder: builder, settings: settings);
  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    if (settings.name == "SplashPage") {
      return child;
    }
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(1.0, 0.0),
        end: Offset.zero,
      ).animate(CurvedAnimation(parent: animation, curve: Curves.fastOutSlowIn)),
      child: child,
    );
  }
}
