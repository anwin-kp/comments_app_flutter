import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors.dart';

class Constants {
  Constants._();
  static const Size kGlobalSize = Size(360, 690);
  static const String appTitleText = 'Flutter MQTT Demo';
  static const String homeTitleText = 'Flutter MQTT';
  static const String fontFamilyName = 'Roboto';

  //! MQTT Data Constants
  static const int kMQTTWaitTimeInSecond = 5;
  static const String kMQTTHostName = 'broker.emqx.io';
  static const int kMQTTPort = 1883;
  static const String kMQTTUserName = 'anwin_kp_11';
  static const String kMQTTPassword = '123456';
  static const String kMQTTIdentifierPrefix = 'mqttx_cb7c781a-';

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
  static const String privacyTitle3Text = '  and';
  static const String privacyTitle4Text = ' Conditions of Use';

  //! Sign Up Page constants
  static const String nameText = 'Name';
  static const String phoneNumberText = 'Phone Number';
  static const String enterPhoneNumberText = 'Enter your phone number';
  static const String enterYourNameText = 'Enter your name';
  static const String confirmPasswordText = 'Confirm Password';
  static const String orSignUpWithText = 'Or Sign Up with';
  static const String enterNewPasswordText = 'Enter new password';
  static const String confirmNewPasswordText = 'Confirm new password';

  //! Data Edit Page Constants
  static const String mqttDataUpdatedSuccessText = 'Data Updated Successfully';
  static const String taskInProgressText = 'task_inprogress';
  static const String taskFailedText = 'task_failed';
  static const String taskCompletedText = 'task_completed';
  static const String countText = 'count';
  static const String messageText = 'message';
  static const String taskCompletedCapsText = 'Task Completed';
  static const String minsAgoText = 'mins ago';
  static const String hourAgoText = 'hour ago';
  static const String taskFailedCapsText = 'Task Failed';
  static const String taskInProgressCapsText = 'Task In Progress';
  static const String recentActivityText = 'Recent Activity';
  static const String statusText = 'Status';
  static const String incrementText = 'Increment';
  static const String dataEditingText = 'Data Editing';
  static const String appMqttMessageText =
      'Hello, MQTT! Update From Flutter App';
  static const String updatesStatusCountText =
      'You have updated the status this many times:';

  //!Common Texts
  static const String updateCapsText = 'UPDATE';

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
}
