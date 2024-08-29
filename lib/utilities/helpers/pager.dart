import '../../cubits/user/user_info_cubit.dart';
import '../../presentation/screens/fill/fill_profile.dart';
import '../../cubits/filter/filter_cubit.dart';
import '../../cubits/home/home_cubit.dart';
import '../../cubits/login/login_cubit.dart';
import '../../cubits/signup/signup_cubit.dart';
import 'package:e_state_app/locator.dart';
import '../../presentation/screens/root/root.dart';
import '../../presentation/screens/filter/filter_screen.dart';
import '../../presentation/screens/login/login_screen.dart';
import '../../presentation/screens/signup/signup_screen.dart';
import '../../presentation/screens/splash/splash_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Pager {
  Pager._();

  static Widget get splash => const SplashScreen();
  static Widget get fillProfile => BlocProvider(
        create: (context) => UserInfoCubit(locator())..getEmail(),
        child: const FillProfile(),
      );
  static Widget get signup => BlocProvider(
      create: (context) => SignupCubit(locator()), child: const SignupScreen());
  static Widget get login => BlocProvider(
        create: (context) => LoginCubit(locator()),
        child: const LoginScreen(),
      );
  static Widget get filter => BlocProvider(
        create: (context) => FilterCubit(),
        child: const FilterScreen(),
      );

  static Widget get root => BlocProvider(create: (context) => HomeCubit(locator())..fetchProperties(), child: Root());
}
