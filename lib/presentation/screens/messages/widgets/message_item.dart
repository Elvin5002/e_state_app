import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../utilities/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import '../../../../utilities/constants/app_text_styles.dart';

class MessageItem extends StatelessWidget {
  const MessageItem(
      {Key? key,
      required this.img,
      required this.name,
      required this.time,
      required this.message,
      required this.isOnline,
      required this.onTap})
      : super(key: key);

  final String img;
  final String name;
  final String time;
  final String message;
  final bool isOnline;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: context.fullHeight * .05),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(img),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 18,
                        height: 18,
                        decoration: BoxDecoration(
                          color: isOnline ? Colors.green : Colors.grey,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 3),
                        ),
                      ),
                    ),
                  ],
                ),
                11.horizontalSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: AppTextStyles.poppinsS12W400Black,
                    ),
                    6.verticalSpace,
                    Text(
                      message,
                      style: AppTextStyles.poppinsS10W400Grey,
                    ),
                  ],
                )
              ],
            ),
            Text(
              time,
              style: AppTextStyles.poppinsS10W400Grey,
            ),
          ],
        ),
      ),
    );
  }
}
