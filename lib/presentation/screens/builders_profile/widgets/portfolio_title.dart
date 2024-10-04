import '../../../../utilities/constants/app_assets.dart';
import '../../../../utilities/constants/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PortfolioTitle extends StatelessWidget {
  const PortfolioTitle({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          AppLocalizations.of(context)!.portfolios,
          style: AppTextStyles.poppinsS16W500White,
        ),
        GestureDetector(onTap: onTap, child: SvgPicture.asset(AppAssets.list))
      ],
    );
  }
}
