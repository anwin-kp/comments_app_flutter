import 'package:firebase_complete_demo_app/shared/constants/colors.dart';
import 'package:firebase_complete_demo_app/shared/widgets/common%20widgets/common_text_types.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../models/comments_model.dart';
import '../constants/constants.dart';
import 'custom_rich_text.dart';

class CommentCard extends StatelessWidget {
  final CommentsModel comment;

  const CommentCard(this.comment, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: AppColors.kCustomLightBlueColor,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.r),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: AppColors.kColorAsh,
              child: TextBold(
                text: comment.email!.substring(0, 1).toUpperCase(),
                fontSize: 14,
                isUnderLine: false,
                textColor: AppColors.kColorBlack,
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomRichText(
                    label: Constants.nameText,
                    value: comment.name ?? Constants.nameNotAvailableText,
                  ),
                  const SizedBox(height: 4),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: CustomRichText(
                      label: Constants.emailText,
                      value: comment.email ?? Constants.emailNotAvailableText,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    comment.body ?? Constants.commentsText,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      fontSize: 12,
                      fontFamily: Constants.fontFamilyName,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
