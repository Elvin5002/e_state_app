import 'package:e_state_app/utilities/extensions/sizedbox_extension.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
      required this.width,
      required this.color,
      this.borderColor = Colors.transparent,
      required this.text,
      this.textColor = Colors.white,
      this.icon})
      : super(key: key);

  final double width;
  final Color color;
  final Color borderColor;
  final String text;
  final Color textColor;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
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
            Text(
              text,
              style: TextStyle(color: textColor),
            ),
            5.w,
            Icon(icon),
          ],
        ));
  }
}
