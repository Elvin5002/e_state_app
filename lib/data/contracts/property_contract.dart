import '../models/property_model.dart';

abstract class PropertyContract {
  Future<List<PropertyModel>> fetchProperties();
  Future<void> addProperty(PropertyModel property);
}