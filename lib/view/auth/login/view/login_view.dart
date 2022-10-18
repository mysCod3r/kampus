import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kampus/core/constants/color_constant.dart';
import 'package:kampus/core/extension/context_extension.dart';
import 'package:kampus/view/_product/_constants/icon_path_ic.dart';
import 'package:kampus/view/_product/_constants/image_path_svg.dart';

import '../../../../core/base/base_view.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
import '../../../_product/_constants/regex_validate.dart';
import '../viewmodel/login_view_model.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
      viewModel: LoginViewModel(),
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
                _buildImage(context),
                _buildForm(context, viewModel),
              ],
            ),
          )),
    );
  }

  Widget _buildImage(BuildContext context) {
    return AnimatedContainer(
      duration: context.lowDuration,
      height: context.mediaQuery.viewInsets.bottom > 0 ? 0 : context.height * 0.3,
      child: SvgPicture.asset(SVGImagePaths.instance!.party),
    );
  }

  Expanded _buildForm(BuildContext context, LoginViewModel viewModel) {
    return Expanded(
      child: AnimatedContainer(
        duration: context.lowDuration,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: context.mediaQuery.viewInsets.bottom > 0 ? Radius.zero : Radius.circular(context.highValueX)),
          color: ColorConstants.WHITE,
        ),
        child: Padding(
            padding: context.paddingNormal,
            child: Form(
              key: viewModel.formState,
              child: Column(
                children: [
                  Wrap(
                    runSpacing: (context.lowValue),
                    alignment: WrapAlignment.center,
                    children: [
                      Image.asset(IconPath.instance!.twitter, height: context.highValue),
                      _emailFormField(viewModel),
                      _passwordFormField(viewModel),
                      _forgetPassword(viewModel),
                    ],
                  ),
                  Wrap(
                    alignment: WrapAlignment.center,
                    runSpacing: (context.lowValue) * 3,
                    children: [
                      _loginButton(viewModel),
                      _signupButton(viewModel),
                    ],
                  ),
                ],
              ),
            )),
      ),
    );
  }

  TextFormField _emailFormField(LoginViewModel viewModel) {
    return TextFormField(
      validator: (value) => RegexValidate.instance!.uniMail.hasMatch(value!) ? null : LocaleKeys.errorMessages_invalidEmail.tr(),
      controller: viewModel.emailController,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(labelText: LocaleKeys.login_email.tr()),
    );
  }

  Widget _passwordFormField(LoginViewModel viewModel) {
    return Observer(builder: (_) {
      return TextFormField(
        validator: (value) => value!.isNotEmpty ? null : LocaleKeys.errorMessages_wrongPassword.tr(),
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

  Widget _forgetPassword(LoginViewModel viewModel) {
    return TextButton(
      onPressed: () {},
      child: Text(LocaleKeys.login_forgot.tr()),
    );
  }

  Widget _loginButton(LoginViewModel viewModel) {
    return Observer(builder: (_) {
      return ElevatedButton(
        onPressed: () => viewModel.isLoading ? null : viewModel.login(),
        child: viewModel.isLoading ? const Center(child: CircularProgressIndicator()) : Center(child: Text(LocaleKeys.login_login.tr())),
      );
    });
  }

  TextButton _signupButton(LoginViewModel viewModel) {
    return TextButton(
      // onPressed: ()=> viewModel.navigation,
      onPressed: () {},
      child: Text(LocaleKeys.login_signup.tr()),
    );
  }
}
