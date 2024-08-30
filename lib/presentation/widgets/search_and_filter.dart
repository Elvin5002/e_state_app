import 'custom_input.dart';
import '../../utilities/constants/app_assets.dart';
import '../../utilities/constants/app_texts.dart';
import '../../utilities/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../utilities/constants/app_colors.dart';

class SearchAndFilter extends StatelessWidget {
  const SearchAndFilter({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: context.fullWidth * 0.682,
          height: context.fullHeight * 0.06,
          child: CustomInput(
            hintText: AppTexts.search,
            prefixIcon: SvgPicture.asset(
              AppAssets.search,
              fit: BoxFit.none,
            ),
            fillColor: AppColors.white,
          ),
        ),
        SizedBox(
          width: context.fullWidth * 0.04,
        ),
        GestureDetector(
          onTap: onTap,
          child: SizedBox(
            width: context.fullHeight * 0.06,
            height: context.fullHeight * 0.06,
            child: SvgPicture.asset(AppAssets.filter),
          ),
        )
      ],
    );
  }
}
