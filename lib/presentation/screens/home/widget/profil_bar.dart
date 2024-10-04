import '../../../../utilities/extensions/navigation_extension.dart';
import '../../../../utilities/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../notification/notification_screen.dart';


class ProfilBar extends StatelessWidget {
  const ProfilBar({super.key, required this.fullName, required this.image});

  final String fullName;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: context.fullHeight * .025),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 22.r,
                child: Image.network(
                  image,
                  fit: BoxFit.fill,
                ),
              ),
              10.horizontalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppLocalizations.of(context)!.hello,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  2.verticalSpace,
                  Text(
                    fullName,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              ),
            ],
          ),
          IconButton(
            onPressed: ()=> context.to(NotificationScreen()), 
            icon: const Icon(Icons.notifications)
          )
        ],
      ),
    );
  }
}
