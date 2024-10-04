import '../../../../utilities/constants/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RangeSliderView extends StatefulWidget {
  const RangeSliderView({Key? key}) : super(key: key);

  @override
  State<RangeSliderView> createState() => _RangeSliderViewState();
}

class _RangeSliderViewState extends State<RangeSliderView> {
  @override
  Widget build(BuildContext context) {
    RangeValues _currentRangeValues = const RangeValues(500, 10000);
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalizations.of(context)!.range,
                style: AppTextStyles.poppinsS16W500Black,
              ),
              Text(
                '\$${_currentRangeValues.start.round()} - \$${_currentRangeValues.end.round()}',
                style: AppTextStyles.poppinsS12W400Blue,
              ),
            ],
          ),
          30.verticalSpace,
          RangeSlider(
            values: _currentRangeValues,
            min: 500,
            max: 10000,
            divisions: 100,
            activeColor: Colors.blue,
            inactiveColor: Colors.blue.withOpacity(0.3),
            labels: RangeLabels(
              '\$${_currentRangeValues.start.round()}',
              '\$${_currentRangeValues.end.round()}',
            ),
            onChanged: (RangeValues values) {
              setState(() {
                _currentRangeValues = values;
              });
            },
          ),
        ],
      ),
    );
  }
}
