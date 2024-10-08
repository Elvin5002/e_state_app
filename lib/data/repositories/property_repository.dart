import 'package:e_state_app/data/contracts/property_contract.dart';
import 'package:e_state_app/data/models/property_model.dart';
import 'package:e_state_app/data/services/property_service.dart';

class PropertyRepository extends PropertyContract {
  PropertyRepository(this._propertyService);

  final PropertyService _propertyService;

  @override
  Future<List<PropertyModel>> fetchProperties() =>
      _propertyService.fetchProperties();

  @override
  Future<void> addProperty(PropertyModel property) =>
      _propertyService.addProperty(property);

  @override
  Future<List<PropertyModel>> fetchCategory(String category) =>
      _propertyService.fetchCategory(category);
}
