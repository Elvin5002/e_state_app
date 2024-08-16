import 'package:e_state_app/utilities/constants/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoryIcons extends StatelessWidget {
  const CategoryIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.asset(AppAssets.all),
        SvgPicture.asset(AppAssets.building),
        SvgPicture.asset(AppAssets.land),
        SvgPicture.asset(AppAssets.house),
      ],
    );
  }
}
