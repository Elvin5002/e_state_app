import 'package:e_state_app/data/local/comments_model.dart';
import 'package:e_state_app/utilities/constants/app_text_styles.dart';
import 'package:e_state_app/utilities/extensions/context_extension.dart';
import 'package:e_state_app/utilities/extensions/sizedbox_extension.dart';
import 'package:flutter/material.dart';

import '../../../../utilities/constants/app_colors.dart';

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
          color: AppColors.white, borderRadius: BorderRadius.circular(15)),
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
                    style: AppTextStyles.poppinsS14W500Black,
                  ),
                  Text(
                    comment.work,
                    style: AppTextStyles.poppinsS12W400Black,
                  )
                ],
              )
            ],
          ),
          15.h,
          Text(
            comment.comment,
            style: AppTextStyles.poppinsS12W400Black,
          ),
        ],
      ),
    );
  }
}
