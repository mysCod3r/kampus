import 'package:flutter/material.dart';
import 'package:kampus/view/auth/login/view/login_view.dart';
import 'package:kampus/view/auth/splash/viewmodel/splash_view_model.dart';
import 'package:provider/provider.dart';

import '../../../../core/init/navigation/navigation_route.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: context.read<SplashViewModel>().key,
      onGenerateRoute: NavigationRoute.instance.generateRoute,

      //initialRoute: NavigationConstants.ROOT,

      onGenerateInitialRoutes: (navigator, initialRoute) {
        return [MaterialPageRoute(builder: (context) => const LoginView())];
      },
    );
  }
}
