import '../../../cubits/signup/signup_cubit.dart';
import '../../widgets/custom_text_button.dart';
import '../../widgets/loading_button.dart';
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
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utilities/helpers/snacks.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

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
                  TopView(
                    title: AppLocalizations.of(context)!.letsSign,
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
                                  text: AppLocalizations.of(context)!.google,
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
                                text: AppLocalizations.of(context)!.facebook,
                                widget: SvgPicture.asset(AppAssets.facebook),
                                onTap: () => cubit.signInWithFacebook(),
                              );
                            },
                          )),
                    ],
                  ),
                  30.verticalSpace,
                  CustomInput(
                    hintText: AppLocalizations.of(context)!.email,
                    controller: cubit.emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return AppLocalizations.of(context)!.emailEmpty;
                      } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                        return AppLocalizations.of(context)!.errorEmail;
                      }
                      return null;
                    },
                  ),
                  20.verticalSpace,
                  CustomInput(
                    obscureText: true,
                    hintText: AppLocalizations.of(context)!.password,
                    controller: cubit.passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return AppLocalizations.of(context)!.passwordEmpty;
                      } else if (value.length < 6) {
                        return AppLocalizations.of(context)!.passwordShort;
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
                      final isLoading = state is SignupLoading;
                      return LoadingButton(
                        onTap: () {
                          if (formKey.currentState?.validate() ?? false) {
                            cubit.signUp();
                          }
                        },
                        text: AppLocalizations.of(context)!.signUp,
                        isLoading: isLoading
                      );
                    },
                  ),
                  36.verticalSpace,
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.dontAcc,
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                        5.horizontalSpace,
                        CustomTextButton(
                          text: AppLocalizations.of(context)!.signIn,
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
