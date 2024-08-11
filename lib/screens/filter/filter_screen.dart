import '../../cubits/filter/filter_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../utilities/extensions/context_extension.dart';
import '../../utilities/extensions/navigation_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utilities/constants/app_colors.dart';
import '../../utilities/constants/app_texts.dart';
import '../../utilities/helpers/pager.dart';
import '../widgets/custom_button.dart';
import 'widgets/filter_top_view.dart';

class FilterScreen extends StatefulWidget {
const FilterScreen({ Key? key }) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  RangeValues _currentRangeValues = RangeValues(500, 10000);

  @override
  Widget build(BuildContext context){
    final cubit = context.read<FilterCubit>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 33),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const FilterTopView(),
                40.verticalSpace,
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(AppTexts.range, style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500),),
                          Text(
                            '\$${_currentRangeValues.start.round()} - \$${_currentRangeValues.end.round()}',
                            style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.lightBlue),
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
                ),
                30.verticalSpace,
                Text(AppTexts.wantBuy, style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w500),),
                30.verticalSpace,
                StreamBuilder(
                  stream: cubit.isSelect.stream,
                  builder: (context, snapshot) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: CustomButton(
                              onTap: ()=> cubit.isSelect.value = true,
                              width: context.fullWidth,
                              text: AppTexts.near,
                              color: cubit.isSelect.value ? AppColors.blue: AppColors.white,
                              borderColor: cubit.isSelect.value? AppColors.transparent: AppColors.blue,
                              textColor: cubit.isSelect.value ? AppColors.white: AppColors.blue,)),
                          19.horizontalSpace,
                          Expanded(
                            flex: 1,
                            child: CustomButton(
                              onTap: ()=> cubit.isSelect.value = false,
                              width: context.fullWidth,
                              text: AppTexts.outside,
                              color: cubit.isSelect.value ? AppColors.white: AppColors.blue,
                              borderColor: cubit.isSelect.value? AppColors.blue: AppColors.transparent,
                              textColor: cubit.isSelect.value ? AppColors.blue: AppColors.white,)),
                        ],
                      ),
                    );
                  }
                ),
                40.verticalSpace,
                CustomButton(
                  onTap: ()=>context.replace(Pager.login),
                  width: context.fullWidth, 
                  color: AppColors.primary, 
                  text: AppTexts.properties
                ),
                20.verticalSpace,
                Center(
                  child: TextButton(
                    onPressed: ()=> context.replace(Pager.signup), 
                    child: Text(AppTexts.skip, style: GoogleFonts.poppins(color: AppColors.lightGreen, fontSize: 14),)
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}