import '../add%20property/add_property.dart';
import '../../../cubits/home/home_cubit.dart';
import '../filter/widgets/view1.dart';
import '../home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../utilities/constants/app_colors.dart';
import '../../widgets/bottom_nav_bar.dart';

class Root extends StatelessWidget {
  Root({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.bg,
        body: StreamBuilder<int>(
            initialData: 0,
            stream: cubit.viewSubject.stream,
            builder: (context, snapshot) => views[snapshot.data!]),
        bottomNavigationBar: const BottomNavBar(),
      ),
    );
  }

  final views = <Widget>[
    const HomeScreen(),
    AddProperty(),
    Page3(),
    Page4(),
    Page5(),
    Page6(),
  ];
}
