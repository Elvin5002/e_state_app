import 'dart:developer';
import 'package:bloc/bloc.dart';
import "../../data/contracts/property_contract.dart";
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

import '../../data/models/property_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._propertyContract) : super(HomeInitial());

  final BehaviorSubject<int> viewSubject = BehaviorSubject.seeded(0);
  final BehaviorSubject<int> selectedCategory = BehaviorSubject.seeded(0);
  final BehaviorSubject<bool> savedSubject = BehaviorSubject.seeded(false);


  final PropertyContract _propertyContract;

  void fetchProperties() async {
    try {
      emit(HomeLoading());
      final List<PropertyModel> properties;
      if (selectedCategory.value == 0) {
        properties = await _propertyContract.fetchProperties();
      } else {
        final category = _mapCategoryIndexToName(selectedCategory.value);
        properties = await _propertyContract.fetchCategory(category);
      }

      emit(HomeSuccess(properties));
    } on FirebaseAuthException catch (e) {
      emit(HomeFailure('$e'));
      log('firebase: $e');
    } catch (e) {
      emit(HomeFailure('$e'));
      log('log: $e');
      //log('$s');
    }
  }

  String _mapCategoryIndexToName(int index) {
    switch (index) {
      case 1:
        return 'Apartment';
      case 2:
        return 'Villa';
      case 3:
        return 'House';
      default:
        return 'All';
    }
  }
}
