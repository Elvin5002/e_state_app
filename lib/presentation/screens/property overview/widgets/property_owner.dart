import '../../../../utilities/constants/app_text_styles.dart';
import '../../../../utilities/constants/app_texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PropertyOwner extends StatelessWidget {
  const PropertyOwner({Key? key, required this.name, required this.image, required this.onTap})
      : super(key: key);

  final String name;
  final String image;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(children: [
        CircleAvatar(
          radius: 25.r,
          backgroundImage: NetworkImage(image),
        ),
        20.horizontalSpace,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              name,
              style: AppTextStyles.poppinsS14W500Black,
            ),
            1.verticalSpace,
            Text(
              AppTexts.propOwner,
              style: AppTextStyles.poppinsS10W400Grey,
            ),
          ],
        )
      ]),
    );
  }
}
