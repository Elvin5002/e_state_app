import 'package:e_state_app/utilities/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../cubits/filter/filter_cubit.dart';
import '../../../../utilities/constants/app_colors.dart';
import '../../../../utilities/constants/app_texts.dart';
import '../../../widgets/custom_button.dart';

class AreaButtons extends StatelessWidget {
  const AreaButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<FilterCubit>();
    return StreamBuilder(
        stream: cubit.isSelect.stream,
        builder: (context, snapshot) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            child: Row(
              children: [
                Expanded(
                    flex: 1,
                    child: CustomButton(
                      onTap: () => cubit.isSelect.value = true,
                      width: context.fullWidth,
                      text: AppTexts.near,
                      color: cubit.isSelect.value
                          ? AppColors.blue
                          : AppColors.white,
                      borderColor: cubit.isSelect.value
                          ? AppColors.transparent
                          : AppColors.blue,
                      textColor: cubit.isSelect.value
                          ? AppColors.white
                          : AppColors.blue,
                    )),
                19.horizontalSpace,
                Expanded(
                    flex: 1,
                    child: CustomButton(
                      onTap: () => cubit.isSelect.value = false,
                      width: context.fullWidth,
                      text: AppTexts.outside,
                      color: cubit.isSelect.value
                          ? AppColors.white
                          : AppColors.blue,
                      borderColor: cubit.isSelect.value
                          ? AppColors.blue
                          : AppColors.transparent,
                      textColor: cubit.isSelect.value
                          ? AppColors.blue
                          : AppColors.white,
                    )),
              ],
            ),
          );
        });
  }
}
