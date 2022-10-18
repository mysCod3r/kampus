import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kampus/core/extension/context_extension.dart';

import '../../../../core/base/base_view.dart';
import '../../../../core/constants/color_constant.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
import '../../../../product/constants/icon_path_ic.dart';
import '../../../../product/constants/image_path_svg.dart';
import '../../../../product/constants/regex_validate.dart';
import '../viewmodel/signup_view_model.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key, required this.controller, required this.goLoginPage});
  final PageController controller;
  final int goLoginPage;
  @override
  Widget build(BuildContext context) {
    return BaseView<SignupViewModel>(
      viewModel: SignupViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (context, viewModel) => Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: ColorConstants.PURPLE_SH,
          body: SafeArea(
            child: Column(
              children: [
                _buildForm(context, viewModel),
                _buildImage(context),
              ],
            ),
          )),
    );
  }

  Widget _buildImage(BuildContext context) {
    return AnimatedContainer(
      duration: context.lowDuration,
      height: context.mediaQuery.viewInsets.bottom > 0 ? 0 : context.height * 0.4,
      child: SvgPicture.asset(SVGImagePaths.instance!.party),
    );
  }

  Expanded _buildForm(BuildContext context, SignupViewModel viewModel) {
    return Expanded(
      child: AnimatedContainer(
        duration: context.lowDuration,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(bottom: context.mediaQuery.viewInsets.bottom > 0 ? Radius.zero : Radius.circular(context.highValueX)),
          color: ColorConstants.WHITE,
        ),
        child: Padding(
            padding: context.paddingNormal,
            child: Form(
              key: viewModel.formState,
              child: Column(
                children: [
                  Image.asset(IconPath.instance!.twitter, height: context.highValue),
                  Wrap(
                    runSpacing: (context.lowValue),
                    alignment: WrapAlignment.center,
                    children: [
                      _emailFormField(viewModel),
                      _passwordFormField(viewModel),
                      _signupButton(viewModel),
                    ],
                  ),
                  _loginButton(viewModel),
                ],
              ),
            )),
      ),
    );
  }

  TextFormField _emailFormField(SignupViewModel viewModel) {
    return TextFormField(
      validator: (value) => RegexValidate.instance!.uniMail.hasMatch(value!) ? null : LocaleKeys.errorMessages_invalidEmail.tr(),
      controller: viewModel.emailController,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(labelText: LocaleKeys.login_email.tr()),
    );
  }

  Widget _passwordFormField(SignupViewModel viewModel) {
    return Observer(builder: (_) {
      return TextFormField(
        validator: (value) => value!.isNotEmpty ? null : LocaleKeys.errorMessages_weakPassword.tr(),
        obscureText: viewModel.isLock,
        controller: viewModel.passwordController,
        keyboardType: TextInputType.visiblePassword,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          labelText: LocaleKeys.login_password.tr(),
          suffixIcon: IconButton(onPressed: () => viewModel.isLockChange(), icon: viewModel.isLock ? const Icon(Icons.lock) : const Icon(Icons.lock_open_outlined)),
        ),
      );
    });
  }

  Widget _signupButton(SignupViewModel viewModel) {
    return Observer(builder: (_) {
      return ElevatedButton(
        onPressed: () => viewModel.isLoading ? null : viewModel.signup(),
        child: viewModel.isLoading ? const Center(child: CircularProgressIndicator()) : Center(child: Text(LocaleKeys.signin_signin.tr())),
      );
    });
  }

  TextButton _loginButton(SignupViewModel viewModel) {
    return TextButton(
      onPressed: () => controller..animateToPage(goLoginPage, duration: const Duration(seconds: 1), curve: Curves.easeInToLinear),
      child: Text(LocaleKeys.signin_login.tr()),
    );
  }
}
