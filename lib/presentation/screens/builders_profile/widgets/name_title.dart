import '../../../../utilities/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../utilities/constants/app_colors.dart';
import '../../../../utilities/constants/app_text_styles.dart';

class NameTitle extends StatelessWidget {
  const NameTitle({super.key, required this.name, required this.location});

  final String name;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: context.fullHeight * .073),
      child: Column(
        children: [
          Text(
            name,
            style: AppTextStyles.poppinsS18W500Black,
          ),
          3.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.location_on,
                color: AppColors.grey,
                size: 15,
              ),
              4.horizontalSpace,
              Text(
                location,
                style: AppTextStyles.poppinsS12W400Grey,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
