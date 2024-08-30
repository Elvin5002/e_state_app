import 'widgets/apartments_view.dart';
import 'widgets/comments.dart';
import 'widgets/company_view.dart';
import '../../widgets/search_and_filter.dart';
import '../../../utilities/constants/app_text_styles.dart';
import '../../../utilities/constants/app_texts.dart';
import '../../../utilities/extensions/context_extension.dart';
import '../../../utilities/extensions/sizedbox_extension.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: context.fullWidth * 0.07,
          top: MediaQuery.of(context).viewPadding.top + 10),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SearchAndFilter(),
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
    );
  }
}
