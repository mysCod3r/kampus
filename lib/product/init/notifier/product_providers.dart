import 'package:kampus/product/init/notifier/categories_notifier.dart';
import 'package:kampus/product/init/notifier/home_notifier.dart';
import 'package:kampus/product/init/notifier/notifications_notifier.dart';
import 'package:kampus/product/init/notifier/profile_notifier.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class ProductProvider {
  static ProductProvider? _instance;
  static ProductProvider get instance {
    _instance ??= ProductProvider._init();
    return _instance!;
  }

  ProductProvider._init();

  List<SingleChildWidget> singleItems = [];
  List<SingleChildWidget> dependItems = [];
  List<SingleChildWidget> uiChangesItems = [
    ChangeNotifierProvider(
      create: (context) => HomeNotifier(),
    ),
    ChangeNotifierProvider(
      create: (context) => CategoriesNotifier(),
    ),
    ChangeNotifierProvider(
      create: (context) => NotificationsNotifier(),
    ),
    ChangeNotifierProvider(
      create: (context) => ProfileNotifier(),
    ),
  ];
}
