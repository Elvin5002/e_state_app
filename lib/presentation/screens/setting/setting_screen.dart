import 'package:e_state_app/cubits/user/user_info_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utilities/extensions/navigation_extension.dart';
import '../../../utilities/helpers/pager.dart';
import 'widget/setting_icon.dart';
import '../../../utilities/constants/app_assets.dart';
import '../../../utilities/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<UserInfoCubit>();
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              AppLocalizations.of(context)!.setting,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          28.verticalSpace,
          Text(
            AppLocalizations.of(context)!.basicInfo,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          20.verticalSpace,
          SettingIcon(
            svgPath: AppAssets.person,
            text: AppLocalizations.of(context)!.pProfil,
            backgroundColor: AppColors.lorange,
            onTap: () {},
          ),
          SettingIcon(
            svgPath: AppAssets.lock,
            text: AppLocalizations.of(context)!.changePass,
            backgroundColor: AppColors.lgreen,
            onTap: () {},
          ),
          45.verticalSpace,
          Text(
            AppLocalizations.of(context)!.others,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          20.verticalSpace,
          SettingIcon(
              svgPath: AppAssets.privacy,
              text: AppLocalizations.of(context)!.privacePolicy,
              backgroundColor: AppColors.lightRed,
              onTap: () => context.to(Pager.privacyPolicy)),
          SettingIcon(
            svgPath: AppAssets.data,
            text: AppLocalizations.of(context)!.dataSaver,
            backgroundColor: AppColors.lightBlue,
            onTap: () {},
          ),
          SettingIcon(
            svgPath: AppAssets.star,
            text: AppLocalizations.of(context)!.rateUs,
            backgroundColor: AppColors.lorange,
            onTap: () {},
          ),
          SettingIcon(
            svgPath: AppAssets.terms,
            text: AppLocalizations.of(context)!.termsUse,
            backgroundColor: AppColors.lightRed,
            onTap: () {},
          ),
          SettingIcon(
              svgPath: AppAssets.phone,
              text: AppLocalizations.of(context)!.contactUs,
              backgroundColor: AppColors.lgreen,
              onTap: () => context.to(Pager.contact)),
          BlocListener<UserInfoCubit, UserInfoState>(
            listener: (context, state) {
              if(state is UserInfoSuccess){
                context.to(Pager.login);
              }
            },
            child: SettingIcon(
              svgPath: AppAssets.logout,
              text: AppLocalizations.of(context)!.logOut,
              backgroundColor: AppColors.lgreen,
              onTap: () => cubit.logOut(),
            ),
          ),
        ],
      ),
    );
  }
}
