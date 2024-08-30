import 'package:e_state_app/cubits/home/home_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      height: 101,
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
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Container(
                          width: 70,
                          height: 70,
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
                        const SizedBox(height: 5),
                        if (selectedIndex == index)
                          Container(
                            width: 10,
                            height: 10,
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
