import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utilities/constants/app_assets.dart';
import '../../../../utilities/constants/app_texts.dart';

class FilterTopView extends StatelessWidget {
const FilterTopView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(AppAssets.pattern),
        42.verticalSpace,
        Text(AppTexts.budget, style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w500),),
      ],
    );
  }
}