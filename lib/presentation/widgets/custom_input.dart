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
    this.line = 1,
    this.onSubmitted,
    this.action, 
    this.focusNode,
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
  final TextInputAction? action;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      onFieldSubmitted: onSubmitted,
      obscureText: obscureText,
      validator: validator,
      keyboardType: keyboardType,
      maxLines: line,
      textInputAction: action,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: Theme.of(context).textTheme.labelMedium,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        enabled: enabled,
        filled: true,
        contentPadding: const EdgeInsets.only(left: 20, top: 15, bottom: 15),
      ),
    );
  }
}
