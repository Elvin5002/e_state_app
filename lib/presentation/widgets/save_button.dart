import 'package:flutter/material.dart';

import '../../utilities/constants/app_colors.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({Key? key, required this.onTap}) : super(key: key);

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: const CircleAvatar(
        radius: 18,
        backgroundColor: AppColors.lightRed,
        child: Icon(
          Icons.bookmark,
          color: Colors.white,
          size: 16,
        ),
      ),
    );
  }
}
