import 'package:e_state_app/utilities/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CountIcons extends StatelessWidget {
  const CountIcons({super.key, required this.minusClick, required this.plusClick, required this.count, required this.room});

  final VoidCallback minusClick;
  final VoidCallback plusClick;
  final String count;
  final String room;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(room, style: Theme.of(context).textTheme.bodyLarge,),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
          height: 40,
          width: 100,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.grey),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              1.horizontalSpace,
              InkWell(
                onTap: minusClick,
                borderRadius: BorderRadius.circular(50), 
                child: const Icon(Icons.remove_circle_outline, color: AppColors.grey,),
              ),
              Text(count, style: Theme.of(context).textTheme.bodyLarge,),
              InkWell(
                onTap: plusClick,
                borderRadius: BorderRadius.circular(50), 
                child: const Icon(Icons.add_circle_outline, color: AppColors.grey,),
              ),
              1.horizontalSpace,
            ],
          ),
        ),
      ],
    );
  }
}
