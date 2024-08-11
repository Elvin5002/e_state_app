import 'package:e_state_app/cubits/facebook_login/facebook_login_cubit.dart';
import 'package:e_state_app/cubits/filter/filter_cubit.dart';
import 'package:e_state_app/cubits/login/login_cubit.dart';
import 'package:e_state_app/cubits/signup/signup_cubit.dart';
import 'package:e_state_app/locator.dart';
import 'package:e_state_app/screens/filter/filter_screen.dart';
import 'package:e_state_app/screens/login/login_screen.dart';
import 'package:e_state_app/screens/signup/signup_screen.dart';
import 'package:e_state_app/screens/splash/splash_screen.dart';
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
}
