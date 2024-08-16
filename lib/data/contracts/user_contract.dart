import 'package:firebase_auth/firebase_auth.dart';

abstract class UserContract {
  Future<void> addUser(
    User user,
    String? username,
    String? phone,
  );
}