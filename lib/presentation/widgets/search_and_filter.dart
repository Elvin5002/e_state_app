import 'package:e_state_app/presentation/widgets/custom_input.dart';
import 'package:e_state_app/utilities/constants/app_assets.dart';
import 'package:e_state_app/utilities/constants/app_texts.dart';
import 'package:e_state_app/utilities/extensions/context_extension.dart';
import 'package:e_state_app/utilities/extensions/sizedbox_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utilities/constants/app_colors.dart';
import '../../utilities/constants/app_text_styles.dart';

class SearchAndFilter extends StatelessWidget {
  const SearchAndFilter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: context.fullWidth * 0.682,
          height: context.fullHeight * 0.06,
          child: CustomInput(
            hintText: AppTexts.search,
            hintStyle: AppTextStyles.hintSearch,
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
          onTap: () {
            showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    color: AppColors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            10.h,
                        Divider(
                          indent: context.fullWidth * 0.46,
                          endIndent: context.fullWidth * 0.46,
                          color: AppColors.black,
                        ),
                        10.h,
                        Text(
                          'Filter',
                          style: AppTextStyles.poppinsS16W500Black,
                        ),
                        10.h,
                        SizedBox(
                            width: context.fullWidth * 0.84,
                            height: context.fullHeight * 0.06,
                            child: const CustomInput(
                              hintText: 'Search Location',
                              hintStyle: AppTextStyles.hintSearch,
                              prefixIcon: Icon(Icons.location_on,color: AppColors.sGrey,),
                              fillColor: AppColors.bg,
                            )),
                        10.h,
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left:30),
                          child: Column(
                            children: [
                              Text('Property types',style: AppTextStyles.poppinsS16W500Black,),
                              10.h,
                              
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                });
          },
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
