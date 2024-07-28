import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:firebase_complete_demo_app/shared/constants/colors.dart';
import 'package:firebase_complete_demo_app/shared/helper/app_images.dart';
import 'package:firebase_complete_demo_app/shared/helper/route.dart';
import 'package:firebase_complete_demo_app/viewmodels/custom_text_field_view_model.dart';
import 'package:firebase_complete_demo_app/viewmodels/login_viewmodel.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../shared/constants/constants.dart';
import '../shared/helper/utility.dart';
import '../shared/widgets/common widgets/common_edit_textfield.dart';
import '../shared/widgets/common widgets/common_elevated_button.dart';
import '../shared/widgets/common widgets/common_text_types.dart';
import '../shared/widgets/custom_divider_with_text.dart';
import '../shared/widgets/custom_overlay_loader.dart';
import '../shared/widgets/login_page_widgets.dart';
import '../shared/widgets/secondary_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final Utility _utility = Utility();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<TextFieldProvider, LoginViewModel>(
      builder: (context, textFieldProvider, loginViewModel, child) {
        return Scaffold(
          resizeToAvoidBottomInset: true,
          extendBody: false,
          extendBodyBehindAppBar: false,
          body: LoadingOverlay(
            isLoading: loginViewModel.loading,
            child: DoubleBackToCloseApp(
              snackBar: const SnackBar(
                content: TextNormal(
                    text: Constants.exitWarningText,
                    textColor: AppColors.kColorWhite,
                    fontSize: 12),
              ),
              child: GestureDetector(
                onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
                child: SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 300.h,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Form(
                            key: _loginFormKey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
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
                                  textInputType: TextInputType.visiblePassword,
                                  isPassword: true,
                                  labelText: Constants.passwordText,
                                  hintText: Constants.enterPasswordText,
                                  validator: (value) {
                                    return _utility.validateLoginPassword(value!);
                                  },
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    PrimaryTextButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          createResetPasswordScreenRoute(),
                                        );
                                      },
                                      title: Constants.forgotPasswordText,
                                      fontSize: 14,
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                CommonButton(
                                  text: Constants.loginText,
                                  onPressed: () {
                                    if (_loginFormKey.currentState!
                                        .validate()) {
                                      loginViewModel.signIn(
                                          _emailController.text.trim(),
                                          _passwordController.text.trim());
                                    }
                                  },
                                  backgroundColor: AppColors.kCustomBlueColor,
                                  textColor: AppColors.kColorWhite,
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                RichText(
                                  text: TextSpan(
                                    text: Constants.dontHaveAnAccountText,
                                    style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.kGrey600),
                                    children: [
                                      TextSpan(
                                        text: Constants.signUpText,
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            Navigator.push(
                                              context,
                                              createSignupScreenRoute(),
                                            );
                                          },
                                        style: GoogleFonts.poppins(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                            color: AppColors.kLiteBlueColor),
                                      ),
                                    ],
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 5.0.w),
                                  child: const TextWithDivider(
                                    textToShow: Constants.orSignInWithText,
                                  ),
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 35.w),
                                  child: SecondaryButton(
                                      height: 50.h,
                                      textColor: AppColors.kGrey600,
                                      width: 240.w,
                                      onTap: () {
                                        loginViewModel.signInWithGoogle();
                                      },
                                      borderRadius: 24,
                                      bgColor: AppColors.kBackground
                                          .withOpacity(0.3),
                                      text: Constants.continueWithGoogleText,
                                      icons: AppImages.kGoogle),
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
