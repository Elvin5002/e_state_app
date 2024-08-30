import 'package:firebase_auth/firebase_auth.dart';

import '../models/user_model.dart';

abstract class UserContract {
  Future<void> addUser(
    User user,
    String? username,
    String? phone,
  );

  Future<UserModel?> getUser(String uid);
}