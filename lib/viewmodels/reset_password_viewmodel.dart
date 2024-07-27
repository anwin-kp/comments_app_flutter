import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_complete_demo_app/shared/helper/route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../main.dart';
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
      await auth.sendPasswordResetEmail(email: email);
      Navigator.of(appNavigatorKey.currentContext!).pushAndRemoveUntil(
          createLoginScreenRoute(), (Route<dynamic> route) => false);
      Utility().showDoneFlushbar(
          'A password reset link has been sent to your email.',
          appNavigatorKey.currentContext!);
    } catch (error) {
      String errorMessage;
      if (error is FirebaseAuthException) {
        errorMessage = Utility().getResetPasswordErrorMessageToShow(error.code);
      } else {
        errorMessage = "An unexpected error occurred. Please try again later.";
      }
      Utility()
          .showErrorSnackBar(appNavigatorKey.currentContext!, errorMessage);
    } finally {
      setLoading(false);
      notifyListeners();
    }
  }
}
