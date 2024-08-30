import 'package:flutter/material.dart';
import '../../utilities/constants/app_colors.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({Key? key, required this.deleteProperty, required this.isSaved, required this.saveProperty}) : super(key: key);

  final VoidCallback deleteProperty;
  final VoidCallback saveProperty;
  final bool isSaved;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isSaved ? deleteProperty : saveProperty,
      child: CircleAvatar(
        radius: 18,
        backgroundColor:
            isSaved ? AppColors.lGrey : AppColors.lightRed,
        child: Icon(
          Icons.bookmark,
          color: isSaved ? AppColors.lightRed : Colors.white,
          size: 16,
        ),
      ),
    );
  }
}
