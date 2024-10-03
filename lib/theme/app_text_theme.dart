
import 'package:flutter/material.dart';
import '../utilities/constants/app_text_styles.dart';

class AppTextTheme {
  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: AppTextStyles.poppinsS24W700Black,
    headlineMedium: AppTextStyles.poppinsS24W500Black,
    headlineSmall: AppTextStyles.poppinsS22W600Black,

    titleLarge: AppTextStyles.poppinsS18W500Black,
    titleMedium: AppTextStyles.poppinsS16W500Black,
    titleSmall: AppTextStyles.poppinsS16W400Black,

    displayLarge: AppTextStyles.poppinsS20W500Black,
    displayMedium: AppTextStyles.poppinsS18W400Black,
    displaySmall: AppTextStyles.poppinsS12W400Blue,

    bodyLarge: AppTextStyles.poppinsS14W500Black,
    bodyMedium: AppTextStyles.poppinsS14W400Grey,
    bodySmall: AppTextStyles.poppinsS10W400Grey,

    labelLarge: AppTextStyles.poppinsS14W400Black,
    labelMedium: AppTextStyles.poppinsS12W400Black,
    labelSmall: AppTextStyles.poppinsS12W400Grey,
  );

  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: AppTextStyles.poppinsS24W700White,
    headlineMedium: AppTextStyles.poppinsS24W500White,
    headlineSmall: AppTextStyles.poppinsS22W600White,

    titleLarge: AppTextStyles.poppinsS18W500White,
    titleMedium: AppTextStyles.poppinsS16W500White,
    titleSmall: AppTextStyles.poppinsS16W400White,

    displayLarge: AppTextStyles.poppinsS20W500White,
    displayMedium: AppTextStyles.poppinsS18W400White,
    displaySmall: AppTextStyles.poppinsS12W400Blue,

    bodyLarge: AppTextStyles.poppinsS14W500White,
    bodyMedium: AppTextStyles.poppinsS14W400White,
    bodySmall: AppTextStyles.poppinsS10W400White,

    labelLarge: AppTextStyles.poppinsS14W400White,
    labelMedium: AppTextStyles.poppinsS12W400White,
    labelSmall: AppTextStyles.poppinsS12W400White,
  );

}
