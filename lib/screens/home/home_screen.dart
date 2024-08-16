import 'widget/category_icon.dart';
import 'widget/property_card.dart';
import '../widgets/search_and_filter.dart';
import '../../utilities/constants/app_text_styles.dart';
import '../../utilities/constants/app_texts.dart';
import '../../utilities/extensions/navigation_extension.dart';
import '../../utilities/helpers/pager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widget/profil_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: ListView(
        children: [
          const ProfilBar(),
          15.verticalSpace,
          SearchAndFilter(
            onTap: () {},
          ),
          15.verticalSpace,
          const CategoryIcons(),
          15.verticalSpace,
          Row(
            children: [
              TextButton(
                onPressed: () {},
                child: Text(
                  AppTexts.allProperties,
                  style: AppTextStyles.poppinsS20W500Black,
                ),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {},
                child: Text(
                  AppTexts.seeAll,
                  style: AppTextStyles.poppinsS14W500Black,
                ),
              ),
            ],
          ),
          10.verticalSpace,
          PropertyCard(
            title: AppTexts.francisco,
            location: AppTexts.locatioFrancisco,
            price: AppTexts.price1500,
            imageUrl: 'https://www.w3schools.com/w3images/livingroom.jpg',
            onTap: () => context.to(Pager.property),
          ),
          PropertyCard(
            title: AppTexts.woodenHouse,
            location: AppTexts.locationAngles,
            price: AppTexts.price2000,
            imageUrl: 'https://www.w3schools.com/w3images/livingroom2.jpg',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
