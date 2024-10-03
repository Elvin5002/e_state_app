import 'package:e_state_app/utilities/extensions/context_extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../utilities/constants/app_assets.dart';
import 'room_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RoomView extends StatelessWidget {
  const RoomView({super.key, required this.bathroom, required this.bedroom, required this.kitchen});

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
              label: '$bathroom ${AppLocalizations.of(context)!.bathroom}'),
          10.horizontalSpace,
          RoomCard(
              icon: AppAssets.bedroom,
              label: '$bedroom ${AppLocalizations.of(context)!.bedroom}'),
          10.horizontalSpace,
          RoomCard(
              icon: AppAssets.kitchen,
              label: '$kitchen ${AppLocalizations.of(context)!.kitchen}'),
        ],
      ),
    );
  }
}
