import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PropertyOwner extends StatelessWidget {
  const PropertyOwner({super.key, required this.name, required this.image, required this.onTap});

  final String name;
  final String image;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(children: [
        CircleAvatar(
          radius: 25.r,
          backgroundImage: NetworkImage(image),
        ),
        20.horizontalSpace,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              name,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            1.verticalSpace,
            Text(
              AppLocalizations.of(context)!.propOwner,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        )
      ]),
    );
  }
}
