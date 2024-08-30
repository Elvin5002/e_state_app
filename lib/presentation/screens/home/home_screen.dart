import 'package:e_state_app/cubits/favorite/favorite_cubit.dart';
import 'package:e_state_app/cubits/home/home_cubit.dart';
import 'package:e_state_app/cubits/user/user_info_cubit.dart';
import '../property%20overview/property_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widget/category_icon.dart';
import '../../widgets/property_card.dart';
import '../../widgets/search_and_filter.dart';
import '../../../utilities/constants/app_text_styles.dart';
import '../../../utilities/constants/app_texts.dart';
import '../../../utilities/extensions/navigation_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'widget/profil_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();
    final userCubit = context.read<UserInfoCubit>();
    final favoriteCubit = context.read<FavoriteCubit>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: RefreshIndicator(
        onRefresh: () async => cubit..fetchProperties(),
        child: ListView(
          children: [
            StreamBuilder(
                stream: userCubit.userSubject.stream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ProfilBar(
                      fullName: snapshot.data!.fullName,
                      image: snapshot.data!.photo,
                    );
                  } else if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  }
                  return SizedBox.shrink();
                }),
            15.verticalSpace,
            SearchAndFilter(
              onTap: () {},
            ),
            15.verticalSpace,
            CategoryIcons(),
            15.verticalSpace,
            Row(
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    AppTexts.allProperties,
                    style: AppTextStyles.poppinsS20W500Black,
                  ),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    AppTexts.seeAll,
                    style: AppTextStyles.poppinsS14W500Black,
                  ),
                ),
              ],
            ),  
            10.verticalSpace,
            BlocBuilder<HomeCubit, HomeState>(
              /*if (state is HomeFailure) {}*/
              builder: (context, state) {
                if (state is HomeLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is HomeSuccess) {
                  final properties = state.properties;
                  return ListView.builder(
                    primary: false,
                    shrinkWrap: true,
                    itemCount: properties.length,
                    itemBuilder: (context, i) {
                      final isSaved = favoriteCubit.isPropertySaved(properties[i]);
                      return PropertyCard(
                        title: properties[i].title,
                        location: properties[i].city,
                        price: properties[i].price,
                        imageUrl: properties[i].images[0],
                        onTap: () =>
                            context.to(PropertyScreen(property: properties[i])),
                        saveProperty: () => favoriteCubit.saveProperty(properties[i]),
                        isSaved: isSaved,
                        deleteProperty: () =>
                            favoriteCubit.deleteProperty(properties[i]),
                      );
                    },
                  );
                }
                return const SizedBox.shrink();
              },
            )
          ],
        ),
      ),
    );
  }
}
