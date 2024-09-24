import '../../../../utilities/extensions/context_extension.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../utilities/constants/app_assets.dart';
import '../../../../utilities/constants/app_colors.dart';
import '../../../../utilities/constants/app_texts.dart';
import '../../../widgets/custom_button.dart';

class BottomButtons extends StatelessWidget {
  const BottomButtons({Key? key, this.scheduleTap, this.callTap}) : super(key: key);

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
            color: AppColors.white,
            text: AppTexts.schedule,
            borderColor: AppColors.grey500,
            textColor: AppColors.black,
            onTap: scheduleTap,
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
