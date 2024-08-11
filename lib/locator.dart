import 'package:e_state_app/data/contracts/auth_contract.dart';
import 'package:e_state_app/data/repositories/auth_repository.dart';
import 'package:e_state_app/data/services/auth_service.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setupLocator(){
  locator.registerLazySingleton(() => AuthService());
  locator.registerLazySingleton<AuthContract>(() => AuthRepository(locator()));
}