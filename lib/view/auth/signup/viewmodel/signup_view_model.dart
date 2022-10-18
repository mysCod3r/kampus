import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kampus/core/base/base_view_model.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/init/lang/locale_keys.g.dart';
import '../../../../core/init/notifier/scaffold_messenger_key.dart';
import '../../../../product/constants/firebase_constants.dart';
import '../../../../product/models/firebase_models/auth_error_model.dart';
import '../service/signup_service.dart';
part 'signup_view_model.g.dart';

class SignupViewModel = SignupViewModelBase with _$SignupViewModel;

abstract class SignupViewModelBase with Store, BaseViewModel {
  late final SignupService signupService;
  late final GlobalKey<FormState> formState;
  late final ScaffoldMessengerKey? scaffoldState;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  @override
  void setContext(BuildContext context) => contextt = context;

  @override
  void init() {
    signupService = SignupService();
    formState = GlobalKey();
    scaffoldState = ScaffoldMessengerKey.instance;
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @action
  Future<void> signup() async {
    isLoadingChange();
    if (formState.currentState!.validate()) {
      var response = await signupService.signinWithEmail(email: emailController.text, password: passwordController.text);
      if (response is UserCredential) print("KAYIT OLUŞTU"); // TODO KAYIT SAYFASINA GİT
      if (response is AuthErrorModel) {
        switch (response.code) {
          case FirebaseAuthExceptions.emailAlreadyInUse:
            scaffoldState!.showSnackBar(text: LocaleKeys.errorMessages_emailAlreadyInUse.tr());
            break;
          case FirebaseAuthExceptions.invalidEmail:
            scaffoldState!.showSnackBar(text: LocaleKeys.errorMessages_invalidEmail.tr());
            break;
          case FirebaseAuthExceptions.weakPassword:
            scaffoldState!.showSnackBar(text: LocaleKeys.errorMessages_weakPassword.tr());
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
