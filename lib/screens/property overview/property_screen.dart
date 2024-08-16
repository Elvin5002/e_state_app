import '../../utilities/extensions/context_extension.dart';
import 'widgets/bottom_buttons.dart';
import 'widgets/price_label.dart';
import 'widgets/room_card.dart';
import '../../utilities/constants/app_assets.dart';
import '../../utilities/constants/app_colors.dart';
import '../../utilities/constants/app_texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'widgets/property_description.dart';
import 'widgets/property_owner.dart';
import 'widgets/property_title.dart';

class PropertyScreen extends StatelessWidget {
  const PropertyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(children: [
              Image.asset(
                AppAssets.background,
                fit: BoxFit.cover,
                height: 445,
              ),
              const Positioned(
                top: 40,
                left: 0,
                child: BackButton(),
              ),
              Positioned(
                top: 310,
                left: 30,
                right: 30,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const PriceLabel(price: '22'),
                    SvgPicture.asset(AppAssets.edit)
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: context.fullHeight * .48),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                    color: AppColors.white),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(
                        left: 30,
                        right: 30,
                        top: 30,
                      ),
                      child: Column(
                        children: [
                          const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                PropertyTitle(
                                  title: 'Artificial Apartment',
                                  location: 'NY, New York',
                                ),
                                CircleAvatar(
                                  radius: 18,
                                  backgroundColor: AppColors.lightRed,
                                  child: Icon(
                                    Icons.bookmark,
                                    color: Colors.white,
                                    size: 16,
                                  ),
                                ),
                              ]),
                          20.verticalSpace,
                          SizedBox(
                            height: 100,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                RoomCard(
                                    icon: AppAssets.bathroom,
                                    label: AppTexts.bathroom),
                                10.horizontalSpace,
                                RoomCard(
                                    icon: AppAssets.bathroom,
                                    label: AppTexts.bathroom),
                                10.horizontalSpace,
                                RoomCard(
                                    icon: AppAssets.bathroom,
                                    label: AppTexts.bathroom),
                                10.horizontalSpace,
                                RoomCard(
                                    icon: AppAssets.bathroom,
                                    label: AppTexts.bathroom),
                                10.horizontalSpace,
                                RoomCard(
                                    icon: AppAssets.bathroom,
                                    label: AppTexts.bathroom),
                              ],
                            ),
                          ),
                          20.verticalSpace,
                          const PropertyDescription(
                            description:
                                'Description the pattern of narrative development that aims to make vivid a place, object....',
                          ),
                        ],
                      ),
                    ),
                    20.verticalSpace,
                    Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25),
                          ),
                          color: AppColors.lightGrey),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 20),
                        child: Column(
                          children: [
                            const PropertyOwner(
                              name: 'Elvin Seyfullayev',
                              image: 'https://via.placeholder.com/150',
                            ),
                            15.verticalSpace,
                            BottomButtons(
                              scheduleTap: () {},
                              callTap: () {},
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
