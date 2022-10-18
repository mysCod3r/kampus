import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kampus/view/auth/login/service/login_service.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/base/base_view_model.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
import '../../../../core/init/notifier/scaffold_messenger_key.dart';
import '../../../../product/constants/firebase_constants.dart';
import '../model/login_error_model.dart';

part 'login_view_model.g.dart';

class LoginViewModel = LoginViewModelBase with _$LoginViewModel;

abstract class LoginViewModelBase with Store, BaseViewModel {
  late final LoginService loginService;
  late final GlobalKey<FormState> formState;
  late final ScaffoldMessengerKey? scaffoldState;

  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  @override
  void setContext(BuildContext context) => contextt = context;

  @override
  void init() {
    loginService = LoginService();
    formState = GlobalKey();
    scaffoldState = ScaffoldMessengerKey.instance;
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @action
  Future<void> login() async {
    isLoadingChange();
    if (formState.currentState!.validate()) {
      var response = await loginService.loginWithEmail(email: emailController.text, password: passwordController.text);
      if (response is UserCredential) print("ana sayfaya git");
      if (response is LoginErrorModel) {
        switch (response.code) {
          case FirebaseAuthExceptions.userNotFound:
            scaffoldState!.showSnackBar(text: LocaleKeys.errorMessages_userNotfound.tr());
            break;
          case FirebaseAuthExceptions.wrongPassword:
            scaffoldState!.showSnackBar(text: LocaleKeys.errorMessages_wrongPassword.tr());
            break;
          case FirebaseAuthExceptions.tooManyRequest:
            scaffoldState!.showSnackBar(text: LocaleKeys.errorMessages_tooManyRequest.tr());
            break;
          default:
            // TODO BİR HATA OLUŞTU LÜTFEN DAHA SONRA TEKRAR DENEYİN (LOADİNG SAYFASI)
            break;
        }
      }
    }
    isLoadingChange();
  }

  @observable
  bool isLoading = false;
  @observable
  bool isLock = true;

  @action
  void isLockChange() {
    isLock = !isLock;
  }

  @action
  void isLoadingChange() {
    isLoading = !isLoading;
  }
}
