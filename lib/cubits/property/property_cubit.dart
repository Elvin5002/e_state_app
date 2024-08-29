import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

import '../../data/contracts/property_contract.dart';
import '../../data/models/property_model.dart';

part 'property_state.dart';

class PropertyCubit extends Cubit<PropertyState> {
  PropertyCubit(this._propertyContract) : super(PropertyInitial());

  final PropertyContract _propertyContract;

  void fetchProperties() async{
    try{
      emit(PropertyLoading());
      final properties = await _propertyContract.fetchProperties();
      emit(PropertySuccess(properties));
    }on FirebaseAuthException catch(e){
      emit(PropertyFailure('$e'));
      log('firebase: $e');
    }
    catch(e){
      emit(PropertyFailure('$e'));
      log('log: $e');
      //log('$s');
    }
  }
}
