


import 'package:e_state_app/utilities/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  AppTextStyles._();

  static const hintSearch =  TextStyle(fontFamily: 'Poppins',color: AppColors.sGrey,fontSize: 14,fontWeight: FontWeight.w400);
  static final poppinsS18W400= GoogleFonts.poppins(fontSize: 18,fontWeight: FontWeight.w400);
  static final poppinsS18W500White = GoogleFonts.poppins(fontSize: 18,fontWeight: FontWeight.w500,color: AppColors.white);
  static final poppinsS12W400White = GoogleFonts.poppins(fontSize: 12,fontWeight: FontWeight.w400,color: AppColors.white);
  static final poppinsS12W400Black = GoogleFonts.poppins(fontSize: 12,fontWeight: FontWeight.w400,color: AppColors.black);
  static final poppinsS14W500Black = GoogleFonts.poppins(fontSize: 14,fontWeight: FontWeight.w500,color: AppColors.black);
}