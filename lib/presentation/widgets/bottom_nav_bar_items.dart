
import 'package:e_state_app/utilities/constants/app_assets.dart';

class BottomNavBarItems {
  const BottomNavBarItems({required this.icon, required this.activeIcon});

  final String icon;
  final String activeIcon;

  static const bottomNavBarItems = [
    BottomNavBarItems(
      icon: AppAssets.home,
      activeIcon: AppAssets.home,
    ),
    BottomNavBarItems(
      icon: AppAssets.add,
      activeIcon: AppAssets.add,
    ),
    BottomNavBarItems(
      icon: AppAssets.save,
      activeIcon: AppAssets.save,
    ),
    BottomNavBarItems(
      icon: AppAssets.message,
      activeIcon: AppAssets.message,
    ),
    BottomNavBarItems(
      icon: AppAssets.settings,
      activeIcon: AppAssets.settings,
    ),
  ];
}