import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../utilities/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../utilities/constants/app_assets.dart';
import '../../../../utilities/constants/app_colors.dart';
import '../../../widgets/custom_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ContactButtons extends StatelessWidget {
  const ContactButtons({super.key, this.messageTap, this.callTap});

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
            color: AppColors.transparent,
            text: AppLocalizations.of(context)!.message,
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
            text: AppLocalizations.of(context)!.call,
            widget: SvgPicture.asset(AppAssets.call),
            onTap: callTap,
          ),
        ),
      ],
    );
  }
}
