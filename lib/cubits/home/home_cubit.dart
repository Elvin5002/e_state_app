import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:e_state_app/data/contracts/property_contract.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

import '../../data/models/property_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._propertyContract) : super(HomeInitial());

  final BehaviorSubject<int> viewSubject = BehaviorSubject.seeded(0);
  final BehaviorSubject<int> selectedCategory = BehaviorSubject.seeded(0);

  final PropertyContract _propertyContract;

  void fetchProperties() async{
    try{
      emit(HomeLoading());
      final properties = await _propertyContract.fetchProperties();
      emit(HomeSuccess(properties));
    }on FirebaseAuthException catch(e){
      emit(HomeFailure('$e'));
      log('firebase: $e');
    }
    catch(e){
      emit(HomeFailure('$e'));
      log('log: $e');
      //log('$s');
    }
  }

}
