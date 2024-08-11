import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utilities/constants/app_assets.dart';
import '../../utilities/constants/app_texts.dart';

class TopView extends StatelessWidget {
const TopView({ Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(AppAssets.pattern),
        44.verticalSpace,
        Text(title, style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.w600),),
        8.verticalSpace,
        Text(AppTexts.welcome, style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w400),),
      ],
    );
  }
}