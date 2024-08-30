import 'package:e_state_app/utilities/constants/app_colors.dart';
import 'package:e_state_app/utilities/constants/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CountIcons extends StatelessWidget {
  const CountIcons({Key? key, required this.minusClick, required this.plusClick, required this.count, required this.room}) : super(key: key);

  final VoidCallback minusClick;
  final VoidCallback plusClick;
  final String count;
  final String room;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(room, style: AppTextStyles.poppinsS14W500Black,),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
          height: 40,
          width: 120,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.black),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.remove_circle_outline),
                onPressed: minusClick,
              ),
              1.horizontalSpace,
              Text(count, style: AppTextStyles.poppinsS14W500Black,),
              1.horizontalSpace,
              IconButton(
                icon: const Icon(Icons.add_circle_outline),
                onPressed: plusClick,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
