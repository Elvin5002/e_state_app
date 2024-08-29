import 'package:e_state_app/presentation/screens/terms/widget/customer_terms_container.dart';
import 'package:e_state_app/utilities/constants/app_text_styles.dart';
import 'package:e_state_app/utilities/constants/app_texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TermsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {},
          ),
          title: const Text(AppTexts.termofServ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {},
            ),
          ],
        ),
        body: ListView(
          children: [
            CustomTermsContainer(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    AppTexts.terms,
                    style: AppTextStyles.poppinsS18W500Black,
                  ),
                ),
                20.verticalSpace,
                Text(AppTexts.termstext1,
                    style: AppTextStyles.poppinsS12W400Black),
                20.verticalSpace,
                Text(AppTexts.termstext2,
                    style: AppTextStyles.poppinsS12W400Black),
              ],
            ),
            20.verticalSpace,
            CustomTermsContainer(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(AppTexts.userLicense,
                      style: AppTextStyles.poppinsS18W500Black),
                ),
                20.verticalSpace,
                Text(AppTexts.userLicText1,
                    style: AppTextStyles.poppinsS12W400Black),
                20.verticalSpace,
                Text(AppTexts.userLicText2,
                    style: AppTextStyles.poppinsS12W400Black),
              ],
            ),
            20.verticalSpace,
            CustomTermsContainer(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(AppTexts.ourPrivacyPol,
                      style: AppTextStyles.poppinsS18W500Black),
                ),
                20.verticalSpace,
                Text(AppTexts.ourPrivcyText1,
                    style: AppTextStyles.poppinsS12W400Black),
                20.verticalSpace,
                Text(AppTexts.ourPrivcyText2,
                    style: AppTextStyles.poppinsS12W400Black),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
