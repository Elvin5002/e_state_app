import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utilities/extensions/navigation_extension.dart';
import '../../../utilities/helpers/pager.dart';
import 'widget/setting_icon.dart';
import '../../../utilities/constants/app_assets.dart';
import '../../../utilities/constants/app_colors.dart';
import '../../../utilities/constants/app_text_styles.dart';
import '../../../utilities/constants/app_texts.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              AppTexts.setting,
              textAlign: TextAlign.center,
              style: AppTextStyles.poppinsS22W500Black,
            ),
          ),
          28.verticalSpace,
          Text(
            AppTexts.basicInfo,
            style: AppTextStyles.poppinsS18W500Black,
          ),
          20.verticalSpace,
          SettingIcon(
            svgPath: AppAssets.person,
            text: AppTexts.pProfil,
            backgroundColor: AppColors.lorange,
            onTap: () {},
          ),
          SettingIcon(
            svgPath: AppAssets.lock,
            text: AppTexts.changePass,
            backgroundColor: AppColors.lgreen,
            onTap: () {},
          ),
          45.verticalSpace,
          Text(
            AppTexts.others,
            style: AppTextStyles.poppinsS18W500Black,
          ),
          20.verticalSpace,
          SettingIcon(
            svgPath: AppAssets.privacy,
            text: AppTexts.privacePolicy,
            backgroundColor: AppColors.lightRed,
            onTap: () => context.to(Pager.privacyPolicy)
          ),
          SettingIcon(
            svgPath: AppAssets.data,
            text: AppTexts.dataSaver,
            backgroundColor: AppColors.lightBlue,
            onTap: () {},
          ),
          SettingIcon(
            svgPath: AppAssets.star,
            text: AppTexts.rateUs,
            backgroundColor: AppColors.lorange,
            onTap: () {},
          ),
          SettingIcon(
            svgPath: AppAssets.terms,
            text: AppTexts.termsUse,
            backgroundColor: AppColors.lightRed,
            onTap: () {},
          ),
          SettingIcon(
            svgPath: AppAssets.phone,
            text: AppTexts.contactUs,
            backgroundColor: AppColors.lgreen,
            onTap: () => context.to(Pager.contact)
          ),
          SettingIcon(
            svgPath: AppAssets.logout,
            text: AppTexts.logOut,
            backgroundColor: AppColors.lgreen,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
