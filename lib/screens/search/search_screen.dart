import 'package:e_state_app/screens/search/widgets/apartments_view.dart';
import 'package:e_state_app/screens/search/widgets/comments.dart';
import 'package:e_state_app/screens/search/widgets/company_view.dart';
import 'package:e_state_app/screens/widgets/search_and_filter.dart';
import 'package:e_state_app/utilities/constants/app_colors.dart';
import 'package:e_state_app/utilities/constants/app_text_styles.dart';
import 'package:e_state_app/utilities/constants/app_texts.dart';
import 'package:e_state_app/utilities/extensions/context_extension.dart';
import 'package:e_state_app/utilities/extensions/sizedbox_extension.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.bg,
        body: Padding(
          padding: EdgeInsets.only(
              left: context.fullWidth * 0.07,
              top: MediaQuery.of(context).viewPadding.top + 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SearchAndFilter(
                  onTap: () {  },
                ),
                15.h,
                Text(
                  AppTexts.matchedPro,
                  style: AppTextStyles.poppinsS18W400,
                ),
                15.h,
                const ApartmentsView(),
                15.h,
                Text(
                  AppTexts.company,
                  style: AppTextStyles.poppinsS18W400,
                ),
                15.h,
                const CompanyView(),
                15.h,
                const Comments(),
              ],
            ),
          ),
        ));
  }
}
