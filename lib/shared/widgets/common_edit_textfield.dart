import 'package:firebase_complete_demo_app/shared/helper/common_text_styles.dart';
import 'package:firebase_complete_demo_app/viewmodels/custom_text_field_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../constants/constants.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final bool isPassword;
  final FormFieldValidator<String?>? validator;
  final TextInputType textInputType;

  const CustomTextFormField({
    Key? key,
    required this.controller,
    required this.labelText,
    required this.hintText,
    this.validator,
    required this.textInputType,
    this.isPassword = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TextFieldProvider>(
      builder: (context, textFieldState, child) {
        return Container(
          padding: EdgeInsets.only(top: 4.h),
          child: TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: controller,
            validator: (value) => validator != null ? validator!(value) : null,
            obscureText: isPassword ? textFieldState.obscureText : false,
            keyboardType: textInputType,
            onChanged: (value) {
              textFieldState.validateField(validator, value);
            },
            decoration: InputDecoration(
                floatingLabelAlignment: FloatingLabelAlignment.start,
                isDense: false,
                alignLabelWithHint: true,
                labelText: labelText,
                labelStyle: CommonTextStyles.textInputLabelStyleW500,
                counterText: "",
                filled: false,
                isCollapsed: false,
                hintText: hintText,
                hintStyle: CommonTextStyles.hintTextStyleW300,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                floatingLabelBehavior: FloatingLabelBehavior.auto,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                errorStyle: Constants.errorTextStyle,
                focusedBorder: Constants.focusedInputBorder,
                enabledBorder: Constants.enabledInputBorder,
                errorBorder: Constants.errorInputBorder,
                focusedErrorBorder: Constants.errorInputBorder,
                suffixIcon: isPassword
                    ? IconButton(
                        padding: EdgeInsets.zero,
                        splashRadius: 1,
                        constraints:
                            BoxConstraints.tight(Size.fromRadius(10.r)),
                        icon: Icon(
                          textFieldState.obscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                          size: 18.sp,
                          color: Colors.black,
                        ),
                        onPressed: textFieldState.togglePasswordVisibility,
                      )
                    : null),
          ),
        );
      },
    );
  }
}
