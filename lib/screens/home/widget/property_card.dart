import 'package:e_state_app/utilities/constants/app_border_radius.dart';
import 'package:e_state_app/utilities/constants/app_colors.dart';
import 'package:e_state_app/utilities/constants/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PropertyCard extends StatelessWidget {
  final String title;
  final String location;
  final String price;
  final String imageUrl;

  const PropertyCard({
    super.key,
    required this.title,
    required this.location,
    required this.price,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Container(
        height: 295,
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
                    height: 169,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 10.0),
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
                          5.verticalSpace,
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
                          Text(price, style: AppTextStyles.poppinsS22W500Blue),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Positioned(
              top: 150,
              right: 20,
              child: CircleAvatar(
                radius: 18,
                backgroundColor: AppColors.lightRed,
                child: Icon(
                  Icons.bookmark,
                  color: Colors.white,
                  size: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
