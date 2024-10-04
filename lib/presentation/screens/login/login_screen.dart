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
    final localizations = AppLocalizations.of(context)!;
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
                    title: localizations.letsLogin,
                  ),
                  40.verticalSpace,
                  CustomInput(
                    controller: cubit.emailController,
                    obscureText: false,
                    hintText: localizations.email,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return localizations.emailEmpty;
                      } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                          .hasMatch(value)) {
                        return localizations.errorEmail;
                      }
                      return null;
                    },
                  ),
                  20.verticalSpace,
                  CustomInput(
                    controller: cubit.passwordController,
                    obscureText: true,
                    hintText: localizations.password,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return localizations.passwordEmpty;
                      } else if (value.length < 6) {
                        return localizations.passwordShort;
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
                          text: localizations.login,
                          isLoading: isLoading);
                    },
                  ),
                  20.verticalSpace,
                  Center(
                    child: CustomTextButton(
                      text: localizations.forgotPassword,
                      onPressed: () => context.replace(Pager.signup),
                    ),
                  ),
                  50.verticalSpace,
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          localizations.dontAcc,
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                        5.horizontalSpace,
                        CustomTextButton(
                            text: localizations.signUp,
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
