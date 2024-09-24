import '../../../../cubits/home/home_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../utilities/constants/app_assets.dart';
import '../../../../utilities/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CategoryIcons extends StatelessWidget {
  CategoryIcons({super.key});

  final List icons = [
    AppAssets.all,
    AppAssets.building,
    AppAssets.land,
    AppAssets.house
  ];

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();
    return SizedBox(
      width: context.fullWidth,
      height: context.fullHeight * .12,
      child: StreamBuilder<int>(
          stream: cubit.selectedCategory.stream,
          builder: (context, snapshot) {
            int selectedIndex = snapshot.data ?? cubit.selectedCategory.value;
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: icons.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    cubit.selectedCategory.value = index;
                    cubit.fetchProperties();
                  },
                  child: Padding(
                    padding: EdgeInsets.only(right: context.fullWidth * .032, top: 5, bottom: 5, left: 3),
                    child: Column(
                      children: [
                        Container(
                          width: context.fullWidth * .186,
                          height: context.fullHeight * .086,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                              ),
                            ],
                          ),
                          child: Center(
                              child: SizedBox(
                                  width: 32,
                                  height: 32,
                                  child: SvgPicture.asset(icons[index]))),
                        ),
                        2.verticalSpace,
                        if (selectedIndex == index)
                          Container(
                            width: context.fullWidth * .026,
                            height: context.fullHeight * .012,
                            decoration: const BoxDecoration(
                              color: Colors.blue,
                              shape: BoxShape.circle,
                            ),
                          ),
                      ],
                    ),
                  ),
                );
              },
            );
          }),
    );
  }
}
