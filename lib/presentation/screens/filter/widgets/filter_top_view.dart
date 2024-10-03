import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../utilities/constants/app_assets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FilterTopView extends StatelessWidget {
const FilterTopView({ super.key });

  @override
  Widget build(BuildContext context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(AppAssets.pattern),
        42.verticalSpace,
        Text(AppLocalizations.of(context)!.budget, style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w500),),
      ],
    );
  }
}