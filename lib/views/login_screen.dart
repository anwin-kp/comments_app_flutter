import 'package:firebase_complete_demo_app/shared/constants/colors.dart';
import 'package:firebase_complete_demo_app/viewmodels/custom_text_field_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../shared/constants/constants.dart';
import '../shared/helper/utility.dart';
import '../shared/widgets/common_edit_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final Utility _utility = Utility();

  @override
  Widget build(BuildContext context) {
    return Consumer<TextFieldProvider>(
      builder: (context, value, child) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          extendBody: true,
          extendBodyBehindAppBar: true,
          body: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextFormField(
                    controller: _emailController,
                    textInputType: TextInputType.emailAddress,
                    isPassword: false,
                    labelText: Constants.emailText,
                    hintText: Constants.enterYourEmailText,
                    validator: (value) {
                      return _utility.validateEmail(value!);
                    },
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  CustomTextFormField(
                    controller: _passwordController,
                    textInputType: TextInputType.text,
                    isPassword: true,
                    labelText: Constants.passwordText,
                    hintText: Constants.enterPasswordText,
                    validator: (value) {
                      return _utility.validatePassword(value!);
                    },
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: kLiteBlueColor,
                      minimumSize: Size(double.infinity, 35.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontFamily: Constants.fontFamilyText,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
