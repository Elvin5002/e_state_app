import 'package:e_state_app/utilities/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import '../../../../utilities/constants/app_border_radius.dart';
import '../../../../utilities/constants/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class RoomCard extends StatelessWidget {
const RoomCard({ super.key, required this.icon, required this.label });

  final String icon;
  final String label;

  @override
  Widget build(BuildContext context){
    return Container(
      width: context.fullWidth * .2613,
      height: context.fullHeight * .112,
      decoration: BoxDecoration(
        borderRadius: AppBorderRadius.a20,
        color: Theme.of(context).canvasColor
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.lightPink
            ),
            child: Center(child: SizedBox(width: 16, height: 16, child: SvgPicture.asset(icon)))
          ),
          8.verticalSpace,
          Text(label, style: Theme.of(context).textTheme.labelMedium,),
        ],
      ),
    );
  }
}