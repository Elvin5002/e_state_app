import 'package:google_maps_flutter/google_maps_flutter.dart';

class PropertyModel {
  final String bathroom;
  final String bedroom;
  final String category;
  final String description;
  final List<String> images;
  final String kitchen;
  final LatLng location;
  final String city;
  final String ownerImg;
  final String ownerName;
  final String phone;
  final String price;
  final String size;
  final String title;

  PropertyModel({
    required this.bathroom,
    required this.bedroom,
    required this.category,
    required this.description,
    required this.images,
    required this.kitchen,
    required this.location,
    required this.city,
    required this.ownerImg,
    required this.ownerName,
    required this.phone,
    required this.price,
    required this.size,
    required this.title,
  });

  // fromMap method
  factory PropertyModel.fromMap(Map<String, dynamic> data) {
    final locationData = data['location'] as Map<String, dynamic>;
    return PropertyModel(
      bathroom: data['bathroom'] as String,
      bedroom: data['bedroom'] as String,
      category: data['category'] as String,
      description: data['description'] as String,
      images: List<String>.from(data['images']),
      kitchen: data['kitchen'] as String,
      location: LatLng(locationData['latitude'], locationData['longitude']),
      city: data['city'] as String,
      ownerImg: data['ownerImg'] as String,
      ownerName: data['ownerName'] as String,
      phone: data['phone'] as String,
      price: data['price'] as String,
      size: data['size'] as String,
      title: data['title'] as String,
    );
  }

  // toMap method
  Map<String, dynamic> toMap() {
    return {
      'bathroom': bathroom,
      'bedroom': bedroom,
      'category': category,
      'description': description,
      'images': images,
      'kitchen': kitchen,
      'location': {
        'latitude': location.latitude,
        'longitude': location.longitude,
      },
      'city': city,
      'ownerImg': ownerImg,
      'ownerName': ownerName,
      'phone': phone,
      'price': price,
      'size': size,
      'title': title,
    };
  }
}
