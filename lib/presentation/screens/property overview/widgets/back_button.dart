import '../../../../utilities/constants/app_colors.dart';
import 'package:flutter/material.dart';

class BackBtn extends StatelessWidget {
  const BackBtn({Key? key, this.onTap}) : super(key: key);

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 33,
      height: 33,
      decoration: const BoxDecoration(
        color: AppColors.primary,
        shape: BoxShape.circle
      ),
      child: IconButton(color: AppColors.white, onPressed: onTap, icon: Icon(Icons.arrow_back_ios),)
    );
  }
}
