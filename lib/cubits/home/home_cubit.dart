import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
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
  final BehaviorSubject<List<PropertyModel>> propertySubject = BehaviorSubject.seeded([]);

  //final List<PropertyModel> propertiesList = [];
  final searchController = TextEditingController();

  final PropertyContract _propertyContract;

  void fetchProperties() async {
    try {
      emit(HomeLoading());
      final List<PropertyModel> properties;

      final searchText = searchController.text.trim().toLowerCase();

      if (selectedCategory.value == 0) {
        properties = await _propertyContract.fetchProperties();
        //propertiesList.addAll(properties);
      } else {
        final category = _mapCategoryIndexToName(selectedCategory.value);
        properties = await _propertyContract.fetchCategory(category);
        //propertiesList.addAll(properties);
      }

      final filteredProperties = searchText.isNotEmpty
          ? properties.where((property) {
              return property.title.startsWith(property.title.toLowerCase()) ||
                  property.title.toLowerCase().contains(searchText) ||
                  property.price.toLowerCase().contains(searchText);
            }).toList()
          : properties;

      emit(HomeSuccess(filteredProperties));
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
/*
  List<PropertyModel> properties = [];
  List<PropertyModel> filteredPropertyList = [];

  void fetch() async {
    try {
      if (selectedCategory.value == 0) {
        properties = await _propertyContract.fetchProperties();
        propertySubject.add(properties);
      } else {
        final category = _mapCategoryIndexToName(selectedCategory.value);
        properties = await _propertyContract.fetchCategory(category);
        propertySubject.add(properties);
      }
    } catch (e) {
      log('$e');
      propertySubject.addError('Error occured');
    }
  }

  void filterProperty() async {
    final searchText = searchController.text.trim().toLowerCase();
    if (searchText.isNotEmpty) {
      for (final property in propertiesList) {
        if (property.title.startsWith(property.title.toLowerCase()) ||
            property.title.toLowerCase().contains(searchText) ||
            property.price.toLowerCase().contains(searchText)) {
          filteredPropertyList.add(property);
        }
      }
    } else {
      filteredPropertyList.clear();
    }
  }

  List<PropertyModel> filteredProperties = [];

  bool isEmpty = false;

  void filterProperties(String v) {
    filteredProperties.clear();
    if (v.isEmpty || v == '') {
      isEmpty = false;
      filteredProperties.addAll(properties);
      propertySubject.add(properties);
      return;
    }

    isEmpty = true;

    for (final property in properties) {
      if (property.title.startsWith(property.title.toLowerCase()) ||
            property.title.toLowerCase().contains(v) ||
            property.price.toLowerCase().contains(v)) {
          filteredProperties.add(property);
        }
    }

    propertySubject.add(properties);
  }*/
}
