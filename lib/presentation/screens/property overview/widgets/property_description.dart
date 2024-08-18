import '../../../../utilities/constants/app_text_styles.dart';
import '../../../../utilities/constants/app_texts.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PropertyDescription extends StatelessWidget {
  const PropertyDescription({Key? key, required this.description}) : super(key: key);

  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppTexts.description,
          style: AppTextStyles.poppinsS16W500Black,
        ),
        8.verticalSpace,
        Text(
          description,
          style: AppTextStyles.poppinsS12W400DarkGrey,
        ),
      ],
    );
  }
}
