import 'package:e_state_app/data/local/property_model.dart';

class PropertyService {
  List<PropertyModel> getProperties() {
    return [
      PropertyModel(
          name: 'Francisco Apartment',
          location: 'San Francisco, California',
          price: 1500),
    ];
  }
}
