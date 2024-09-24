import '../../utilities/constants/app_assets.dart';

class BottomNavBarItems {
  const BottomNavBarItems({required this.icon, required this.activeIcon});

  final String icon;
  final String activeIcon;

  static const bottomNavBarItems = [
    BottomNavBarItems(
      icon: AppAssets.home,
      activeIcon: AppAssets.homeActive,
    ),
    BottomNavBarItems(
      icon: AppAssets.search,
      activeIcon: AppAssets.searchActive,
    ),
    BottomNavBarItems(
      icon: AppAssets.add,
      activeIcon: AppAssets.add,
    ),
    BottomNavBarItems(
      icon: AppAssets.save,
      activeIcon: AppAssets.saveActive,
    ),
    BottomNavBarItems(
      icon: AppAssets.message,
      activeIcon: AppAssets.messageActive,
    ),
    BottomNavBarItems(
      icon: AppAssets.settings,
      activeIcon: AppAssets.settingsActive,
    ),
  ];
}