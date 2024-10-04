import 'package:flutter/material.dart';

import '../../../../utilities/extensions/context_extension.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../utilities/constants/app_assets.dart';
import '../../../../utilities/constants/app_colors.dart';
import '../../../widgets/custom_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BottomButtons extends StatelessWidget {
  const BottomButtons({super.key, this.scheduleTap, this.callTap});

  final void Function()? scheduleTap;
  final void Function()? callTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: CustomButton(
            width: context.fullWidth,
            color: AppColors.transparent,
            text: AppLocalizations.of(context)!.schedule,
            borderColor: AppColors.grey500,
            textColor: Theme.of(context).textTheme.bodyLarge!.color!,
            onTap: scheduleTap,
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
