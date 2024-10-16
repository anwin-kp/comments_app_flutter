import 'package:firebase_complete_demo_app/shared/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/colors.dart';

//This class contains the common TextStyles
class CommonTextStyles {
  CommonTextStyles._();

  static TextStyle textStyleW500 = TextStyle(
    color: Colors.black,
    fontFamily: Constants.fontFamilyName,
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
  );
  static TextStyle hintTextStyleW300 = TextStyle(
    color: AppColors.kHintTextGreyColor,
    fontFamily: Constants.fontFamilyName,
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
  );
  static TextStyle textInputLabelStyleW500 = TextStyle(
    color: AppColors.kColorLightBlue,
    fontFamily: Constants.fontFamilyName,
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
  );

  //Button Styles
  static ButtonStyle kCommonCancelButtonStyle = ButtonStyle(
    backgroundColor: WidgetStateProperty.all<Color>(AppColors.kColorRed),
    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(18.0), // replace with your desired radius
      ),
    ),
  );
  static ButtonStyle kCommonOKButtonStyle = ButtonStyle(
    backgroundColor:
        WidgetStateProperty.all<Color>(AppColors.kBlueButtonColor),
    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(18.0), // replace with your desired radius
      ),
    ),
  );
}
