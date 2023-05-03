import 'package:kampus/view/auth/onboard/viewmodel/onboard_view_model.dart';
import 'package:kampus/view/root/viewmodel/root_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../../view/auth/login/viewmodel/login_view_model.dart';
import '../../../view/auth/signin/viewmodel/signin_view_model.dart';
import '../../../view/auth/splash/viewmodel/splash_view_model.dart';

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
    ChangeNotifierProvider(create: (_) => SplashViewModel()),
    ChangeNotifierProvider(create: (_) => RootViewModel()),
    ChangeNotifierProvider(create: (_) => OnboardViewModel()),
    ChangeNotifierProvider(create: (_) => SigninViewModel()),
    ChangeNotifierProvider(create: (_) => LoginViewModel()),
  ];

  // List<SingleChildWidget> mobxProviders = [
  //   Provider<OnboardViewModel>(
  //     create: (_) => OnboardViewModel(),
  //   ),
  // ];
}
