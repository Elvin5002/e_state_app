import '../../../../utilities/extensions/context_extension.dart';
import '../../../../utilities/constants/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key, required this.onTap, required this.img});

  final VoidCallback onTap;
  final String img;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: context.fullHeight* .02),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            AppLocalizations.of(context)!.messages,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Row(
            children: [
              GestureDetector(
                onTap: onTap,
                child: SvgPicture.asset(AppAssets.searchC),
              ),
              20.horizontalSpace,
              CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(img),
              )
            ],
          )
        ],
      ),
    );
  }
}
