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
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    Future.delayed(const Duration(milliseconds: 3000)).whenComplete(() =>
        context.replace(FirebaseAuth.instance.currentUser == null
            ? Pager.login
            : Pager.root));
    super.initState();
  }

  @override
  void dispose() {
    _controller.stop();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ScaleTransition(
              scale: _animation,
              child: Container(
                height: 120,
                width: 120,
                decoration: const BoxDecoration(
                  color: AppColors.lightGreen,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: SizedBox(
                    width: 40,
                    height: 45,
                    child: SvgPicture.asset(AppAssets.vector), 
                  ),
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
    ));
  }
}
