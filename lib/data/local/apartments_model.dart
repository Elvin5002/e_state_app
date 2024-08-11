import 'package:e_state_app/utilities/constants/app_assets.dart';

class ApartmentsModel {
  const ApartmentsModel(this.image, this.name, this.location);

  final String image;
  final String name;
  final String location;

  static const List<ApartmentsModel> apartments = [
    ApartmentsModel(
        AppAssets.apartment1, 'Peace Apartments', 'San Francisco, California'),
    ApartmentsModel(
        AppAssets.apartment2, 'Wooden House', 'San Francisco, California')
  ];
}
