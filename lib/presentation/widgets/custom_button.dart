import '../../utilities/extensions/sizedbox_extension.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
const CustomButton({ super.key, required this.width, required this.color, this.borderColor  = Colors.transparent, required this.text, this.textColor = Colors.white, this.widget, this.onTap});

  final double width;
  final Color color;
  final Color borderColor;
  final String text;
  final Color textColor;
  final Widget? widget;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context){
    return InkWell(
      onTap: onTap,
      splashColor: Colors.blue.withOpacity(0.2), 
      highlightColor: Colors.blue.withOpacity(0.1),
      child: Container(
        width: width,
        height: 50,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: borderColor),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              child: widget,
            ),
            5.w,
            Text(
              text,
              style: GoogleFonts.poppins(fontSize: 14,fontWeight: FontWeight.w500, color: textColor),
            ),
          ],
        )
      ),
    );
  }
}
