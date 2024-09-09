
import 'package:e_state_app/data/contracts/auth_contract.dart';
import 'package:e_state_app/data/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository extends AuthContract{
  AuthRepository(this._authService);

  final AuthService _authService;
  @override
  Future<User> login(String email, String password) => _authService.login(email, password);

  @override
  Future<UserCredential> signInWithFacebook() => _authService.signInWithFacebook();
 
  @override
  Future<UserCredential> signInWithGoogle() => _authService.signInWithGoogle();

  @override
  Future<void> signUp(String email, String password) => _authService.signUp(email, password);
  
}