import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kampus/view/auth/splash/viewmodel/splash_view_model.dart';
import 'package:provider/provider.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SplashViewModel>(
      builder: (context, value, child) {
        value.isFirst
            ? value.goOnboard()
            : value.isLogin
                ? value.goRoot()
                : value.goLogin();
        return Container(color: Colors.white, child: SvgPicture.asset("assets/svg/splash.svg"));
      },
    );
  }
}
