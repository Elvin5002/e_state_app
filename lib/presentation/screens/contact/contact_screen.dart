import 'package:e_state_app/presentation/widgets/custom_button.dart';
import 'package:e_state_app/presentation/widgets/custom_input.dart';
import 'package:e_state_app/utilities/constants/app_colors.dart';
import 'package:e_state_app/utilities/constants/app_texts.dart';
import 'package:e_state_app/utilities/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppTexts.contactUs),
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
            CustomInput(obscureText: false, hintText: AppTexts.fullName),
            20.verticalSpace,
            CustomInput(obscureText: false, hintText: AppTexts.email),
            20.verticalSpace,
            CustomInput(obscureText: false, hintText: AppTexts.phoneNO),
            20.verticalSpace,
            CustomInput(obscureText: false, hintText: AppTexts.message, line: 5,),
            20.verticalSpace,
            CustomButton(
              color: AppColors.primary,
              text: AppTexts.send,
              width: context.fullWidth,
            ),
          ],
        ),
      ),
    );
  }
}
