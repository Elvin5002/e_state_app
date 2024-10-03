import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingIcon extends StatelessWidget {
  final String svgPath;
  final String text;
  final Color backgroundColor;
  final VoidCallback onTap;

  const SettingIcon({super.key, 
    required this.svgPath,
    required this.text,
    required this.backgroundColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: Row(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: backgroundColor.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: SizedBox(
                  width: 18,
                  height: 16,
                  child: SvgPicture.asset(svgPath,),
                ),
              ),
            ),
            12.horizontalSpace,
            Text(
              text,
              style: Theme.of(context).textTheme.titleLarge,
            ), 
          ],
        ),
      ),
    );
  }
}