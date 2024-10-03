import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PropertyDescription extends StatelessWidget {
  const PropertyDescription({super.key, required this.description});

  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppLocalizations.of(context)!.description,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        8.verticalSpace,
        Text(
          description,
          style: Theme.of(context).textTheme.labelMedium,
        ),
      ],
    );
  }
}
