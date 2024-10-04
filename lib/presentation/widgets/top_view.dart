import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../utilities/constants/app_assets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TopView extends StatelessWidget {
const TopView({ super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(AppAssets.pattern),
        44.verticalSpace,
        Text(title, style: Theme.of(context).textTheme.headlineSmall),
        8.verticalSpace,
        Text(AppLocalizations.of(context)!.welcome, style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}