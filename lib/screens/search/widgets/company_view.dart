import 'package:e_state_app/data/local/companys_model.dart';
import 'package:e_state_app/screens/search/widgets/company_item.dart';
import 'package:e_state_app/utilities/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class CompanyView extends StatelessWidget {

  const CompanyView({ super.key });

   @override
   Widget build(BuildContext context) {
    const items = CompanysModel.companys;
       return SizedBox(
        height: context.fullHeight * 0.16,
        width: context.fullWidth - context.fullWidth * 0.07,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: items.length,
          itemBuilder: (_,i){
          return CompanyItem(companysModel: items[i]);
        }),
       );
  }
}