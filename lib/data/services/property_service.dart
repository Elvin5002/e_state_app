import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/property_model.dart';

class PropertyService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<PropertyModel>> fetchProperties() async {
    final snapshot = await _firestore.collection('properties').get();
    return snapshot.docs.map((doc) => PropertyModel.fromMap(doc.data())).toList();
  }

  Future<void> addProperty(PropertyModel property) async {
    try {
      await _firestore.collection('properties').add(property.toMap());
      log('Property added successfully');
    } catch (e) {
      log('Failed to add property: $e');
    }
  }

  Future<List<PropertyModel>> fetchCategory(String category) async {
    final snapshot = await _firestore.collection('properties')
      .where('category', isEqualTo: category)
      .get();
    return snapshot.docs.map((doc) => PropertyModel.fromMap(doc.data())).toList();
  }

}
