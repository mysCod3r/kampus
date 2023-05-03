import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'navigation_notifier.dart';

class ProductProvider {
  static ProductProvider? _instance;
  static ProductProvider get instance {
    _instance ??= ProductProvider._init();
    return _instance!;
  }

  ProductProvider._init();

  List<SingleChildWidget> authItems = [
    // Provider(
    //   create: (_) => AuthService(),
    // ),
  ];

  List<SingleChildWidget> dependItems = [
    ChangeNotifierProvider(create: (context) => NavigationNotifier()),
  ];
}
