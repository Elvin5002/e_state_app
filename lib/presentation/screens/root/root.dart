import '../search/search_screen.dart';
import '../messages/messages_screen.dart';
import '../favorite/favorite_screen.dart';
import '../setting/setting_screen.dart';
import '../add%20property/add_property.dart';
import '../../../cubits/home/home_cubit.dart';
import '../home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../widgets/bottom_nav_bar.dart';

class Root extends StatelessWidget {
  Root({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();
    return SafeArea(
      child: Scaffold(
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
    const SearchScreen(),
    AddProperty(),
    const FavoriteScreen(),
    const MessagesScreen(),
    SettingScreen(),
  ];
}
