import 'contact_button.dart';
import '../../../../utilities/constants/app_assets.dart';
import '../../../../utilities/constants/app_colors.dart';
import '../../../../utilities/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ContactButtonsView extends StatelessWidget {
  const ContactButtonsView(
      {super.key,
      required this.messageTap,
      required this.scheduleTap,
      required this.callTap});

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
              title: AppLocalizations.of(context)!.message,
              icon: AppAssets.messageB),
          ContactButton(
              onTap: scheduleTap,
              backgroundColor: AppColors.lorange,
              title: AppLocalizations.of(context)!.schedule,
              icon: AppAssets.schedule),
          ContactButton(
              onTap: callTap,
              backgroundColor: AppColors.lgreen,
              title: AppLocalizations.of(context)!.call,
              icon: AppAssets.callB),
        ],
      ),
    );
  }
}
