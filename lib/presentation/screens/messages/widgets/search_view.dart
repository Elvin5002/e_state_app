import '../../../../utilities/extensions/context_extension.dart';
import '../../../../utilities/constants/app_assets.dart';
import '../../../../utilities/constants/app_text_styles.dart';
import '../../../../utilities/constants/app_texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key, required this.onTap, required this.img})
      : super(key: key);

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
            AppTexts.messages,
            style: AppTextStyles.poppinsS18W500Black,
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
