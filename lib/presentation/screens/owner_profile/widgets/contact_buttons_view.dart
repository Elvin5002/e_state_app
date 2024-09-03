import 'contact_button.dart';
import '../../../../utilities/constants/app_assets.dart';
import '../../../../utilities/constants/app_colors.dart';
import '../../../../utilities/constants/app_texts.dart';
import '../../../../utilities/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class ContactButtonsView extends StatelessWidget {
  const ContactButtonsView(
      {Key? key,
      required this.messageTap,
      required this.scheduleTap,
      required this.callTap})
      : super(key: key);

  final VoidCallback messageTap;
  final VoidCallback scheduleTap;
  final VoidCallback callTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: context.fullHeight*.024),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ContactButton(
              onTap: messageTap,
              backgroundColor: AppColors.lightBlue,
              title: AppTexts.message,
              icon: AppAssets.messageB),
          ContactButton(
              onTap: scheduleTap,
              backgroundColor: AppColors.lorange,
              title: AppTexts.schedule,
              icon: AppAssets.schedule),
          ContactButton(
              onTap: callTap,
              backgroundColor: AppColors.lgreen,
              title: AppTexts.call,
              icon: AppAssets.callB),
        ],
      ),
    );
  }
}
