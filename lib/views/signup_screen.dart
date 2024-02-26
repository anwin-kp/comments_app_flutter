import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../shared/constants/colors.dart';
import '../shared/constants/constants.dart';
import '../shared/helper/app_images.dart';
import '../shared/helper/utility.dart';
import '../shared/widgets/common widgets/common_edit_textfield.dart';
import '../shared/widgets/common widgets/common_elevated_button.dart';
import '../shared/widgets/custom_divider_with_text.dart';
import '../shared/widgets/secondary_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final GlobalKey<FormState> _signupFormKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final Utility _utility = Utility();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
      resizeToAvoidBottomInset: true,
      extendBody: false,
      extendBodyBehindAppBar: false,
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: SafeArea(
            child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: 230.h,
            ),
            Padding(
              padding: EdgeInsets.all(10.0.r),
              child: Form(
                key: _signupFormKey,
                child: Column(
                  children: [
                    CustomTextFormField(
                      controller: _nameController,
                      textInputType: TextInputType.text,
                      isPassword: false,
                      labelText: Constants.nameText,
                      hintText: Constants.enterYourNameText,
                      validator: (value) {
                        return _utility.validateInput(value!);
                      },
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
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
                      textInputType: TextInputType.visiblePassword,
                      isPassword: true,
                      labelText: Constants.passwordText,
                      hintText: Constants.enterNewPasswordText,
                      validator: (value) {
                        return _utility.validatePassword(value!);
                      },
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    CustomTextFormField(
                      controller: _confirmPasswordController,
                      textInputType: TextInputType.visiblePassword,
                      isPassword: true,
                      labelText: Constants.confirmPasswordText,
                      hintText: Constants.confirmNewPasswordText,
                      validator: (value) {
                        return _utility.validatePassword(value!);
                      },
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    CommonButton(
                      text: Constants.signUpText,
                      onPressed: () {
                        if (_signupFormKey.currentState!.validate()) {}
                      },
                      backgroundColor: AppColors.kLiteBlueColor,
                      textColor: AppColors.kColorWhite,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.0.w),
                      child: const TextWithDivider(
                        textToShow: Constants.orSignUpWithText,
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 35.w),
                      child: SecondaryButton(
                          height: 50.h,
                          textColor: AppColors.kGrey600,
                          width: 220.w,
                          onTap: () {},
                          borderRadius: 24,
                          bgColor: AppColors.kBackground.withOpacity(0.3),
                          text: Constants.continueWithGoogleText,
                          icons: AppImages.kGoogle),
                    ),
                  ],
                ),
              ),
            )
          ]),
        )),
      ),
    );
  }
}
