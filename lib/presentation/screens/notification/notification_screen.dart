import 'package:e_state_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widget/recent_view.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification'),
        centerTitle: true,
      ),
      body: DefaultTabController(
        length: 3,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 47.h,
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Theme.of(context).canvasColor,
                    borderRadius: BorderRadius.circular(10)),
                child: TabBar(
                  tabs: [
                    Tab(text: 'Recent'),
                    Tab(text: 'Old'),
                    Tab(text: 'Marked')
                  ],
                  indicator: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor, // Color of the selected tab
                    borderRadius: BorderRadius.circular(10), // Rounded corners for the indicator
                  ),
                  indicatorSize: TabBarIndicatorSize.tab, // Ensures the indicator covers the full tab
                  labelColor:Colors.white, // Color for the text in the active tab
                  unselectedLabelColor: Colors.grey, // Color for inactive tabs
                  indicatorColor: Colors.transparent,
                  dividerColor: Colors.transparent, // Hide the default indicator
                ),
              ),
              20.verticalSpace,
              Expanded(
                child: TabBarView(
                    children: [RecentView(), Text('old'), Text('marked')]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
