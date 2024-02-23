import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../viewmodels/custom_text_field_view_model.dart';
import '../constants/colors.dart';
import 'custom_text_types.dart';
import 'text_field_input_decoration.dart';

//This class is a custom TextFormField Widget.
class CommonTextFormField extends StatelessWidget {
  final String? titleText;
  final bool isTitleTextVisible;
  final String hintText;
  final double topPadding;
  final double leftAndRightPadding;
  final Function(String)? onFieldSubmitted;
  final FormFieldValidator<String?>? validator;
  final TextEditingController? controller;
  final TextInputType textInputType;
  final bool isPassword;
  final bool? off;
  final int? maxLength;

  const CommonTextFormField({
    Key? key,
    required this.hintText,
    this.onFieldSubmitted,
    this.controller,
    this.validator,
    required this.textInputType,
    this.isPassword = false,
    this.off = true,
    this.titleText,
    required this.topPadding,
    required this.leftAndRightPadding,
    this.maxLength,
    required this.isTitleTextVisible,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TextFieldProvider(),
      child: Consumer<TextFieldProvider>(
        builder: (context, textFieldState, child) {
          return Padding(
            padding: EdgeInsets.only(
                left: leftAndRightPadding.w,
                right: leftAndRightPadding.w,
                top: topPadding.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                isTitleTextVisible
                    ? Padding(
                        padding: EdgeInsets.symmetric(horizontal: 2.0.w),
                        child: TextBold(
                          text: titleText!,
                          fontSize: 16.sp,
                          isUnderLine: false,
                          textColor: kColorBlack,
                        ),
                      )
                    : const SizedBox(
                        height: 0,
                        width: 0,
                      ),
                SizedBox(
                  height: 4.h,
                ),
                Container(
                  margin: EdgeInsets.zero,
                  padding: EdgeInsets.zero,
                  child: TextFormField(
                    maxLength: maxLength,
                    enableSuggestions: true,
                    enableInteractiveSelection: true,
                    controller: controller,
                    keyboardType: textInputType,
                    obscureText:
                        isPassword ? textFieldState.obscureText : false,
                    enabled: off,
                    textInputAction: TextInputAction.next,
                    onChanged: (value) {
                      textFieldState.validateField(validator, value);
                    },
                    onFieldSubmitted: (value) => onFieldSubmitted != null
                        ? onFieldSubmitted!(value)
                        : () {},
                    validator: (value) =>
                        validator != null ? validator!(value) : null,
                    decoration: CustomTextFieldInputDecoration(
                      textFieldHintText: hintText,
                      isPassword: isPassword,
                      obscureText: textFieldState.obscureText,
                      isValid: textFieldState.isValid,
                      maxLength: maxLength,
                      togglePasswordVisibility:
                          textFieldState.togglePasswordVisibility,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
