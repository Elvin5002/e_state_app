import '../../../../utilities/constants/app_text_styles.dart';
import '../../../../utilities/constants/app_texts.dart';
import '../../../../utilities/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PropertyCount extends StatelessWidget {
  const PropertyCount(
      {Key? key,
      required this.propertyCount,
      required this.awardCount,
      required this.apartmentCount})
      : super(key: key);

  final String propertyCount;
  final String awardCount;
  final String apartmentCount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: context.fullWidth * .08,
          vertical: context.fullHeight * .037),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(propertyCount, style: AppTextStyles.poppinsS24W700Black),
              1.verticalSpace,
              Text(AppTexts.property, style: AppTextStyles.poppinsS14W400Black)
            ],
          ),
          Column(
            children: [
              Text(awardCount, style: AppTextStyles.poppinsS24W700Black),
              1.verticalSpace,
              Text(AppTexts.awards, style: AppTextStyles.poppinsS14W400Black)
            ],
          ),
          Column(
            children: [
              Text(apartmentCount, style: AppTextStyles.poppinsS24W700Black),
              1.verticalSpace,
              Text(AppTexts.apartment, style: AppTextStyles.poppinsS14W400Black)
            ],
          )
        ],
      ),
    );
  }
}
