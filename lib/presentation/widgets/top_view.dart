import '../../utilities/constants/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
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
        Text(title, style: AppTextStyles.poppinsS22W600Black,),
        8.verticalSpace,
        Text(AppTexts.welcome, style: AppTextStyles.poppinsS14W400Grey,),
      ],
    );
  }
}