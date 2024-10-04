import '../../cubits/home/home_cubit.dart';
import 'bottom_nav_bar_items.dart';
import '../../utilities/constants/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    const navItems = BottomNavBarItems.bottomNavBarItems;
    final cubit = context.read<HomeCubit>();
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
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
              backgroundColor: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
              selectedIconTheme: Theme.of(context).bottomNavigationBarTheme.selectedIconTheme,
              unselectedIconTheme: Theme.of(context).bottomNavigationBarTheme.unselectedIconTheme,
              currentIndex: selectedIndex!,
              items: [
                for (final item in navItems)
                  BottomNavigationBarItem(
                    label: '',
                    icon: SizedBox(
                        width: 20,
                        height: 20,
                        child: SvgPicture.asset(item.icon, color: Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,)),
                    activeIcon: Stack(
                      alignment: Alignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(25),
                          child: SizedBox(
                              width: 20,
                              height: 20,
                              child: SvgPicture.asset(
                                item.activeIcon,
                                color: Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
                              )),
                        ),
                        Positioned(
                          bottom: 0,
                          child: SvgPicture.asset(
                            AppAssets.polygon,
                            width: 8,
                            height: 8,
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            );
          }),
    );
  }
}
