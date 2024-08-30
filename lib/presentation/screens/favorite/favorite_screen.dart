import 'package:e_state_app/cubits/favorite/favorite_cubit.dart';
import '../../../utilities/extensions/navigation_extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../widgets/property_card.dart';
import '../../../utilities/constants/app_text_styles.dart';
import '../../../utilities/constants/app_texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../property overview/property_screen.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<FavoriteCubit>();
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 30, right: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            AppTexts.saved,
            style: AppTextStyles.poppinsS18W500Black,
          ),
          28.verticalSpace,
          BlocBuilder<FavoriteCubit, FavoriteState>(
            /*if (state is HomeFailure) {}*/
            builder: (context, state) {
              if (state is FavoriteLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is FavoriteSuccess) {
                final properties = state.properties;
                return Expanded(
                  child: ListView.builder(
                    itemCount: properties.length,
                    itemBuilder: (context, i) {
                      final isSaved = cubit.isPropertySaved(properties[i]);
                      return PropertyCard(
                        title: properties[i].title,
                        location: properties[i].city,
                        price: properties[i].price,
                        imageUrl: properties[i].images[0],
                        onTap: () =>
                            context.to(PropertyScreen(property: properties[i])),
                        saveProperty: () {},
                        isSaved: isSaved,
                        deleteProperty: () => cubit.deleteProperty(properties[i]),
                      );
                    },
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          )
        ],
      ),
    );
  }
}
