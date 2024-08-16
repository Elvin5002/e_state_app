import 'package:e_state_app/cubits/login/login_cubit.dart';
import 'package:e_state_app/screens/widgets/top_view.dart';
import '../../utilities/extensions/navigation_extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utilities/helpers/pager.dart';
import '../../utilities/helpers/snacks.dart';
import '../widgets/custom_input.dart';
import '../../utilities/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utilities/constants/app_colors.dart';
import '../../utilities/constants/app_texts.dart';
import '../widgets/custom_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

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
                  const TopView(title: AppTexts.letsSign),
                  40.verticalSpace,
                  CustomInput(
                    controller: cubit.emailController,
                    obscureText: false,
                    hintText: AppTexts.email,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email cannot be empty';
                      } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                          .hasMatch(value)) {
                        return 'Enter a valid email';
                      }
                      return null;
                    },
                  ),
                  20.verticalSpace,
                  CustomInput(
                    controller: cubit.passwordController,
                    obscureText: true,
                    hintText: AppTexts.password,
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
                  BlocConsumer<LoginCubit, LoginState>(
                    listener: (context, state) {
                      if (state is LoginSuccess) {
                        context.removeAll(Pager.root);
                      } else if (state is LoginFailure) {
                        Snacks.error(context, state.error);
                      }
                    },
                    builder: (context, state) {
                      return CustomButton(
                          onTap: () {
                            if (formKey.currentState?.validate() ?? false) {
                              cubit.login();
                            }
                          },
                          width: context.fullWidth,
                          color: AppColors.primary,
                          text: AppTexts.login);
                    },
                  ),
                  20.verticalSpace,
                  Center(
                    child: TextButton(
                        onPressed: () => context.replace(Pager.signup),
                        child: Text(
                          AppTexts.forgotPassword,
                          style: GoogleFonts.poppins(
                              color: AppColors.lightBlue, fontSize: 14),
                        )),
                  ),
                  50.verticalSpace,
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppTexts.dontAcc,
                          style: GoogleFonts.poppins(fontSize: 14),
                        ),
                        5.horizontalSpace,
                        TextButton(
                            onPressed: () => context.replace(Pager.signup),
                            child: Text(
                              AppTexts.signUp,
                              style: GoogleFonts.poppins(
                                  color: AppColors.lightBlue, fontSize: 14),
                            ))
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
