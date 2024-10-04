import 'package:e_state_app/utilities/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppInputDecorationTheme{

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    labelStyle:  GoogleFonts.poppins(fontSize: 12, color: AppColors.sGrey),
    filled: true,
    fillColor: AppColors.lightGrey,
    hintStyle: GoogleFonts.poppins(fontSize: 12, color: AppColors.sGrey),
    prefixIconColor: AppColors.sGrey,
    suffixIconColor: AppColors.sGrey,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Color(0xFFDFDFDF), width: 1),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Color(0xFFDFDFDF), width: 1),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Colors.black, width: 2),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Colors.red, width: 2),
    ),
  );

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    labelStyle:  GoogleFonts.poppins(fontSize: 12, color: AppColors.white),
    filled: true,
    fillColor: AppColors.inputColor,
    hintStyle: GoogleFonts.poppins(fontSize: 12, color: AppColors.white),
    prefixIconColor: AppColors.white,
    suffixIconColor: AppColors.white,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: AppColors.inputColor, width: 1),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: AppColors.inputColor, width: 1),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Colors.white, width: 2),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Colors.red, width: 2),
    ),
  );
}