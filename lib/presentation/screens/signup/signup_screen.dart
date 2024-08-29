import '../../../cubits/signup/signup_cubit.dart';
import '../../../utilities/constants/app_text_styles.dart';
import '../../widgets/custom_text_button.dart';
import '../../widgets/top_view.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_input.dart';
import '../../../utilities/constants/app_colors.dart';
import '../../../utilities/extensions/context_extension.dart';
import '../../../utilities/extensions/navigation_extension.dart';
import '../../../utilities/helpers/pager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../utilities/constants/app_assets.dart';
import '../../../utilities/constants/app_texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utilities/helpers/snacks.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignupCubit>();
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 33),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TopView(
                    title: AppTexts.letsLogin,
                  ),
                  40.verticalSpace,
                  Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: BlocConsumer<SignupCubit, SignupState>(
                            listener: (context, state) {
                              if (state is SignupSuccess) {
                                context.removeAll(Pager.root);
                              } else if (state is SignupFailure) {
                                Snacks.error(context, state.errorMessage);
                              }
                            },
                            builder: (context, state) {
                              return CustomButton(
                                  width: context.fullWidth,
                                  color: AppColors.red,
                                  widget: SvgPicture.asset(AppAssets.google),
                                  text: AppTexts.google,
                                  onTap: () => cubit.signInWithGoogle(),
                                );
                            },
                          )),
                      19.horizontalSpace,
                      Expanded(
                          flex: 1,
                          child: BlocConsumer<SignupCubit,SignupState>(
                            listener: (context, state) {
                              if (state is SignupSuccess) {
                                context.removeAll(Pager.root);
                              } else if (state is SignupFailure) {
                                Snacks.error(context, state.errorMessage);
                              }
                            },
                            builder: (context, state) {
                              return CustomButton(
                                width: context.fullWidth,
                                color: AppColors.blue,
                                text: AppTexts.facebook,
                                widget: SvgPicture.asset(AppAssets.facebook),
                                onTap: () => cubit.signInWithFacebook(),
                              );
                            },
                          )),
                    ],
                  ),
                  30.verticalSpace,
                  CustomInput(
                    hintText: AppTexts.email,
                    controller: cubit.emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email cannot be empty';
                      } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                        return 'Enter a valid email';
                      }
                      return null;
                    },
                  ),
                  20.verticalSpace,
                  CustomInput(
                    obscureText: true,
                    hintText: AppTexts.password,
                    controller: cubit.passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password cannot be empty';
                      } else if (value.length < 6) {
                        return 'Password must be at least 6 characters long';
                      }
                      return null;
                    },
                  ),
                  30.verticalSpace,
                  BlocConsumer<SignupCubit, SignupState>(
                    listener: (context, state) {
                      if (state is SignupSuccess) {
                        context.removeAll(Pager.fillProfile);
                      } else if (state is SignupFailure) {
                        Snacks.error(context, state.errorMessage);
                      }
                    },
                    builder: (context, state) {
                      return CustomButton(
                          onTap: () {
                            if (formKey.currentState?.validate() ?? false) {
                              cubit.signUp();
                            }
                          },
                          width: context.fullWidth,
                          color: AppColors.primary,
                          text: AppTexts.signUp);
                    },
                  ),
                  36.verticalSpace,
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppTexts.dontAcc,
                          style: AppTextStyles.poppinsS14W400Black,
                        ),
                        5.horizontalSpace,
                        CustomTextButton(
                          text: AppTexts.signIn, 
                          onPressed: () => context.replace(Pager.login)
                        )
                      ],
                    ),
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
