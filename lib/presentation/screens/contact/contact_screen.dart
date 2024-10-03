import 'package:e_state_app/presentation/widgets/custom_button.dart';
import 'package:e_state_app/presentation/widgets/custom_input.dart';
import 'package:e_state_app/utilities/constants/app_colors.dart';
import 'package:e_state_app/utilities/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.contactUs),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              // Action for the more button
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            40.verticalSpace,
            CustomInput(obscureText: false, hintText: AppLocalizations.of(context)!.fullName),
            20.verticalSpace,
            CustomInput(obscureText: false, hintText: AppLocalizations.of(context)!.email),
            20.verticalSpace,
            CustomInput(obscureText: false, hintText: AppLocalizations.of(context)!.phoneNO),
            20.verticalSpace,
            CustomInput(obscureText: false, hintText: AppLocalizations.of(context)!.message, line: 5,),
            40.verticalSpace,
            CustomButton(
              color: AppColors.primary,
              text: AppLocalizations.of(context)!.send,
              width: context.fullWidth,
            ),
          ],
        ),
      ),
    );
  }
}
