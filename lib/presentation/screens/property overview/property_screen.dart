import 'widgets/room_view.dart';
import 'property_location_screen.dart';
import '../../widgets/save_button.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../../data/models/property_model.dart';
import '../../../utilities/extensions/context_extension.dart';
import 'widgets/bottom_buttons.dart';
import 'widgets/price_label.dart';
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
              SizedBox(
                height: 445,
                child: PageView.builder(
                  itemCount: property.images.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage(property.images[index]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              ),
              const Positioned(
                top: 40,
                left: 30,
                child: BackButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(AppColors.lightGrey),
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
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PropertyLocationScreen(
                              initialLocation: property.location,
                            ),
                          ),
                        );
                      },
                      child: SvgPicture.asset(AppAssets.edit),
                    ),
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
                                  location: property.city,
                                ),
                                SaveButton(isSaved: true, deleteProperty: () {  }, saveProperty: () {  },)
                              ]
                          ),
                          20.verticalSpace,
                          RoomView(
                            bathroom: property.bathroom, 
                            bedroom: property.bedroom, 
                            kitchen: property.kitchen
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
