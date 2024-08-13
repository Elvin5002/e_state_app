import '../../cubits/filter/filter_cubit.dart';
import '../../cubits/home/home_cubit.dart';
import '../../cubits/login/login_cubit.dart';
import '../../cubits/signup/signup_cubit.dart';
import 'package:e_state_app/locator.dart';
import '../../screens/filter/empty_screen.dart';
import '../../screens/filter/filter_screen.dart';
import '../../screens/login/login_screen.dart';
import '../../screens/property%20overview/property_screen.dart';
import '../../screens/signup/signup_screen.dart';
import '../../screens/splash/splash_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Pager {
  Pager._();

  static Widget get splash => const SplashScreen();
  static Widget get signup => BlocProvider(
            create: (context) => SignupCubit(locator()),
        child: const SignupScreen());
  static Widget get login => BlocProvider(
        create: (context) => LoginCubit(locator()),
        child: const LoginScreen(),
      );
  static Widget get filter => BlocProvider(
        create: (context) => FilterCubit(),
        child: const FilterScreen(),
      );

  static Widget get empty => BlocProvider(
            create: (context) => HomeCubit(),
        child: EmptyScreen());

  static Widget get property => const PropertyScreen();
  
}
