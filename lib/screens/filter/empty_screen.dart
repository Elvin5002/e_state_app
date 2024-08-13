import 'package:e_state_app/cubits/home/home_cubit.dart';
import 'package:e_state_app/screens/filter/widgets/view1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/bottom_nav_bar.dart';

class EmptyScreen extends StatelessWidget {
 EmptyScreen({ Key? key }) : super(key: key);

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
        // floatingActionButton: const BottomNavBar(),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }

  final List<Widget> views = [
    View1(),
    Page2(),
    Page3(),
    Page4(),
    Page5(),
    Page6(),
  ];
}