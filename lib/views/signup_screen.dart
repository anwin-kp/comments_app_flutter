import 'package:firebase_complete_demo_app/viewmodels/signup_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../shared/constants/colors.dart';
import '../shared/constants/constants.dart';
import '../shared/helper/app_images.dart';
import '../shared/helper/utility.dart';
import '../shared/widgets/common widgets/common_edit_textfield.dart';
import '../shared/widgets/common widgets/common_elevated_button.dart';
import '../shared/widgets/custom_divider_with_text.dart';
import '../shared/widgets/custom_overlay_loader.dart';
import '../shared/widgets/login_page_widgets.dart';
import '../shared/widgets/secondary_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _mobileNumController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final Utility _utility = Utility();
  final GlobalKey<FormState> _signupFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<SignUpViewModel>(
        builder: (context, signUpViewModel, child) {
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
        body: LoadingOverlay(
          isLoading: signUpViewModel.loading,
          child: GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: SafeArea(
                child: SingleChildScrollView(
              child: Column(children: [
                SizedBox(
                  height: 150.h,
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
                          controller: _mobileNumController,
                          textInputType: TextInputType.phone,
                          isPassword: false,
                          labelText: Constants.phoneNumberText,
                          hintText: Constants.enterPhoneNumberText,
                          validator: (value) {
                            return _utility.validateMobile(value!);
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
                            return _utility.validateConfirmPassword(
                                value!, _passwordController.text);
                          },
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        CommonButton(
                          text: Constants.signUpText,
                          onPressed: () {
                            FocusManager.instance.primaryFocus?.unfocus();
                            if (_signupFormKey.currentState!.validate()) {
                              signUpViewModel.signUp(
                                _emailController.text.trim(),
                                _confirmPasswordController.text.trim(),
                                _nameController.text.trim(),
                                int.parse(_mobileNumController.text),
                              );
                            }
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
                              width: 240.w,
                              onTap: () {
                                signUpViewModel.signUpWithGoogle();
                              },
                              borderRadius: 24,
                              bgColor: AppColors.kBackground.withOpacity(0.3),
                              text: Constants.continueWithGoogleText,
                              icons: AppImages.kGoogle),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 40),
                          child: TermsAndPrivacyText(
                            title1: Constants.privacyTitle1Text,
                            title2: Constants.privacyTitle2Text,
                            title3: Constants.privacyTitle3Text,
                            title4: Constants.privacyTitle4Text,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ]),
            )),
          ),
        ),
      );
    });
  }
}
