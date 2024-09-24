import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthContract {
  Future<User> login(String email, String password);
  Future<void> signUp(String email, String password);
  Future<UserCredential> signInWithGoogle();
  Future<UserCredential> signInWithFacebook();
}