import 'package:flutter/material.dart';
import '../utilities/constants/app_colors.dart';

class AppIconButtonTheme {
  static IconButtonThemeData iconButtonLightTheme = IconButtonThemeData(
    style: IconButton.styleFrom(
      backgroundColor: AppColors.white,
      foregroundColor: AppColors.sGrey,
    ),
  );

  static IconButtonThemeData iconButtonDarkTheme = IconButtonThemeData(
    style: IconButton.styleFrom(
      backgroundColor: AppColors.card,
      foregroundColor: AppColors.white,
    ),
  );
}