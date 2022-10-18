import 'package:firebase_auth/firebase_auth.dart';
import '../../../../product/init/service/auth_service.dart';
import '../../../../product/models/firebase_models/auth_error_model.dart';
import 'i_login_service.dart';

class LoginService extends ILoginService {
  final AuthService _authService = AuthService.instance;

  @override
  Future loginWithEmail({required String email, required String password}) async {
    var response = await _authService.loginWithEmail(email: email, password: password);
    if (response is UserCredential) return response;
    if (response is FirebaseAuthException) return AuthErrorModel(response.code, response.message);
  }
}
