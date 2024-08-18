import '../../../utilities/constants/app_text_styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../utilities/extensions/navigation_extension.dart';
import '../../../utilities/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../utilities/constants/app_assets.dart';
import '../../../utilities/constants/app_texts.dart';
import '../../../utilities/helpers/pager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class SplashScreen extends StatefulWidget {
const SplashScreen({ Key? key }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 3000))
        .whenComplete(() =>  context.replace(FirebaseAuth.instance.currentUser == null
        ? Pager.login: Pager.root));
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 120,
              width: 120,
              decoration: const BoxDecoration(
                color: AppColors.lightGreen,
                shape: BoxShape.circle
              ),
              child: Center( 
                child: SizedBox(
                  width: 40,  
                  height: 45,
                  child: SvgPicture.asset(AppAssets.vector),
                ),
              ),
            ),
            20.verticalSpace,
            Text(
              AppTexts.appName,
              style: AppTextStyles.poppinsS24W400,
            )
          ],
        ),
      )
    );
  }
}