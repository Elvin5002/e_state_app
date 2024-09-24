import 'widgets/message_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utilities/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'widgets/search_view.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: context.fullWidth * .08),
      children: [
        SearchView(
          onTap: () {},
          img: 'https://firebasestorage.googleapis.com/v0/b/e-state-8291e.appspot.com/o/images%2FhrFBgCmjaQOX0853IOP1ArxxIba2%2F33.jpg?alt=media&token=ff483388-a00d-4251-a7d9-5b19e67c63a1',
        ),
        22.verticalSpace,
        ListView.builder(
          primary: false,
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: (context, index) {
            return MessageItem(
              img: 'https://firebasestorage.googleapis.com/v0/b/e-state-8291e.appspot.com/o/images%2FhrFBgCmjaQOX0853IOP1ArxxIba2%2F33.jpg?alt=media&token=ff483388-a00d-4251-a7d9-5b19e67c63a1',
              name: 'Thomas Fiedler', 
              time: '12:03 PM', 
              message: 'Okay, take care dear', 
              isOnline: true, 
              onTap: (){}
            );
          },
        )
      ],
    );
  }
}
