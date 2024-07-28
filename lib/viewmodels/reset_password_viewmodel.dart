import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_complete_demo_app/shared/helper/route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import '../shared/constants/constants.dart';
import '../shared/helper/utility.dart';

class ResetPasswordViewModel extends ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;

  bool _loading = false;

  bool get loading => _loading;
  void setLoading(bool value) {
    if (kDebugMode) {
      print("loading set -- $value");
    }
    _loading = value;
    notifyListeners();
  }

  Future<void> resetPassword(String email) async {
    setLoading(true);
    try {
      await auth.sendPasswordResetEmail(email: email).whenComplete(() {
        Navigator.of(appNavigatorKey.currentContext!).pushAndRemoveUntil(
          createLoginScreenRoute(),
          (Route<dynamic> route) => false,
        );
        Utility().showDoneFlushbar(
          Constants.resetPasswordEmailSentText,
          appNavigatorKey.currentContext!,
        );
      });
    } catch (error) {
      String errorMessage;
      if (error is FirebaseAuthException) {
        if (error.code == 'user-not-found') {
          errorMessage = Constants.emailNotRegisteredText;
        } else if (error.code == 'invalid-email') {
          errorMessage = Constants.invalidEmailText;
        } else {
          errorMessage =
              Utility().getResetPasswordErrorMessageToShow(error.code);
        }
      } else {
        errorMessage = Constants.unexpectedErrorText;
      }
      Utility()
          .showErrorSnackBar(appNavigatorKey.currentContext!, errorMessage);
    } finally {
      setLoading(false);
      notifyListeners();
    }
  }
}
