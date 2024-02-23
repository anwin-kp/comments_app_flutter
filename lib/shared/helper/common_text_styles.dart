import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/colors.dart';
import '../constants/constants.dart';

//This class contains the common TextStyles
class CommonTextStyles {
  static TextStyle textStyleW500 = TextStyle(
    color: Colors.black,
    fontSize: 12.sp,
    fontFamily: Constants.fontFamilyText,
    fontWeight: FontWeight.w500,
  );
  static TextStyle hintTextStyleW300 = TextStyle(
    color: kHintTextGreyColor,
    fontFamily: Constants.fontFamilyText,
    fontSize: 14.sp,
    fontWeight: FontWeight.w300,
  );
  static TextStyle settingsEditFieldHintTextStyle = TextStyle(
    color: kHintTextGreyColor,
    fontFamily: Constants.fontFamilyText,
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
  );
  static TextStyle hintTextStyleW400Font12 = TextStyle(
    color: kHintTextGreyColor,
    fontFamily: Constants.fontFamilyText,
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
  );
  static TextStyle unselectedLabelTextStyle = const TextStyle(
    color: Colors.grey,
    fontWeight: FontWeight.normal,
  );
  static TextStyle camperNormalTextStyle = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: kColorBlack,
  );
  static TextStyle textSpan400TextStyle = TextStyle(
    fontSize: 14.sp,
    fontFamily: Constants.fontFamilyText,
    color: Colors.black,
    fontWeight: FontWeight.w400,
  );
  static TextStyle errorMessageTextStyle = TextStyle(
    fontSize: 14.sp,
    fontFamily: Constants.fontFamilyText,
    color: kColorWhite,
    fontWeight: FontWeight.w600,
  );
  static TextStyle emailErrorMessageTextStyle = TextStyle(
    fontSize: 14.sp,
    fontFamily: Constants.fontFamilyText,
    color: kColorRed,
    fontWeight: FontWeight.w500,
  );
  static TextStyle textSpan600TextStyle = TextStyle(
    fontSize: 14.sp,
    fontFamily: Constants.fontFamilyText,
    color: kBlueButtonColor,
    fontWeight: FontWeight.w600,
  );
  static TextStyle commonButtonLabelTextStyle(double fontSize, Color color) {
    return TextStyle(
      fontSize: fontSize.sp,
      fontFamily: Constants.fontFamilyText,
      color: color,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle bulletTextStyle = const TextStyle(
      fontFamily: 'Roboto-Regular',
      fontSize: 16,
      color: kColorWhite,
      fontWeight: FontWeight.w400);

  //Button Styles
  static ButtonStyle kCommonCancelButtonStyle = ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(kColorRed),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(18.0), // replace with your desired radius
      ),
    ),
  );
  static ButtonStyle kCommonOKButtonStyle = ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(kBlueButtonColor),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(18.0), // replace with your desired radius
      ),
    ),
  );
}
