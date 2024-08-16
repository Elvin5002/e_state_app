
import 'package:e_state_app/data/contracts/user_contract.dart';
import 'package:e_state_app/data/services/user_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserRepository implements UserContract{
  UserRepository(this._userService);

  final UserService _userService;

  @override
  Future<void> addUser(User user, String? username, String? phone) => _userService.addUser(user, username, phone);
  
}