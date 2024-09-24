import '../../../../utilities/constants/app_text_styles.dart';
import '../../../../utilities/constants/app_texts.dart';
import '../../../../utilities/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilBar extends StatelessWidget {
  const ProfilBar({super.key, required this.fullName, required this.image});

  final String fullName;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: context.fullHeight * .012),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              25.verticalSpace,
              Text(
                AppTexts.hello,
                style: AppTextStyles.poppinsS12W400Black,
              ),
              2.verticalSpace,
              Text(
                fullName,
                style: AppTextStyles.poppinsS22W500Black,
              ),
            ],
          ),
          CircleAvatar(
            radius: 22.r,
            child: Image.network(
              image,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
