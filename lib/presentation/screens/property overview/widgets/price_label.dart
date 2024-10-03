import '../../../../utilities/constants/app_text_styles.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PriceLabel extends StatelessWidget {
  const PriceLabel({super.key, required this.price});

  final String price;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '\$$price',
          style: AppTextStyles.poppinsS22W600White,
        ),
        13.horizontalSpace,
        Text(
          AppLocalizations.of(context)!.per,
          style: AppTextStyles.poppinsS12W400White,
        ),
      ],
    );
  }
}
