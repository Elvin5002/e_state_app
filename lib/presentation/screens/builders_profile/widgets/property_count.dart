import '../../../../utilities/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PropertyCount extends StatelessWidget {
  const PropertyCount(
      {super.key,
      required this.propertyCount,
      required this.awardCount,
      required this.apartmentCount});

  final String propertyCount;
  final String awardCount;
  final String apartmentCount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: context.fullWidth * .08,
          vertical: context.fullHeight * .04),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(propertyCount, style: Theme.of(context).textTheme.headlineLarge),
              1.verticalSpace,
              Text(AppLocalizations.of(context)!.property, style: Theme.of(context).textTheme.labelLarge)
            ],
          ),
          Column(
            children: [
              Text(awardCount, style: Theme.of(context).textTheme.headlineLarge),
              1.verticalSpace,
              Text(AppLocalizations.of(context)!.awards, style: Theme.of(context).textTheme.labelLarge)
            ],
          ),
          Column(
            children: [
              Text(apartmentCount, style: Theme.of(context).textTheme.headlineLarge),
              1.verticalSpace,
              Text(AppLocalizations.of(context)!.apartment, style: Theme.of(context).textTheme.labelLarge)
            ],
          )
        ],
      ),
    );
  }
}
