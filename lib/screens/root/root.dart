import 'package:e_state_app/cubits/home/home_cubit.dart';
import 'package:e_state_app/screens/filter/widgets/view1.dart';
import 'package:e_state_app/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/bottom_nav_bar.dart';

class Root extends StatelessWidget {
 Root({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    final cubit = context.read<HomeCubit>();
    return SafeArea(
      child: Scaffold(
        body:StreamBuilder<int>(
          initialData: 0,
          stream: cubit.viewSubject.stream,
          builder: (context, snapshot) => views[snapshot.data!]),
          bottomNavigationBar: const BottomNavBar(),
      ),
    );
  }

  final List<Widget> views = [
    HomeScreen(),
    Page2(),
    Page3(),
    Page4(),
    Page5(),
    Page6(),
  ];
}