import 'widgets/range_slider_view.dart';
import 'widgets/area_buttons.dart';
import '../../../utilities/extensions/context_extension.dart';
import '../../../utilities/extensions/navigation_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../utilities/constants/app_colors.dart';
import '../../../utilities/helpers/pager.dart';
import '../../widgets/custom_button.dart';
import 'widgets/filter_top_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 33),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const FilterTopView(),
                40.verticalSpace,
                const RangeSliderView(),
                30.verticalSpace,
                Text(
                  AppLocalizations.of(context)!.wantBuy,
                  style: GoogleFonts.poppins(
                      fontSize: 18, fontWeight: FontWeight.w500),
                ),
                30.verticalSpace,
                const AreaButtons(),
                40.verticalSpace,
                CustomButton(
                    onTap: () => context.replace(Pager.login),
                    width: context.fullWidth,
                    color: AppColors.primary,
                    text: AppLocalizations.of(context)!.properties),
                20.verticalSpace,
                Center(
                  child: TextButton(
                      onPressed: () => context.replace(Pager.signup),
                      child: Text(
                        AppLocalizations.of(context)!.skip,
                        style: GoogleFonts.poppins(
                            color: AppColors.lightGreen, fontSize: 14),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
