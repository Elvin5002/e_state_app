import 'dart:io';

import 'package:flutter_svg/svg.dart';

import '../../widgets/custom_input.dart';
import '../../../utilities/constants/app_assets.dart';
import '../../../utilities/constants/app_colors.dart';
import '../../../utilities/constants/app_texts.dart';
import '../../../utilities/extensions/context_extension.dart';
import '../../../utilities/extensions/navigation_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import '../../../cubits/user/user_info_cubit.dart';
import '../../../utilities/helpers/pager.dart';
import '../../../utilities/helpers/snacks.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/phone_num_input.dart';

class FillProfile extends StatelessWidget {
  const FillProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<UserInfoCubit>();
    final formKey = GlobalKey<FormState>();
    PhoneNumber phoneNumber = PhoneNumber(isoCode: 'AZ');

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SafeArea(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(AppAssets.pattern),
                  40.verticalSpace,
                  Center(
                    child: Stack(children: [
                      StreamBuilder<File?>(
                        stream: cubit.imageSubject.stream,
                        builder: (context, snapshot) => snapshot.data == null
                            ? Image.asset(
                                AppAssets.avatar,
                                height: 140.r,
                                width: 140.r,
                              )
                            : Image.file(
                                snapshot.data!,
                                height: 140.r,
                                width: 140.r,
                              ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: () => cubit.openGallery(),
                          child: const Icon(Icons.edit),
                        ),
                      ),
                    ]),
                  ),
                  15.verticalSpace,
                  CustomInput(
                    hintText: AppTexts.fullName,
                    controller: cubit.controllers["fullName"],
                    prefixIcon: const Icon(Icons.person),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Full name cannot be empty';
                      }
                      return null;
                    },
                  ),
                  15.verticalSpace,
                  CustomInput(
                    hintText: AppTexts.email,
                    controller: cubit.controllers["email"],
                    enabled: false,
                    prefixIcon: const Icon(Icons.email),
                  ),
                  15.verticalSpace,
                  PhoneNumInput(
                    initialValue: phoneNumber,
                    phoneController: cubit.controllers["phoneNumber"],
                    onInputChanged: (PhoneNumber number) {
                      phoneNumber = number;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Phone number cannot be empty';
                      }
                      return null;
                    },
                  ),
                  35.verticalSpace,
                  BlocConsumer<UserInfoCubit, UserInfoState>(
                    listener: (context, state) {
                      if (state is UserInfoSuccess) {
                        context.to(Pager.login);
                      } else if (state is UserInfoFailure) {
                        Snacks.error(context, state.errorMessage);
                      }
                    },
                    builder: (context, state) {
                      return CustomButton(
                        text: 'Continue',
                        onTap: () {
                          if (formKey.currentState?.validate() ?? false) {
                            cubit.updateUsers();
                          }
                        },
                        width: context.fullWidth,
                        color: AppColors.primary,
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
