import 'package:e_state_app/presentation/screens/terms/widget/customer_terms_container.dart';
import 'package:e_state_app/utilities/constants/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TermsScreen extends StatelessWidget {
  const TermsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {},
          ),
          title: Text(AppLocalizations.of(context)!.termofServ),
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
                    AppLocalizations.of(context)!.terms,
                    style: AppTextStyles.poppinsS18W500Black,
                  ),
                ),
                20.verticalSpace,
                Text(AppLocalizations.of(context)!.termstext1,
                    style: AppTextStyles.poppinsS12W400Black),
                20.verticalSpace,
                Text(AppLocalizations.of(context)!.termstext2,
                    style: AppTextStyles.poppinsS12W400Black),
              ],
            ),
            20.verticalSpace,
            CustomTermsContainer(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(AppLocalizations.of(context)!.userLicense,
                      style: AppTextStyles.poppinsS18W500Black),
                ),
                20.verticalSpace,
                Text(AppLocalizations.of(context)!.userLicText1,
                    style: AppTextStyles.poppinsS12W400Black),
                20.verticalSpace,
                Text(AppLocalizations.of(context)!.userLicText2,
                    style: AppTextStyles.poppinsS12W400Black),
              ],
            ),
            20.verticalSpace,
            CustomTermsContainer(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(AppLocalizations.of(context)!.ourPrivacyPol,
                      style: AppTextStyles.poppinsS18W500Black),
                ),
                20.verticalSpace,
                Text(AppLocalizations.of(context)!.ourPrivcyText1,
                    style: AppTextStyles.poppinsS12W400Black),
                20.verticalSpace,
                Text(AppLocalizations.of(context)!.ourPrivcyText2,
                    style: AppTextStyles.poppinsS12W400Black),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
