import 'package:e_state_app/utilities/constants/app_text_styles.dart';

import '../../../../utilities/constants/app_border_radius.dart';
import '../../../../utilities/constants/app_colors.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class RoomCard extends StatelessWidget {
const RoomCard({ Key? key, required this.icon, required this.label }) : super(key: key);

  final String icon;
  final String label;

  @override
  Widget build(BuildContext context){
    return Container(
      width: 98,
      height: 91,
      decoration: const BoxDecoration(
        borderRadius: AppBorderRadius.a20,
        color: AppColors.lightPink
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 26,
            height: 26,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.lightPink
            ),
            child: SizedBox(width: 16, height: 16, child: SvgPicture.asset(icon))
          ),
          8.verticalSpace,
          Text(label, style: AppTextStyles.poppinsS12W400Black,),
        ],
      ),
    );
  }
}