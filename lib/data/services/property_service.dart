
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/property_model.dart';

class PropertyService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<PropertyModel>> fetchProperties() async {
    final snapshot = await _firestore.collection('properties').get();
    return snapshot.docs.map((doc) => PropertyModel.fromMap(doc.data())).toList();
  }
}
