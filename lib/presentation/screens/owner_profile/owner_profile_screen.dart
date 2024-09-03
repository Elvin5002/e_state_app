import '../../../utilities/extensions/context_extension.dart';
import '../../../utilities/extensions/navigation_extension.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../builders_profile/builders_profile_screen.dart';
import 'widgets/contact_buttons_view.dart';
import 'widgets/grid_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../data/models/property_model.dart';
import '../../../utilities/constants/app_text_styles.dart';
import '../../../utilities/constants/app_texts.dart';
import 'package:flutter/material.dart';

class OwnerProfileScreen extends StatelessWidget {
  const OwnerProfileScreen({Key? key, required this.property})
      : super(key: key);

  final PropertyModel property;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppTexts.profile,
          style: AppTextStyles.poppinsS16W400Black,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.fullWidth*.08),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Center(
              child: CircleAvatar(
                radius: 45,
                backgroundImage: NetworkImage(property.ownerImg),
              ),
            ),
            10.verticalSpace,
            Text(
              property.ownerName,
              style: AppTextStyles.poppinsS18W500Black,
              textAlign: TextAlign.center,
            ),
            2.verticalSpace,
            Text(
              'akkdf@gmail.com',
              style: AppTextStyles.poppinsS12W400Black,
              textAlign: TextAlign.center,
            ),
            20.verticalSpace,
            ContactButtonsView(
              messageTap: () {}, 
              scheduleTap: () => context.to(const BuildersProfileScreen()), 
              callTap: () async {
                final phoneNumber = 'tel:+994${property.phone}';
                await launchUrlString(phoneNumber);
              },
            ),
            20.verticalSpace,
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
                childAspectRatio: 1.3
              ),
              itemCount: 10,
              itemBuilder: (context, index) {
                return GridItem(img: property.images[0], onTap: () {  },);
              },
            )
          ],
        ),
      ),
    );
  }
}
