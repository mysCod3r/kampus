import 'package:firebase_auth/firebase_auth.dart';
import '../../../../product/init/service/auth_service.dart';
import '../../../../product/models/firebase_models/auth_error_model.dart';
import 'i_signup_service.dart';

class SignupService extends ISignupService {
  final AuthService _authService = AuthService.instance;

  @override
  Future signinWithEmail({required String email, required String password}) async {
    final response = await _authService.signUpWithEmail(email: email, password: password);
    if (response is UserCredential) return response;
    if (response is FirebaseAuthException) return AuthErrorModel(response.code, response.message);
  }
}
