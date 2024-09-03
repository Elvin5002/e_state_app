import 'widget/privace_policy_text.dart';
import '../../../utilities/constants/app_text_styles.dart';
import '../../../utilities/constants/app_texts.dart';
import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppTexts.privacyPolicy,
          style: AppTextStyles.poppinsS22W500Black
        ),
        centerTitle: true,
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(PrivacePolicyText.privacePolicyterms),
            ],
          ),
        ),
      ),
    );
  }
}
