import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_state_app/presentation/widgets/save_button.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../../data/models/property_model.dart';
import '../../../utilities/extensions/context_extension.dart';
import 'widgets/bottom_buttons.dart';
import 'widgets/price_label.dart';
import 'widgets/room_card.dart';
import '../../../utilities/constants/app_assets.dart';
import '../../../utilities/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'widgets/property_description.dart';
import 'widgets/property_owner.dart';
import 'widgets/property_title.dart';

class PropertyScreen extends StatelessWidget {
  const PropertyScreen({Key? key, required this.property}) : super(key: key);

  final PropertyModel property;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(children: [
              CarouselSlider(
                options: CarouselOptions(
                  height: 445,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: false,
                  autoPlay: true,
                ),
                items: property.images.map((imageUrl) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: NetworkImage(imageUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              const Positioned(
                top: 40,
                left: 0,
                child: BackButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.grey),
                  ),
                ),
              ),
              Positioned(
                top: 310,
                left: 30,
                right: 30,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    PriceLabel(price: property.price),
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
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                PropertyTitle(
                                  title: property.title,
                                  location: property.location,
                                ),
                                SaveButton(
                                  onTap: (){
                                    
                                  }
                                )
                              ]),
                          20.verticalSpace,
                          SizedBox(
                            height: 100,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                RoomCard(
                                    icon: AppAssets.bathroom,
                                    label: '${property.bathroom} Bathroom'),
                                10.horizontalSpace,
                                RoomCard(
                                    icon: AppAssets.bedroom,
                                    label: '${property.bedroom} Bedroom'),
                                10.horizontalSpace,
                                RoomCard(
                                    icon: AppAssets.kitchen,
                                    label: '${property.kitchen} Kitchen'),
                              ],
                            ),
                          ),
                          20.verticalSpace,
                          PropertyDescription(
                            description: property.description,
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
                            PropertyOwner(
                              name: property.ownerName,
                              image: property.ownerImg,
                            ),
                            15.verticalSpace,
                            BottomButtons(
                              scheduleTap: () {},
                              callTap: () async {
                                final phoneNumber = 'tel:+994${property.phone}'; 
                                await launchUrlString(phoneNumber);
                              },
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
