import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:e_state_app/data/contracts/auth_contract.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../data/services/auth_service.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this._authContract) : super(SignupInitial());

  final AuthService _authContract;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void signUp() async {
    try {
      emit(SignupLoading());
      await _authContract.signUp(
        emailController.text,
        passwordController.text,
      );
      emit(SignupSuccess());
    } on FirebaseAuthException catch (e) {
      emit(SignupFailure('$e'));
      log('Error: $e');
    } catch (e, s) {
      emit(SignupFailure('$e'));
      log('Error: $e');
      log('Error: $s');
    }
  }

   void signInWithGoogle() async{
    try{
      emit(SignupLoading());
      await _authContract.signInWithGoogle();
      emit(SignupSuccess());
    }on FirebaseAuthException catch(e){
      log('Error: $e');
      emit(SignupFailure('$e'));
    }
    catch(e){
      emit(SignupFailure('$e'));
      log('Error: $e');
    }
  }

  void signInWithFacebook() async{
    try{
      emit(SignupLoading());
      await _authContract.signInWithFacebook();
      emit(SignupSuccess());
    }on FirebaseAuthException catch(e){
      emit(SignupFailure('$e'));
      log('$e');
    }
    catch(e){
      emit(SignupFailure('$e'));
      log('$e');
    }
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }

}
