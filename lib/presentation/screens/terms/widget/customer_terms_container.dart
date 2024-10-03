import 'package:e_state_app/utilities/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTermsContainer extends StatelessWidget {
  final List<Widget> children; // Accepts a list of widgets

  const CustomTermsContainer({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 237,
      width: 315,
      padding: const EdgeInsets.all(20.0),
      color: AppColors.white,
      child: Column(
        children: children,
      ),
    );
  }
}
