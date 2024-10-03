import '../../widgets/loading_button.dart';
import '../../widgets/custom_text_button.dart';
import '../../../cubits/login/login_cubit.dart';
import '../../widgets/top_view.dart';
import '../../../utilities/extensions/navigation_extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utilities/helpers/pager.dart';
import '../../../utilities/helpers/snacks.dart';
import '../../widgets/custom_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();
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
                  TopView(title: AppLocalizations.of(context)!.letsLogin,),
                  40.verticalSpace,
                  CustomInput(
                    controller: cubit.emailController,
                    obscureText: false,
                    hintText: AppLocalizations.of(context)!.email,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return AppLocalizations.of(context)!.emailEmpty;
                      } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                          .hasMatch(value)) {
                        return AppLocalizations.of(context)!.errorEmail;
                      }
                      return null;
                    },
                  ),
                  20.verticalSpace,
                  CustomInput(
                    controller: cubit.passwordController,
                    obscureText: true,
                    hintText: AppLocalizations.of(context)!.password,
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
                  BlocConsumer<LoginCubit, LoginState>(
                    listener: (context, state) {
                      if (state is LoginSuccess) {
                        context.removeAll(Pager.root);
                      } else if (state is LoginFailure) {
                        Snacks.error(context, state.error);
                      }
                    },
                    builder: (context, state) {
                      final isLoading = state is LoginLoading;
                      return LoadingButton(
                        onTap: () {
                          if (formKey.currentState?.validate() ?? false) {
                            cubit.login();
                          }
                        },
                        text: AppLocalizations.of(context)!.login, 
                        isLoading: isLoading
                      );
                    },
                  ),
                  20.verticalSpace,
                  Center(
                    child: CustomTextButton(
                      text: AppLocalizations.of(context)!.forgotPassword,
                      onPressed: () => context.replace(Pager.signup),
                    ),
                  ),
                  50.verticalSpace,
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
                            text: AppLocalizations.of(context)!.signUp,
                            onPressed: () => context.replace(Pager.signup))
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
