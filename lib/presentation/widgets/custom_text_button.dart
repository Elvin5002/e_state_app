import 'package:flutter/material.dart';
import '../../utilities/constants/app_text_styles.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({Key? key, required this.text, required this.onPressed}) : super(key: key);

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: AppTextStyles.poppinsS14W400Blue,
      )
    );
  }
}
