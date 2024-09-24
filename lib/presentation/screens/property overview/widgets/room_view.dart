import 'package:e_state_app/utilities/extensions/context_extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../utilities/constants/app_assets.dart';
import 'room_card.dart';
import 'package:flutter/material.dart';

class RoomView extends StatelessWidget {
  const RoomView({Key? key, required this.bathroom, required this.bedroom, required this.kitchen}) : super(key: key);

  final String bathroom;
  final String bedroom;
  final String kitchen;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.fullHeight * .112,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          RoomCard(
              icon: AppAssets.bathroom,
              label: '$bathroom Bathroom'),
          10.horizontalSpace,
          RoomCard(
              icon: AppAssets.bedroom,
              label: '$bedroom Bedroom'),
          10.horizontalSpace,
          RoomCard(
              icon: AppAssets.kitchen,
              label: '$kitchen Kitchen'),
        ],
      ),
    );
  }
}
