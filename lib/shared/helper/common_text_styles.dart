import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/colors.dart';

//This class contains the common TextStyles
class CommonTextStyles {
  CommonTextStyles._();

  static TextStyle textStyleW500 = GoogleFonts.roboto(
    color: Colors.black,
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
  );
  static TextStyle hintTextStyleW300 = GoogleFonts.roboto(
    color: AppColors.kHintTextGreyColor,
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
  );
  static TextStyle textInputLabelStyleW500 = GoogleFonts.roboto(
    color: AppColors.kColorLightBlue,
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
  );

  //Button Styles
  static ButtonStyle kCommonCancelButtonStyle = ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(AppColors.kColorRed),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(18.0), // replace with your desired radius
      ),
    ),
  );
  static ButtonStyle kCommonOKButtonStyle = ButtonStyle(
    backgroundColor:
        MaterialStateProperty.all<Color>(AppColors.kBlueButtonColor),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(18.0), // replace with your desired radius
      ),
    ),
  );
}
