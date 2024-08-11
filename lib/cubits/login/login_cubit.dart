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
      await _authContract.login(emailController.text, passwordController.text);
      emit(LoginSuccess());
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
