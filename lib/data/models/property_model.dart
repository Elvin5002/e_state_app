class PropertyModel {
  final String bathroom;
  final String bedroom;
  final String category;
  final String description;
  final String image;
  final String kitchen;
  final String location;
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
    required this.image,
    required this.kitchen,
    required this.location,
    required this.ownerImg,
    required this.ownerName,
    required this.phone,
    required this.price,
    required this.size,
    required this.title,
  });

  // fromMap method
  factory PropertyModel.fromMap(Map<String, dynamic> data) {
    return PropertyModel(
      bathroom: data['bathroom'] as String,
      bedroom: data['bedroom'] as String,
      category: data['category'] as String,
      description: data['description'] as String,
      image: data['image'] as String,
      kitchen: data['kitchen'] as String,
      location: data['location'] as String,
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
      'image': image,
      'kitchen': kitchen,
      'location': location,
      'ownerImg': ownerImg,
      'ownerName': ownerName,
      'phone': phone,
      'price': price,
      'size': size,
      'title': title,
    };
  }
}
