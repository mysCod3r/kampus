import 'package:firebase_auth/firebase_auth.dart';
import 'package:kampus/product/init/service/i_auth_service.dart';

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
      return e;
    }
  }

  @override
  Future signUpWithEmail({required String email, required String password}) async {
    try {
      var authResult = await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      return authResult.user != null;
    } catch (e) {
      return e;
    }
  }
}
