import 'package:e_state_app/utilities/constants/app_borders.dart';
import 'package:flutter/material.dart';

import '../../utilities/constants/app_colors.dart';

class CustomInput extends StatelessWidget {
  const CustomInput({
    Key? key,
    this.labelText,
    this.validator,
    this.obscureText = false,
    this.controller,
    this.fillColor,
    this.hintText,
    this.suffixIcon,
    this.prefixIcon,
    this.hintStyle, 
    this.enabled = true, 
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  final String? labelText;
  final String? Function(String?)? validator;
  final bool obscureText;
  final TextEditingController? controller;
  final Color? fillColor;
  final String? hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextStyle? hintStyle;
  final bool enabled;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      keyboardType: keyboardType,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: const TextStyle(color: AppColors.black),
      decoration: InputDecoration(
        isDense: true,
        hintText: hintText,
        hintStyle: hintStyle,
        labelText: labelText,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        fillColor: fillColor,
        enabled: enabled,
        filled: true,
        contentPadding: const EdgeInsets.only(left: 20, top: 15, bottom: 15),
        border: AppBorders.defaultInputBorder,
        errorBorder: AppBorders.errorInputBorder,
      ),
    );
  }
}
