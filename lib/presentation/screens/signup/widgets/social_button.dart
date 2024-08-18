import '../../../../utilities/extensions/context_extension.dart';
import '../../../../utilities/extensions/sizedbox_extension.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../utilities/constants/app_assets.dart';
import '../../../../utilities/constants/app_colors.dart';
import '../../../../utilities/constants/app_texts.dart';
import '../../../widgets/custom_button.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 1,
            child: CustomButton(
                width: context.fullWidth,
                color: AppColors.red,
                widget: SvgPicture.asset(AppAssets.google),
                text: AppTexts.google)),
        19.w,
        Expanded(
            flex: 1,
            child: CustomButton(
                width: context.fullWidth,
                color: AppColors.blue,
                text: AppTexts.facebook,
                widget: SvgPicture.asset(AppAssets.facebook))),
      ],
    );
  }
}
