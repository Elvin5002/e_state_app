import '../../utilities/extensions/context_extension.dart';
import 'save_button.dart';
import '../../utilities/constants/app_border_radius.dart';
import '../../utilities/constants/app_colors.dart';
import '../../utilities/constants/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PropertyCard extends StatelessWidget {
  final String title;
  final String location;
  final String price;
  final String imageUrl;
  final VoidCallback onTap;
  final VoidCallback saveProperty;
  final VoidCallback deleteProperty;
  final bool isSaved;

  const PropertyCard({
    super.key,
    required this.title,
    required this.location,
    required this.price,
    required this.imageUrl,
    required this.onTap,
    required this.saveProperty,
    required this.isSaved,
    required this.deleteProperty,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(bottom: context.fullHeight * .0184),
        child: Container(
          height: context.fullHeight * .365,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: AppBorderRadius.a30,
            boxShadow: [
              BoxShadow(
                color: AppColors.lGrey.withOpacity(0.3),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Stack(
            children: [
              Column(
                children: [
                  ClipRRect(
                    borderRadius: AppBorderRadius.a30,
                    child: Image.network(
                      imageUrl,
                      height: context.fullHeight * .208,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: context.fullWidth * .053,
                        top: context.fullHeight * .016,
                        bottom: context.fullHeight * .032),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title, style: AppTextStyles.poppinsS18W500Black),
                        5.verticalSpace,
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on,
                              color: AppColors.lGrey,
                              size: 12,
                            ),
                            5.horizontalSpace,
                            Text(
                              location,
                              style: AppTextStyles.poppinsS12W500Grey,
                            ),
                          ],
                        ),
                        10.verticalSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('\$$price',
                                style: AppTextStyles.poppinsS22W500Blue),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                top: context.fullHeight * .1847,
                right: context.fullWidth * .069,
                child: SaveButton(
                  isSaved: isSaved,
                  deleteProperty: deleteProperty,
                  saveProperty: saveProperty,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
