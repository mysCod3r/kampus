import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kampus/core/extension/context_extension.dart';
import 'package:kampus/product/models/user/user_model.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/base/base_view_model.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
import '../../../../core/init/notifier/scaffold_messenger_key.dart';
import '../../../../product/constants/firebase_constants.dart';
import '../../../../core/models/firebase_models/auth_error_model.dart';

part 'login_view_model.g.dart';

class LoginViewModel = LoginViewModelBase with _$LoginViewModel;

abstract class LoginViewModelBase with Store, BaseViewModel {
  // late final FirestoreService _firestoreServis;
  late final GlobalKey<FormState> formState;
  late final ScaffoldMessengerKey? scaffoldState;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  @override
  void setContext(BuildContext context) => contextt = context;

  @override
  void init() {
    // _firestoreServis = FirestoreService.instance;
    formState = GlobalKey();
    scaffoldState = ScaffoldMessengerKey.instance;
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @action
  Future<void> login() async {
    isLoadingChange();
    if (formState.currentState!.validate()) {
      var response = await authService.loginWithEmail(email: emailController.text, password: passwordController.text);
      if (response is UserCredential) {
        UserModel? currentUser = await firestoreService.getCurrentUserData();
        if (currentUser != null) {
          print("*" * 20);
          print(currentUser.name);
          print(currentUser.profilePicUrl);
          print(currentUser.email);
          print("*" * 20);
        } else {
          print("hata");
        }

        // print(firestoreService.currentUser.withConverter<UserModel>(fromFirestore: (snapshot, options) => UserModel.fromFirestore(snapshot,_), toFirestore:(user, _) => user.toFirestore() );
      }

      if (response is AuthErrorModel) {
        switch (response.code) {
          case FirebaseAuthExceptions.userNotFound:
            scaffoldState!.showSnackBar(text: LocaleKeys.errorMessages_userNotfound.tr());
            break;
          case FirebaseAuthExceptions.wrongPassword:
            scaffoldState!.showSnackBar(text: LocaleKeys.errorMessages_wrongPassword.tr(), keyboardPositon: contextt!.mediaQuery.viewInsets.bottom);
            break;
          case FirebaseAuthExceptions.tooManyRequest:
            scaffoldState!.showSnackBar(text: LocaleKeys.errorMessages_tooManyRequest.tr(), keyboardPositon: contextt!.mediaQuery.viewInsets.bottom);
            break;
          default:
            // TODO BİR HATA OLUŞTU LÜTFEN DAHA SONRA TEKRAR DENEYİN (LOADİNG SAYFASI)
            break;
        }
      }
    }
    isLoadingChange();
  }

  // TODO REMEMBER ME BUTONU YAPILACAK

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
