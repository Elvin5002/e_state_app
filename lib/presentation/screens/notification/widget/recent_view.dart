import 'package:e_state_app/presentation/screens/notification/widget/notification_item.dart';
import 'package:e_state_app/utilities/constants/app_assets.dart';
import 'package:e_state_app/utilities/constants/app_colors.dart';
import 'package:flutter/material.dart';

class RecentView extends StatelessWidget {

  const RecentView({ super.key });

   @override
   Widget build(BuildContext context) {
       return Expanded(
         child: ListView(
          children: [
            NotificationItem(color: Colors.transparent, title: 'Offer', content: 'Claim your 50% Off', svg: AppAssets.offer)
          ],
         ),
       );
  }
}