import 'package:e_state_app/cubits/home/home_cubit.dart';
import 'package:e_state_app/presentation/widgets/bottom_nav_bar_items.dart';
import 'package:e_state_app/utilities/constants/app_assets.dart';
import 'package:e_state_app/utilities/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class BottomNavBar extends StatelessWidget {
const BottomNavBar({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    const navItems = BottomNavBarItems.bottomNavBarItems;
    final cubit = context.read<HomeCubit>();
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
      ),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
          color: Colors.white,
        ),
        child: StreamBuilder(
            initialData: 0,
            stream: cubit.viewSubject.stream,
            builder: (context, snapshot) {
              final selectedIndex = snapshot.data;
              return BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                iconSize: 24,
                onTap: (index) => cubit.viewSubject.add(index),
                selectedFontSize: 0,
                currentIndex: selectedIndex!,
                items: [
                  for (final item in navItems)
                    BottomNavigationBarItem(
                      label: '',
                      icon: SizedBox(width: 20, height: 20, child: SvgPicture.asset(item.icon)),
                      activeIcon: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 18.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(width: 20, height: 20, child: SvgPicture.asset(item.activeIcon, color: AppColors.darkBlue,)),
                            10.verticalSpace,
                            SvgPicture.asset(AppAssets.polygon)
                          ],
                        ),
                      ),
                    ),
                ],
              );
            }),
      ),
        );
  }
}
