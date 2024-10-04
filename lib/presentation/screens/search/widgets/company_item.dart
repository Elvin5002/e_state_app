import 'package:e_state_app/data/local/companys_model.dart';
import 'package:e_state_app/utilities/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CompanyItem extends StatelessWidget {

  const CompanyItem({ super.key, required this.companysModel });
  final CompanysModel companysModel;
   @override
   Widget build(BuildContext context) {
       return Padding(
         padding: const EdgeInsets.only(right: 10),
         child: Container(
          width: context.fullWidth * 0.3,
          height: context.fullHeight * 0.16,
          decoration: BoxDecoration(color: Theme.of(context).cardColor,borderRadius: const BorderRadius.all(Radius.circular(15))),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(companysModel.image),
                Text(companysModel.name,style: Theme.of(context).textTheme.bodyLarge,),
                Text(companysModel.work,style: Theme.of(context).textTheme.labelMedium,)
              ],
            ),
          ),
         ),
       );
  }
}