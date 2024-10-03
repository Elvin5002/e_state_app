import '../../../../utilities/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ContactButton extends StatelessWidget {
  const ContactButton(
      {super.key,
      required this.onTap,
      required this.backgroundColor,
      required this.title,
      required this.icon});

  final VoidCallback onTap;
  final Color backgroundColor;
  final String title;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: context.fullWidth*.26,
        height: context.fullHeight*.12,
        decoration: BoxDecoration(
            color: backgroundColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(15)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 30,
              height: 30,
              child: SvgPicture.asset(
                icon,
              ),
            ),
            10.verticalSpace,
            Text(
              title,
              style: Theme.of(context).textTheme.labelMedium,
            )
          ],
        ),
      ),
    );
  }
}
