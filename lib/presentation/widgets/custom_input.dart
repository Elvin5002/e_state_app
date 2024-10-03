import '../../utilities/constants/app_borders.dart';
import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  const CustomInput({
    super.key,
    this.labelText,
    this.validator,
    this.obscureText = false,
    this.controller,
    this.fillColor,
    this.hintText,
    this.suffixIcon,
    this.prefixIcon,
    this.enabled = true,
    this.keyboardType = TextInputType.text,
    this.line = 1, this.onSubmitted,
  });

  final String? labelText;
  final String? Function(String?)? validator;
  final bool obscureText;
  final TextEditingController? controller;
  final Color? fillColor;
  final String? hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool enabled;
  final TextInputType? keyboardType;
  final int line;
  final void Function(String)? onSubmitted;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onFieldSubmitted: onSubmitted,
      obscureText: obscureText,
      validator: validator,
      keyboardType: keyboardType,
      maxLines: line,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: Theme.of(context).textTheme.labelMedium,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: Theme.of(context).inputDecorationTheme.hintStyle,
        labelText: labelText,
        labelStyle: Theme.of(context).inputDecorationTheme.labelStyle,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        prefixIconColor: Theme.of(context).inputDecorationTheme.prefixIconColor,
        suffixIconColor: Theme.of(context).inputDecorationTheme.suffixIconColor,
        fillColor: Theme.of(context).inputDecorationTheme.fillColor,
        enabled: enabled,
        filled: true,
        contentPadding: const EdgeInsets.only(left: 20, top: 15, bottom: 15),
        border: Theme.of(context).inputDecorationTheme.border,
        errorBorder: AppBorders.errorInputBorder,
      ),
    );
  }
}
