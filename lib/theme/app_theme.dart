import 'package:e_state_app/theme/app_elevated_button_theme.dart';
import 'package:e_state_app/theme/app_icon_button_theme.dart';
import 'package:e_state_app/theme/app_input_decoration_theme.dart';
import 'package:e_state_app/utilities/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_text_theme.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    inputDecorationTheme: AppInputDecorationTheme.lightInputDecorationTheme,
    disabledColor: AppColors.lBlue,
    cardColor: AppColors.white,
    canvasColor: AppColors.lpink,
    shadowColor: AppColors.lightGrey,
    highlightColor: AppColors.sGrey,
    scaffoldBackgroundColor: AppColors.lightGrey,
    iconTheme: const IconThemeData(color: Colors.black),
    iconButtonTheme: AppIconButtonTheme.iconButtonLightTheme,
    textTheme: AppTextTheme.lightTextTheme,
    elevatedButtonTheme: AppElevatedButtonTheme.elevatedButtonLightTheme,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.bg,
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.black),
      titleTextStyle: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w500, color: AppColors.sGrey),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: Colors.blueAccent,
      unselectedItemColor: Colors.grey,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: AppColors.sGrey,
    inputDecorationTheme: AppInputDecorationTheme.darkInputDecorationTheme,
    disabledColor: AppColors.card,
    cardColor: AppColors.card,
    canvasColor: AppColors.canvas,
    shadowColor: AppColors.secondary,
    highlightColor: AppColors.secondary,
    scaffoldBackgroundColor: AppColors.secondary,
    iconTheme: const IconThemeData(color: AppColors.card),
    iconButtonTheme: AppIconButtonTheme.iconButtonLightTheme,
    textTheme: AppTextTheme.darkTextTheme,
    elevatedButtonTheme: AppElevatedButtonTheme.elevatedButtonDarkTheme,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.secondary,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w500, color: AppColors.white),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.bottomNav,
      selectedItemColor: Colors.blueAccent,
      unselectedItemColor: Colors.grey,
    ),
  );
}
