import 'package:another_flushbar/flushbar.dart';
import 'package:firebase_complete_demo_app/shared/widgets/common%20widgets/common_text_types.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/colors.dart';
import '../constants/constants.dart';

class Utility {
  Utility();
  String? validateInput(String? value) {
    if (value == null || value.isEmpty) {
      return Constants.fieldCantBeEmptyText;
    }
    return null;
  }

  String? validateEmail(String value) {
    RegExp regex = RegExp(Constants.emailRegex);
    if (value.isEmpty) {
      return Constants.enterEmailText;
    } else if (!regex.hasMatch(value)) {
      return Constants.enterValidEmailText;
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.isEmpty) {
      return 'Please enter password';
    } else if (!RegExp(r'^(?=.*[A-Z])').hasMatch(value)) {
      return 'Password must contain at least one uppercase letter (A-Z)';
    } else if (!RegExp(r'^(?=.*[a-z])').hasMatch(value)) {
      return 'Password must contain at least one lowercase letter (a-z)';
    } else if (!RegExp(r'^(?=.*\d)').hasMatch(value)) {
      return 'Password must contain at least one digit (0-9)';
    } else if (!RegExp(r'^(?=.*[@$!%*?&])').hasMatch(value)) {
      return 'Password must contain at least one special character (e.g:!@#\$%^&*)';
    } else if (!RegExp(r'^.{8,20}$').hasMatch(value)) {
      return 'Password must be at least 8 characters in length';
    }
    return null;
  }

  String? validateConfirmPassword(String value, String originalPassword) {
    if (value.isEmpty) {
      return 'Please confirm your password';
    } else if (value != originalPassword) {
      return 'Passwords do not match';
    }
    return null;
  }

  String? validateMobile(String value) {
    RegExp regExp = RegExp(Constants.mobileRegex);
    if (value.isEmpty) {
      return Constants.enterMobileNumberText;
    } else if (!regExp.hasMatch(value)) {
      return Constants.enterValidMobileNumberText;
    } else if (value.length != 10) {
      return Constants.mobileNumberShouldBe10Text;
    }
    return null;
  }

  String? validateEmptyString(String value) {
    if (value.isEmpty) {
      return Constants.valueCannotBeEmpty;
    }
    return null;
  }

  String getLoginErrorMessageToShow(String errorCode) {
    switch (errorCode) {
      case 'user-not-found':
        return "No user found with this email. Please try again.";
      case 'wrong-password':
        return "Incorrect password. Please try again.";
      case 'too-many-requests':
        return "Too many requests. Please try again later.";
      case 'invalid-credential':
        return "The email or password is incorrect. Please try again.";
      default:
        return "An error occurred during sign-in. Please try again later.";
    }
  }

  String getResetPasswordErrorMessageToShow(String errorCode) {
    switch (errorCode) {
      case 'user-not-found':
        return 'No user found with this email.';
      case 'invalid-email':
        return 'The email address is not valid.';
      case 'operation-not-allowed':
        return 'Password reset is not allowed. Please contact support.';
      case 'too-many-requests':
        return 'We have blocked all requests from this device due to unusual activity. Try again later.';
      default:
        return 'An unexpected error occurred. Please try again later.';
    }
  }

  //FlushBar to show successful messages
  Flushbar showDoneFlushbar(String textToShow, BuildContext context) {
    return Flushbar(
      margin: const EdgeInsets.fromLTRB(5, 5, 5, 0),
      borderRadius: BorderRadius.circular(10),
      flushbarPosition: FlushbarPosition.TOP,
      messageText: Text(
        textToShow,
        style: TextStyle(
          color: Colors.white,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
      ),
      icon: const Icon(
        Icons.done_all_outlined,
        size: 28.0,
        color: Colors.green,
      ),
      duration: const Duration(seconds: 3),
      backgroundColor: Colors.black54.withBlue(50),
      borderColor: Colors.lightGreen,
      borderWidth: 1,
    )..show(context);
  }

  showErrorSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: TextMedium(
        text: message,
        fontSize: 14.sp,
        isUnderLine: false,
        textColor: AppColors.kColorWhite,
        wantOverFlowEllipsis: false,
      ),
      backgroundColor: Colors.red,
      behavior: SnackBarBehavior.fixed,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
