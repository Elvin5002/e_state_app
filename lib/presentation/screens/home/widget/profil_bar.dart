import '../../../../utilities/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class ProfilBar extends StatelessWidget {
  const ProfilBar({super.key, required this.fullName, required this.image});

  final String fullName;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: context.fullHeight * .012),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              25.verticalSpace,
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
          CircleAvatar(
            radius: 22.r,
            child: Image.network(
              image,
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}
