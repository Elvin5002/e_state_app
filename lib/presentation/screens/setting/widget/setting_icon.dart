import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:e_state_app/utilities/constants/app_text_styles.dart';

class SettingIcon extends StatelessWidget {
  final String svgPath;
  final String text;
  final Color backgroundColor;
  final Color iconColor;
  final VoidCallback onTap;

  SettingIcon({
    required this.svgPath,
    required this.text,
    required this.backgroundColor,
    required this.iconColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: TextButton.icon(
        onPressed: onTap,
        icon: Container(
          decoration: BoxDecoration(
            color: backgroundColor.withOpacity(0.2),
            shape: BoxShape.circle,
          ),
          padding: const EdgeInsets.all(15.0),
          child: SvgPicture.asset(
            svgPath,
            color: iconColor,
            width: 20.0,
            height: 20.0,
          ),
        ),
        label: Text(
          text,
          style: AppTextStyles.poppinsS18W500Black,
        ),
      ),
    );
  }
}
