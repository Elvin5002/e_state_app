import 'package:e_state_app/data/local/companys_model.dart';
import 'package:e_state_app/utilities/constants/app_colors.dart';
import 'package:e_state_app/utilities/constants/app_text_styles.dart';
import 'package:e_state_app/utilities/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CompanyItem extends StatelessWidget {

  const CompanyItem({ super.key, required this.companysModel });
  final CompanysModel companysModel;
   @override
   Widget build(BuildContext context) {
       return Container(
        width: context.fullWidth * 0.3,
        height: context.fullHeight * 0.16,
        margin: const EdgeInsets.only(right: 15),
        decoration: const BoxDecoration(color: AppColors.white,borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(companysModel.image),
              Text(companysModel.name,style: AppTextStyles.poppinsS14W500Black,),
              Text(companysModel.work,style: AppTextStyles.poppinsS12W400Black,)
            ],
          ),
        ),
       );
  }
}