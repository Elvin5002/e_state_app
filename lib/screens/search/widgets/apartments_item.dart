import 'package:e_state_app/data/local/apartments_model.dart';
import 'package:e_state_app/utilities/constants/app_colors.dart';
import 'package:e_state_app/utilities/constants/app_text_styles.dart';
import 'package:e_state_app/utilities/extensions/context_extension.dart';
import 'package:e_state_app/utilities/extensions/sizedbox_extension.dart';
import 'package:flutter/material.dart';

class ApartmentsItem extends StatelessWidget {
  const ApartmentsItem({super.key, required this.apartmentsModel});
  final ApartmentsModel apartmentsModel;
  @override
  Widget build(BuildContext context) {
    return Container(
        clipBehavior: Clip.hardEdge,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30))),
        margin: const EdgeInsets.only(right: 15),
        child: Stack(children: [
          Image.asset(apartmentsModel.image),
          Positioned(left: 15,bottom: context.fullHeight * 0.04,child: Text(apartmentsModel.name,style: AppTextStyles.poppinsS18W500White,)),
          Positioned(left: 15,bottom: context.fullHeight * 0.01,child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(Icons.location_on_outlined,color: AppColors.white,),
              5.w,
              Text(apartmentsModel.location,style: AppTextStyles.poppinsS12W400White,)
            ],
          ),)
        ]));
  }
}
