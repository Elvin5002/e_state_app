import 'package:e_state_app/main.dart';
import 'package:e_state_app/screens/privace_policy/widget/privace_policy_text.dart';
import 'package:e_state_app/utilities/constants/app_text_styles.dart';
import 'package:e_state_app/utilities/constants/app_texts.dart';
import 'package:e_state_app/utilities/extensions/sizedbox_extension.dart';
import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              45.h,
              Text(AppTexts.privacyPolicy,
                  style: AppTextStyles.poppinsS22W500Black),
              16.h,
              Text(PrivacePolicyText.privacePolicyterms),
            ],
          ),
        ),
      ),
    );
  }
}
