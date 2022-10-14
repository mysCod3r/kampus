import 'package:flutter/material.dart';

import '../../../core/constants/navigation_constants.dart';
import '../../../core/init/navigation/services/home_navigation_service.dart';
import '../../../core/init/navigation/services/notifications_navigation_service.dart';
import '../../../core/init/navigation/services/categories_navigation_service.dart';
import '../../../core/init/navigation/services/profile_navigation_service.dart';
import '../../tab/categories/view/categories_view.dart';
import '../../tab/home/view/home_view.dart';
import '../../tab/notifications/view/notifications_view.dart';
import '../../tab/profile/view/profile_view.dart';
import '../model/root_model.dart';

class RootViewModel extends ChangeNotifier {
  final HomeNavigationService _homeNavigationInstance = HomeNavigationService.instance;
  final NotificationsNavigationService _notificationsNavigationInstance = NotificationsNavigationService.instance;
  final CategoriesNavigationService _categoriesNavigationInstance = CategoriesNavigationService.instance;
  final ProfileNavigationService _profileNavigationInstance = ProfileNavigationService.instance;

  List get pages => [
        RootModel(tab: const HomeView(), title: NavigationConstants.HOME, icon: Icons.home_filled, navigatorkey: _homeNavigationInstance.navigatorKey),
        RootModel(tab: const NotificationsView(), title: NavigationConstants.NOTIFICATIONS, icon: Icons.abc, navigatorkey: _notificationsNavigationInstance.navigatorKey),
        RootModel(tab: const CategoriesView(), title: NavigationConstants.CATEGORIES, icon: Icons.abc, navigatorkey: _categoriesNavigationInstance.navigatorKey),
        RootModel(tab: const ProfileView(), title: NavigationConstants.PROFILE, icon: Icons.abc, navigatorkey: _profileNavigationInstance.navigatorKey),
      ];
}
