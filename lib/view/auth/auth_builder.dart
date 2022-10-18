import 'package:flutter/material.dart';
import 'package:kampus/core/constants/color_constant.dart';
import 'package:kampus/product/constants/icon_path_ic.dart';
import 'package:kampus/view/auth/login/view/login_view.dart';
import 'package:kampus/view/auth/signup/view/signup_view.dart';

class AuthBuilder extends StatefulWidget {
  const AuthBuilder({super.key});

  @override
  State<AuthBuilder> createState() => _AuthBuilderState();
}

class _AuthBuilderState extends State<AuthBuilder> {
  final PageController _controller = PageController();

  final int loginPageIndex = 0;
  final int signupPageIndex = 2;

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _controller,
      scrollDirection: Axis.vertical,
      children: [
        LoginView(controller: _controller, goSignup: signupPageIndex),
        const Logo(),
        SignupView(controller: _controller, goLoginPage: loginPageIndex),
      ],
    );
  }
}

class Logo extends StatelessWidget {
  const Logo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorConstants.PURPLE_SH,
      child: Center(child: Image.asset(IconPath.instance!.twitter, fit: BoxFit.fill)),
    );
  }
}
