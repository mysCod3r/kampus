import 'package:firebase_auth/firebase_auth.dart';
import 'package:kampus/core/service/auth/i_auth_service.dart';

import '../../models/firebase_models/auth_error_model.dart';

class AuthService extends IAuthService {
  static final AuthService _instace = AuthService._init();
  static AuthService get instance => _instace;
  AuthService._init();

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  Future loginWithEmail({required String email, required String password}) async {
    try {
      UserCredential user = await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      return user;
    } on FirebaseAuthException catch (e) {
      print("auth_service.dart ************ \n   $e");
      return AuthErrorModel(code: e.code, message: e.message);
    }
  }

  @override
  Future signUpWithEmail({required String email, required String password}) async {
    try {
      var authResult = await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      return authResult.user != null;
    } on FirebaseAuthException catch (e) {
      print("auth_service.dart ************ \n   $e");
      return AuthErrorModel(code: e.code, message: e.message);
    }
  }

  @override
  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }
}
