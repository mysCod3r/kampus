import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kampus/core/extension/context_extension.dart';
import 'package:kampus/core/init/lang/locale_keys.g.dart';
import 'package:kampus/view/auth/login/viewmodel/login_view_model.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/color_constant.dart';
import '../../../../core/constants/navigation_constants.dart';
import '../../../../core/init/navigation/navigation_service.dart';
import '../../../_product/_constants/image_path_svg.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorConstants.PURPLE,
      body: SafeArea(
        child: Column(
          children: [
            _imageArea(),
            _formArea(context),
          ],
        ),
      ),
    );
  }

  Expanded _imageArea() {
    return Expanded(
      flex: 3,
      child: SvgPicture.asset(SVGImagePaths.instance!.party),
    );
  }

  Expanded _formArea(BuildContext context) {
    return Expanded(
      flex: 7,
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
          color: ColorConstants.WHITE,
        ),
        child: Padding(
          padding: context.paddingMediumHorizontal,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(height: 10),
              _emailTextField(context),
              _passwordTextField(context),
              _forgotPasswordButton(),
              _loginButton(context),
              _signupButton(context),
            ],
          ),
        ),
      ),
    );
  }

  TextField _emailTextField(BuildContext context) {
    return TextField(
      decoration: InputDecoration(labelText: LocaleKeys.login_email.tr()),
      onChanged: (value) {
        context.read<LoginViewModel>().emailController.text = value;
      },
    );
  }

  TextField _passwordTextField(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: LocaleKeys.login_password.tr(),
        suffixIcon: const Icon(Icons.remove_red_eye_outlined),
      ),
      onChanged: (value) {
        context.read<LoginViewModel>().passwordController.text = value;
      },
    );
  }

  TextButton _forgotPasswordButton() {
    return TextButton(
      onPressed: () {},
      child: Text(LocaleKeys.login_forgot.tr()),
    );
  }

  ElevatedButton _loginButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        String password = context.read<LoginViewModel>().passwordController.text;
        String email = context.read<LoginViewModel>().emailController.text;

        //NavigationService.instance.navigateToPageFromAuth(path: NavigationConstants.ROOT);
        context.read<LoginViewModel>().login(email: email, password: password);
        Future.delayed(Duration.zero, () async {
          await NavigationService.instance.navigateToPage(path: NavigationConstants.ROOT, navigatorKey: context.read<LoginViewModel>().authKey);
        });

        print("email = $email");
        print("password = $password");
      },
      child: Center(child: Text(LocaleKeys.login_login.tr())),
    );
  }

  TextButton _signupButton(BuildContext context) {
    return TextButton(
      onPressed: () {
        context.read<LoginViewModel>().navigateToRegister();
      },
      child: Text(LocaleKeys.login_signup.tr()),
    );
  }
}
