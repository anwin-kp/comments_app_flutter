import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors.dart';

class Constants {
  Constants._();
  static const Size kGlobalSize = Size(360, 690);
  static const String appTitleText = 'Comments App';
  static const String fontFamilyName = 'Poppins';

  //! Login Page constants
  static const String loginText = 'Login';
  static const String emailText = 'Email';
  static const String passwordText = 'Password';
  static const String signUpText = 'Sign Up';
  static const String forgotPasswordText = 'Forgot Password?';
  static const String continueWithGoogleText = 'Continue with Google';
  static const String enterYourEmailText = 'Enter your email';
  static const String enterPasswordText = 'Enter your password';
  static const String orSignInWithText = 'Or Sign In with';
  static const String dontHaveAnAccountText = 'Don’t have an account? ';
  static const String privacyTitle1Text = '  By signing up you agree to our';
  static const String privacyTitle2Text = ' Terms ';
  static const String privacyTitle3Text = ' and';
  static const String privacyTitle4Text = ' Conditions of Use';
  static const String resetPasswordText = 'Reset Password';

  //!Common Texts
  static const String submitText = 'Submit';
  static const String backButtonWarningText = 'Press Back button again to Exit';

  //!Home Screen Texts
  static const String commentsText = "Comments";

  //!Reset Password Page constants
  static const String resetPasswordTitleText = 'Reset Password';
  static const String resetPasswordEmailSentText =
      'A password reset link has been sent to your email.';
  static const String emailNotRegisteredText =
      'The email address is not registered.';
  static const String invalidEmailText = 'The email address is not valid.';

  //! Sign Up Page constants
  static const String nameText = 'Name';
  static const String phoneNumberText = 'Phone Number';
  static const String enterPhoneNumberText = 'Enter your phone number';
  static const String enterYourNameText = 'Enter your name';
  static const String confirmPasswordText = 'Confirm Password';
  static const String orSignUpWithText = 'Or Sign Up with';
  static const String enterNewPasswordText = 'Enter new password';
  static const String confirmNewPasswordText = 'Confirm new password';

  //! Error Texts
  static const String fieldCantBeEmptyText = 'This field can\'t be empty';
  static const String enterValidMobileNumberText =
      'Please enter valid mobile number';
  static const String mobileNumberShouldBe10Text =
      'Phone number should be 10 digits';
  static const String valueCannotBeEmpty = 'Value cannot be empty';
  static const String enterValidEmailText = 'Please enter a valid email';
  static const String enterEmailText = 'Please enter an email';
  static const String enterMobileNumberText = 'Please enter mobile number';
  static const String enterLoginPasswordText = "Please enter a password";
  static const String enterValidPasswordText =
      "Password must be atleast 6 characters long";
  static const String exitWarningText = 'Press back again to exit.';
  static const String emailNotAvailableText = 'Email not available';
  static const String nameNotAvailableText = 'Name not available';
  static const String unexpectedErrorText =
      'An unexpected error occurred. Please try again later.';

  //!Error Styles
  static TextStyle get errorTextStyle => TextStyle(
        color: Colors.red,
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
      );
  static OutlineInputBorder get focusedInputBorder => OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.kGreenColorText),
        borderRadius: BorderRadius.circular(10),
      );

  static OutlineInputBorder get enabledInputBorder => OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.kLiteBlueColor),
        borderRadius: BorderRadius.circular(10),
      );

  static OutlineInputBorder get errorInputBorder => OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.red),
        borderRadius: BorderRadius.circular(10),
      );

  //!Regex Texts
  static const String emailRegex =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  static const String mobileRegex = r'(^(?:[+0]9)?[0-9]{10,12}$)';
  static const String nameRegex = r'^[a-z A-Z,.\-]+$';
  static const String passwordRegex =
      r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,20}$';

  //!API Links
  static const String kCommentsUrl =
      'https://jsonplaceholder.typicode.com/comments';
}
