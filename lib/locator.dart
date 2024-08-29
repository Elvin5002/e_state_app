import 'package:e_state_app/data/contracts/property_contract.dart';
import 'package:e_state_app/data/repositories/property_repository.dart';
import 'package:e_state_app/data/services/property_service.dart';

import 'data/contracts/auth_contract.dart';
import 'data/contracts/user_contract.dart';
import 'data/repositories/auth_repository.dart';
import 'data/repositories/user_repository.dart';
import 'data/services/auth_service.dart';
import 'data/services/user_service.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setupLocator(){
  locator.registerLazySingleton(() => AuthService());
  locator.registerLazySingleton<AuthContract>(() => AuthRepository(locator()));

  locator.registerLazySingleton(()=> UserService());
  locator.registerLazySingleton<UserContract>(()=> UserRepository(locator()));

  locator.registerLazySingleton(()=> PropertyService());
  locator.registerLazySingleton<PropertyContract>(()=> PropertyRepository(locator()));
}