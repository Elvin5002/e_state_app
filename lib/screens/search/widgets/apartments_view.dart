import 'package:e_state_app/data/local/apartments_model.dart';
import 'package:e_state_app/screens/search/widgets/apartments_item.dart';
import 'package:e_state_app/utilities/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class ApartmentsView extends StatelessWidget {

  const ApartmentsView({ super.key });

   @override
   Widget build(BuildContext context) {
    const items = ApartmentsModel.apartments;
       return SizedBox(
                width: context.fullWidth - context.fullWidth * 0.07,
                height: context.fullHeight * 0.23,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                    itemCount: items.length,
                    itemBuilder: (_, i) {
                      return ApartmentsItem(apartmentsModel: items[i]);
                    }),
              );
  }
}