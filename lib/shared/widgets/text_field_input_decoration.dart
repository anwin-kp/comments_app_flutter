import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/colors.dart';
import '../constants/constants.dart';
import '../helper/common_text_styles.dart';

// This class serves as the Decoration for CustomTextField widget.
class CustomTextFieldInputDecoration extends InputDecoration {
  final String textFieldHintText;
  final bool isPassword;
  final bool obscureText;
  final bool isValid;

  final int? maxLength;
  final Function() togglePasswordVisibility;

  CustomTextFieldInputDecoration({
    required this.textFieldHintText,
    this.isPassword = false,
    this.obscureText = false,
    this.isValid = false,
    this.maxLength,
    required this.togglePasswordVisibility,
  }) : super(
          isDense: true,
          counterText: "",
          filled: false,
          isCollapsed: true,
          border: InputBorder.none,
          fillColor: kColorWhite,
          hintMaxLines: 1,
          hintText: textFieldHintText,
          contentPadding: EdgeInsets.symmetric(horizontal: 2.w),
          hintStyle: CommonTextStyles.hintTextStyleW300,
          errorStyle: Constants.errorTextStyle,
          focusedBorder: Constants.focusedInputBorder,
          enabledBorder: Constants.enabledInputBorder,
          errorBorder: Constants.errorInputBorder,
          focusedErrorBorder: Constants.errorInputBorder,
          suffixIconConstraints: const BoxConstraints(),
          suffixIcon: isPassword
              ? IconButton(
                  padding: EdgeInsets.zero,
                  splashRadius: 1,
                  constraints: BoxConstraints.tight(Size.fromRadius(10.r)),
                  icon: Icon(
                    obscureText ? Icons.visibility : Icons.visibility_off,
                    size: 18.sp,
                    color: Colors.black,
                  ),
                  onPressed: togglePasswordVisibility,
                )
              : isValid
                  ? Icon(
                      Icons.check_circle,
                      size: 15.sp,
                      color: Colors.black,
                    )
                  : null,
        );
}
