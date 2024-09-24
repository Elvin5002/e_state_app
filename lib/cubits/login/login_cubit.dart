import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import '../../data/contracts/auth_contract.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._authContract) : super(LoginInitial());

  final AuthContract _authContract;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void login() async{
    try{
      emit(LoginLoading());
      final user = await _authContract.login(emailController.text, passwordController.text);

      if (user.emailVerified) {
        emit(LoginSuccess());
        log("Email is verified. You can proceed.");
      } else {
        await user.sendEmailVerification();
        emit(LoginFailure("Email is not verified. Please verify your email."));
      }
    }on FirebaseAuthException catch(e){
      emit(LoginFailure('$e'));
    }
    catch(e){
      emit(LoginFailure('$e'));
    }
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }

  
}
