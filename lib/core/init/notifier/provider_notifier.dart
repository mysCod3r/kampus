import 'package:kampus/core/init/navigation/services/categories_navigation_service.dart';
import 'package:kampus/core/init/navigation/services/notifications_navigation_service.dart';
import 'package:kampus/core/init/navigation/services/profile_navigation_service.dart';
import 'package:kampus/product/init/notifier/navigation_notifier.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../navigation/services/home_navigation_service.dart';
import 'theme_notifier.dart';

class ApplicationProvider {
  static ApplicationProvider? _instance;
  static ApplicationProvider get instance {
    _instance ??= ApplicationProvider._init();
    return _instance!;
  }

  ApplicationProvider._init();

  List<SingleChildWidget> keys = [
    //Provider.value(value: NavigationService.instance),
    Provider.value(value: HomeNavigationService.instance),
    Provider.value(value: NotificationsNavigationService.instance),
    Provider.value(value: CategoriesNavigationService.instance),
    Provider.value(value: ProfileNavigationService.instance),
  ];
  List<SingleChildWidget> dependItems = [
    ChangeNotifierProvider(
      create: (context) => ThemeNotifier(),
    ),
    ChangeNotifierProvider(
      create: (context) => NavigationNotifier(),
    )
  ];
  List<SingleChildWidget> uiChangesItems = [];
}
