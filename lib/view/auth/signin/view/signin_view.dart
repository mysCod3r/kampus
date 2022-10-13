import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kampus/core/constants/color_constant.dart';
import 'package:kampus/core/extension/context_extension.dart';
import 'package:kampus/core/init/lang/locale_keys.g.dart';
import 'package:kampus/view/_product/_constants/image_path_svg.dart';
import 'package:provider/provider.dart';

import '../viewmodel/signin_view_model.dart';

class SigninView extends StatelessWidget {
  const SigninView({super.key});

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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(height: 10),
              _emailTextField(context),
              _passwordTextField(context),
              _signupButton(context),
              _loginButton(context),
            ],
          ),
        ),
      ),
    );
  }

  TextField _emailTextField(BuildContext context) {
    return TextField(
      decoration: InputDecoration(labelText: LocaleKeys.signin_email.tr()),
      onChanged: (value) {
        context.read<SigninViewModel>().emailController.text = value;
      },
    );
  }

  TextField _passwordTextField(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: LocaleKeys.signin_password.tr(),
        suffixIcon: const Icon(Icons.remove_red_eye_outlined),
      ),
      onChanged: (value) {
        context.read<SigninViewModel>().passwordController.text = value;
      },
    );
  }

  ElevatedButton _signupButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        String password = context.read<SigninViewModel>().passwordController.text;
        String email = context.read<SigninViewModel>().emailController.text;

        var response = context.read<SigninViewModel>().signUp(email: email, password: password);

        print("email = $email");
        print("password = $password");
        print(response);
      },
      child: Center(child: Text(LocaleKeys.signin_signin.tr())),
    );
  }

  TextButton _loginButton(BuildContext context) {
    return TextButton(
      onPressed: () {
        context.read<SigninViewModel>().navigateToLogin();
      },
      child: Text(LocaleKeys.signin_login.tr()),
    );
  }
}
