import 'package:e_state_app/screens/home/widget/profil_bar.dart';
import 'package:e_state_app/screens/home/widget/category_icon.dart';
import 'package:e_state_app/screens/home/widget/property_card.dart';
import 'package:e_state_app/screens/widgets/search_and_filter.dart';
import 'package:e_state_app/utilities/constants/app_text_styles.dart';
import 'package:e_state_app/utilities/constants/app_texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: ProfilBar(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            15.verticalSpace,
            const SearchAndFilter(),
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
            Expanded(
              child: ListView(
                scrollDirection: Axis.vertical,
                children: const [
                  PropertyCard(
                    title: AppTexts.francisco,
                    location: AppTexts.locatioFrancisco,
                    price: AppTexts.price1500,
                    imageUrl:
                        'https://www.w3schools.com/w3images/livingroom.jpg',
                  ),
                  PropertyCard(
                    title: AppTexts.woodenHouse,
                    location: AppTexts.locationAngles,
                    price: AppTexts.price2000,
                    imageUrl:
                        'https://www.w3schools.com/w3images/livingroom2.jpg',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
