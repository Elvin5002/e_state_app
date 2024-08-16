import 'package:e_state_app/screens/widgets/custom_button.dart';
import 'package:e_state_app/screens/widgets/custom_input.dart';
import 'package:e_state_app/utilities/constants/app_colors.dart';
import 'package:e_state_app/utilities/constants/app_texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(AppTexts.contactUs),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              // Action for the more button
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomInput(obscureText: false, hintText: AppTexts.fullName),
            20.verticalSpace,
            CustomInput(obscureText: false, hintText: AppTexts.email),
            20.verticalSpace,
            CustomInput(obscureText: false, hintText: AppTexts.phoneNO),
            20.verticalSpace,
            CustomInput(obscureText: false, hintText: AppTexts.message),
            20.verticalSpace,
            CustomButton(
                width: 315, color: AppColors.primary, text: AppTexts.send),
          ],
        ),
      ),
    );
  }
}
