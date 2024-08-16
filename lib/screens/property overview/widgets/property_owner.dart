import '../../../utilities/constants/app_text_styles.dart';
import '../../../utilities/constants/app_texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PropertyOwner extends StatelessWidget {
  const PropertyOwner({Key? key, required this.name, required this.image}) : super(key: key);

  final String name;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 35,
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
        
      ]
    );
  }
}
