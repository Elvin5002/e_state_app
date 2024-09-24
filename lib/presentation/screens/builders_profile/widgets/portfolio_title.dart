import '../../../../utilities/constants/app_assets.dart';
import '../../../../utilities/constants/app_text_styles.dart';
import '../../../../utilities/constants/app_texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PortfolioTitle extends StatelessWidget {
  const PortfolioTitle({Key? key, required this.onTap}) : super(key: key);

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          AppTexts.portfolios,
          style: AppTextStyles.poppinsS16W500White,
        ),
        GestureDetector(onTap: onTap, child: SvgPicture.asset(AppAssets.list))
      ],
    );
  }
}
