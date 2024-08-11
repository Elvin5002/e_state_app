import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

import '../../data/contracts/auth_contract.dart';

part 'facebook_login_state.dart';

class FacebookLoginCubit extends Cubit<FacebookLoginState> {
  FacebookLoginCubit(this._authContract) : super(FacebookLoginInitial());

  final AuthContract _authContract;

  void signInWithFacebook() async{
    try{
      emit(FacebookLoginLoading());
      await _authContract.signInWithFacebook();
      emit(FacebookLoginSuccess());
    }on FirebaseAuthException catch(e){
      emit(FacebookLoginFailure('$e'));
      log('$e');
    }
    catch(e){
      emit(FacebookLoginFailure('$e'));
      log('$e');
    }
  }
}
