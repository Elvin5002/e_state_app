import 'package:e_state_app/presentation/screens/privace_policy/privace_policy.dart';
import 'package:e_state_app/presentation/screens/setting/widget/setting_icon.dart';
import 'package:e_state_app/utilities/constants/app_assets.dart';
import 'package:e_state_app/utilities/constants/app_colors.dart';
import 'package:e_state_app/utilities/constants/app_text_styles.dart';
import 'package:e_state_app/utilities/constants/app_texts.dart';
import 'package:e_state_app/utilities/extensions/sizedbox_extension.dart';
import 'package:flutter/material.dart';
import '../contact/contact_screen.dart';

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: [
            15.h,
            Text(
              AppTexts.setting,
              textAlign: TextAlign.center,
              style: AppTextStyles.poppinsS22W500Black,
            ),
            35.h,
            Text(
              AppTexts.basicInfo,
              style: AppTextStyles.poppinsS18W500Black,
            ),
            SettingIcon(
              svgPath: AppAssets.person,
              text: AppTexts.pProfil,
              iconColor: AppColors.lightRed,
              backgroundColor: AppColors.lorange,
              onTap: () {},
            ),
            SettingIcon(
              svgPath: AppAssets.lock,
              text: AppTexts.changePass,
              iconColor: AppColors.lgreen,
              backgroundColor: AppColors.lgreen,
              onTap: () {},
            ),
            35.h,
            Text(
              AppTexts.others,
              style: AppTextStyles.poppinsS18W500Black,
            ),
            SettingIcon(
              svgPath: AppAssets.privacy,
              text: AppTexts.privacePolicy,
              iconColor: AppColors.red,
              backgroundColor: AppColors.lightRed,
              onTap: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => PrivacyPolicyScreen()),
              ),
            ),
            SettingIcon(
              svgPath: AppAssets.data,
              text: AppTexts.dataSaver,
              iconColor: AppColors.blue,
              backgroundColor: AppColors.lightBlue,
              onTap: () {},
            ),
            SettingIcon(
              svgPath: AppAssets.star,
              text: AppTexts.rateUs,
              iconColor: AppColors.lightCoral,
              backgroundColor: AppColors.lorange,
              onTap: () {},
            ),
            SettingIcon(
              svgPath: AppAssets.terms,
              text: AppTexts.termsUse,
              iconColor: AppColors.red,
              backgroundColor: AppColors.lightRed,
              onTap: () {},
            ),
            SettingIcon(
              svgPath: AppAssets.phone,
              text: AppTexts.contactUs,
              iconColor: AppColors.primary,
              backgroundColor: AppColors.lgreen,
              onTap: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => ContactScreen()),
              ),
            ),
            SettingIcon(
              svgPath: AppAssets.logout,
              text: AppTexts.logOut,
              iconColor: AppColors.primary,
              backgroundColor: AppColors.lgreen,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
