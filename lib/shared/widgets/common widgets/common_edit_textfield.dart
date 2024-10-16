import 'package:firebase_complete_demo_app/shared/helper/common_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/constants.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final bool isPassword;
  final FormFieldValidator<String?>? validator;
  final TextInputType textInputType;

  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.hintText,
    this.validator,
    required this.textInputType,
    this.isPassword = false,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool obscureText = false;

  @override
  void initState() {
    super.initState();
    obscureText = widget.isPassword;
  }

  void togglePasswordVisibility() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 4.h),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: widget.controller,
        validator: (value) =>
            widget.validator != null ? widget.validator!(value) : null,
        obscureText: obscureText,
        keyboardType: widget.textInputType,
        onChanged: (value) {
          if (widget.validator != null) {
            widget.validator!(value);
          }
        },
        decoration: InputDecoration(
          floatingLabelAlignment: FloatingLabelAlignment.start,
          isDense: false,
          alignLabelWithHint: true,
          labelText: widget.labelText,
          labelStyle: CommonTextStyles.textInputLabelStyleW500,
          counterText: "",
          filled: false,
          isCollapsed: false,
          hintText: widget.hintText,
          hintStyle: CommonTextStyles.hintTextStyleW300,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          errorStyle: Constants.errorTextStyle,
          errorMaxLines: 2,
          focusedBorder: Constants.focusedInputBorder,
          enabledBorder: Constants.enabledInputBorder,
          errorBorder: Constants.errorInputBorder,
          focusedErrorBorder: Constants.errorInputBorder,
          suffixIcon: widget.isPassword
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
              : null,
        ),
      ),
    );
  }
}
