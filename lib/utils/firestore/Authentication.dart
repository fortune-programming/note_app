import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_fortune/model/account.dart';

class Authentication {
  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  static User? currentFirebaseUser;
  static Account? myAccount;
  static Account? foundAccount;

  static Future<dynamic> signUp(
      {required String email, required String pass}) async {
    try {
      UserCredential newAccount = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: pass);
      print('Auth登録完了');
      return newAccount;
    } on FirebaseAuthException catch (e) {
      print('Auth 登録エラー$e');
      return false;
    }
  }

  static Future<dynamic> emailSignIn(
      {required String email, required String pass}) async {
    try {
      UserCredential _result = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: pass);
      currentFirebaseUser = _result.user;
      print('サインイン完了');
      return _result;
    } on FirebaseAuthException catch (e) {
      print('authサインインエラー$e');
      return false;
    }
  }
}
