
class UserModel {
  final String fullName;
  final String photo;
  final String phone;
  final String userId;
  final String email;
  final String deviceToken;

  UserModel({
    required this.fullName,
    required this.photo,
    required this.phone,
    required this.userId,
    required this.email,
    required this.deviceToken,
  });

  factory UserModel.fromMap(Map<String, dynamic> data) {
    return UserModel(
      fullName: data['fullname'] ?? '',
      photo: data['photo'] ?? '',
      phone: data['phone'] ?? '',
      userId: data['userId'] ?? '',
      email: data['email'] ?? '',
      deviceToken: data['deviceToken'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'fullName': fullName,
      'photo': photo,
      'phone': phone,
      'userId': userId,
      'email': email,
      'deviceToken': deviceToken,
    };
  }
}
