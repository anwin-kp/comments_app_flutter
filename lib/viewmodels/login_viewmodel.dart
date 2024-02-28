import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_complete_demo_app/shared/helper/route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import '../shared/helper/utility.dart';

class LoginViewModel extends ChangeNotifier {
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

  Future<void> signIn(String emailText, String passwordText) async {
    setLoading(true);
    auth
        .signInWithEmailAndPassword(email: emailText, password: passwordText)
        .then((userCredential) {
      // This block will only execute if the sign-in was successful.
      Navigator.of(appNavigatorKey.currentContext!).pushAndRemoveUntil(
          createHomeScreenRoute(), (Route<dynamic> route) => false);
      setLoading(false);
    }, onError: (error) {
      setLoading(false);
      if (error is FirebaseAuthException) {
        if (error.code == 'user-not-found') {
          Utility().showErrorSnackBar(appNavigatorKey.currentContext!,
              "No user found with this email. Please try again.");
        } else if (error.code == 'wrong-password') {
          Utility().showErrorSnackBar(appNavigatorKey.currentContext!,
              "Incorrect password. Please try again.");
        } else if (error.code == 'too-many-requests') {
          Utility().showErrorSnackBar(appNavigatorKey.currentContext!,
              "Too many requests. Please try again later.");
        } else if (error.code == 'invalid-credential') {
          Utility().showErrorSnackBar(appNavigatorKey.currentContext!,
              "The email or password is incorrect. Please try again.");
        } else {
          Utility().showErrorSnackBar(appNavigatorKey.currentContext!,
              "An error occurred during sign-in. Please try again later.");
        }
      } else {
        Utility().showErrorSnackBar(appNavigatorKey.currentContext!,
            "An unexpected error occurred. Please try again later.");
      }
    });

    notifyListeners();
  }
}
