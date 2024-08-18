import '../../../../utilities/constants/app_text_styles.dart';
import '../../../../utilities/constants/app_texts.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PriceLabel extends StatelessWidget {
  const PriceLabel({Key? key, required this.price}) : super(key: key);

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
          AppTexts.per,
          style: AppTextStyles.poppinsS12W400White,
        ),
      ],
    );
  }
}
