import 'widgets/profile_image.dart';
import 'widgets/property_count.dart';
import '../../../utilities/constants/app_assets.dart';
import '../../../utilities/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utilities/constants/app_colors.dart';
import 'widgets/contact_buttons.dart';
import 'widgets/item_view.dart';
import 'widgets/name_title.dart';
import 'widgets/portfolio_title.dart';

class BuildersProfileScreen extends StatelessWidget {
  const BuildersProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Stack(children: [
            SizedBox(
              height: context.fullHeight * .55,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.asset(
                  AppAssets.background,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 10,
              left: context.fullWidth * .08,
              child: const BackButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(AppColors.lightGrey),
                ),
              ),
            ),
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: context.fullHeight * .29),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                      color: AppColors.white),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: context.fullWidth * .08),
                        child: Column(
                          children: [
                            const NameTitle(
                              name: 'A.Lisa',
                              location: 'NY, New York',
                            ),
                            15.verticalSpace,
                            ContactButtons(
                              callTap: () {},
                              messageTap: () {},
                            )
                          ],
                        ),
                      ),
                      30.verticalSpace,
                      Container(
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            ),
                            color: AppColors.lBlue),
                        child: const PropertyCount(
                            propertyCount: '255',
                            awardCount: '14',
                            apartmentCount: '270'),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            ),
                            color: AppColors.sGrey),
                        child: Padding(
                          padding: EdgeInsets.all(context.fullWidth * .08),
                          child: Column(
                            children: [
                              PortfolioTitle(
                                onTap: () {},
                              ),
                              30.verticalSpace,
                              GridView.builder(
                                padding: EdgeInsets.symmetric(
                                    horizontal: context.fullWidth * .04),
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 20,
                                  crossAxisSpacing: 20,
                                  childAspectRatio: 9 / 10,
                                ),
                                itemCount: 10,
                                itemBuilder: (context, index) {
                                  return const ItemView(
                                    img:
                                        "https://firebasestorage.googleapis.com/v0/b/e-state-8291e.appspot.com/o/images%2FhrFBgCmjaQOX0853IOP1ArxxIba2%2F33.jpg?alt=media&token=ff483388-a00d-4251-a7d9-5b19e67c63a1",
                                  );
                                },
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  top: context.fullHeight * .24,
                  left: 0,
                  right: 0,
                  child: const ProfileImage(
                    img:
                        'https://firebasestorage.googleapis.com/v0/b/e-state-8291e.appspot.com/o/users%2FhrFBgCmjaQOX0853IOP1ArxxIba2%2Fprofiles%2F33a11ec7801981f093f10698e251f954.jpg?alt=media&token=b17bf110-a855-4cac-ab2e-48743b5a6c2d',
                  ),
                ),
              ],
            ),
          ]),
        ],
      ),
    );
  }
}
