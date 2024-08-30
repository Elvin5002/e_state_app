import 'package:e_state_app/utilities/constants/app_text_styles.dart';
import 'package:e_state_app/utilities/constants/app_texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilBar extends StatelessWidget {
  const ProfilBar({super.key, required this.fullName, required this.image});

  final String fullName;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10),
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
          SizedBox(
            height: 37,
            width: 37,
            child: ClipOval(
              child: Image.network(
                image,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
