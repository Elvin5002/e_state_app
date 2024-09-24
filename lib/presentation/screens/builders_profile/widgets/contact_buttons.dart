import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../utilities/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../utilities/constants/app_assets.dart';
import '../../../../utilities/constants/app_colors.dart';
import '../../../../utilities/constants/app_texts.dart';
import '../../../widgets/custom_button.dart';

class ContactButtons extends StatelessWidget {
  const ContactButtons({Key? key, this.messageTap, this.callTap})
      : super(key: key);

  final void Function()? messageTap;
  final void Function()? callTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 1,
          child: CustomButton(
            width: context.fullWidth,
            color: AppColors.white,
            text: AppTexts.message,
            borderColor: AppColors.lgreen,
            textColor: AppColors.primary,
            widget: SvgPicture.asset(AppAssets.message, color: AppColors.primary,),
            onTap: messageTap,
          ),
        ),
        15.horizontalSpace,
        Expanded(
          flex: 1,
          child: CustomButton(
            width: context.fullWidth,
            color: AppColors.primary,
            text: AppTexts.call,
            widget: SvgPicture.asset(AppAssets.call),
            onTap: callTap,
          ),
        ),
      ],
    );
  }
}
