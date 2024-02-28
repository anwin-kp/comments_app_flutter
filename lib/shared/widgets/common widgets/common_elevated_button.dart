import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/colors.dart';
import 'common_text_types.dart';

class CommonButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;

  const CommonButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = AppColors.kLiteBlueColor,
    this.textColor = AppColors.kColorWhite,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: backgroundColor,
        minimumSize: Size(double.infinity, 35.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: onPressed,
      child: TextMedium(
        text: text,
        textColor: textColor,
        fontSize: 18.sp,
        isUnderLine: false,
        wantOverFlowEllipsis: false,
      ),
    );
  }
}
