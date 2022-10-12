import 'package:kampus/view/auth/onboard/viewmodel/onboard_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

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
    ChangeNotifierProvider(create: (_) => OnboardViewModel()),
  ];

  // List<SingleChildWidget> mobxProviders = [
  //   Provider<OnboardViewModel>(
  //     create: (_) => OnboardViewModel(),
  //   ),
  // ];
}
