import 'package:firebase_auth/firebase_auth.dart';
import 'package:kampus/product/init/service/auth_service.dart';
import 'package:kampus/view/auth/login/model/login_error_model.dart';
import 'package:kampus/view/auth/login/service/i_login_service.dart';

class LoginService extends ILoginService {
  final AuthService _authService = AuthService.instance;

  @override
  Future loginWithEmail({required String email, required String password}) async {
    final response = await _authService.loginWithEmail(email: email, password: password);
    if (response is UserCredential) return response;
    if (response is FirebaseAuthException) return LoginErrorModel(response.code, response.message);
  }
}
