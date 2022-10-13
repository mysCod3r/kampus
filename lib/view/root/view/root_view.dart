import 'package:flutter/material.dart';
import 'package:kampus/core/init/navigation/navigation_service.dart';
import 'package:kampus/product/init/notifier/bottom_navigation_bar_notifier.dart';
import 'package:kampus/product/widget/bottom_navigation/bottom_navigation_widget.dart';
import 'package:kampus/view/root/model/root_model.dart';
import 'package:kampus/view/tab/categories/view/categories_view.dart';
import 'package:kampus/view/tab/notifications/view/notifications_view.dart';
import 'package:kampus/view/tab/profile/view/profile_view.dart';

import '../../../core/init/navigation/navigation_route.dart';
import '../../tab/home/view/home_view.dart';
import 'package:provider/provider.dart';

class RootView extends StatefulWidget {
  const RootView({super.key});

  @override
  State<RootView> createState() => _RootViewState();
}

final GlobalKey<NavigatorState> _tab1navigatorKey = NavigationService.navigatorKeys[0];
final GlobalKey<NavigatorState> _tab2navigatorKey = NavigationService.navigatorKeys[1];
final GlobalKey<NavigatorState> _tab3navigatorKey = NavigationService.navigatorKeys[2];
final GlobalKey<NavigatorState> _tab4navigatorKey = NavigationService.navigatorKeys[3];

final List _pages = [
  RootModel(tab: const HomeView(), title: "Home", icon: Icons.home_filled, navigatorkey: _tab1navigatorKey),
  RootModel(tab: const NotificationsView(), title: "not", icon: Icons.abc, navigatorkey: _tab2navigatorKey),
  RootModel(tab: const CategoriesView(), title: "category", icon: Icons.abc, navigatorkey: _tab3navigatorKey),
  RootModel(tab: const ProfileView(), title: "profile", icon: Icons.abc, navigatorkey: _tab4navigatorKey),
];

class _RootViewState extends State<RootView> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => NavigationService.instance.onWillPop(
        tabIndex: context.read<BottomNavigationBarNotifier>().currentIndex,
      ),
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              const Text("data"),
              Expanded(
                child: IndexedStack(
                  index: context.watch<BottomNavigationBarNotifier>().currentIndex,
                  children: _pages
                      .map((page) => Navigator(
                            key: page.navigatorkey,
                            onGenerateRoute: NavigationRoute.instance.generateRoute,
                            onGenerateInitialRoutes: (navigator, initialRoute) {
                              return [MaterialPageRoute(builder: (context) => page.tab)];
                            },
                          ))
                      .toList(),
                ),
              ),
            ],
          ),
          bottomNavigationBar: const CustomBottomNavigation(),
        ),
      ),
    );
  }
}
