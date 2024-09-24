import '../../../../utilities/constants/app_colors.dart';
import '../../../../utilities/constants/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PropertyTitle extends StatelessWidget {
  const PropertyTitle({Key? key, required this.title, required this.location}) : super(key: key);

  final String title;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: AppTextStyles.poppinsS16W500Black,
        ),
        3.verticalSpace,
        Row(
          children: [
            const Icon(Icons.location_on, color: AppColors.grey, size: 15,),
            Text(
              location, 
              style: AppTextStyles.poppinsS12W400Grey,
            ),
          ],
        ),
      ],
    );
  }
}
