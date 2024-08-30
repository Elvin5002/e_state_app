import '../../utilities/constants/app_colors.dart';
import '../../utilities/extensions/context_extension.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class LoadingButton extends StatelessWidget {
  const LoadingButton({
    Key? key, required this.text, this.onTap, required this.isLoading,
  }) : super(key: key);

  final String text;
  final void Function()? onTap;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading ? null : onTap,
      child: Container(
        width: context.fullWidth,
        height: 50,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.center,
        child: isLoading
            ? const CircularProgressIndicator(
                strokeWidth: 3.0,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              )
            : Text(
                text,
                style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.white),
              ),
      ),
    );
  }
}
