import 'package:e_state_app/data/local/comments_model.dart';
import 'package:e_state_app/utilities/extensions/context_extension.dart';
import 'package:e_state_app/utilities/extensions/sizedbox_extension.dart';
import 'package:flutter/material.dart';

class Comments extends StatelessWidget {
  const Comments({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final comment = CommentsModel.comments[0];
    return Container(
      width: context.fullWidth * 0.84,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor, borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(comment.image),
              15.w,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    comment.fullName,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    comment.work,
                    style: Theme.of(context).textTheme.labelMedium,
                  )
                ],
              )
            ],
          ),
          15.h,
          Text(
            comment.comment,
            style: Theme.of(context).textTheme.labelMedium,
          ),
        ],
      ),
    );
  }
}
