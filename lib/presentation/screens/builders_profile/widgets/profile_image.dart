import 'package:e_state_app/utilities/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({Key? key, required this.img}) : super(key: key);

  final String img;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 92.r,
        height: 92.r,
        decoration: BoxDecoration(
          border: Border.all(width: 6, color: AppColors.white),
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(image: NetworkImage(img), fit: BoxFit.cover),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
      ),
    );
  }
}
