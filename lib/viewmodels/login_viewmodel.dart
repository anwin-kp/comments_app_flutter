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
    try {
      auth
          .signInWithEmailAndPassword(email: emailText, password: passwordText)
          .then((userCredential) {
        // This block will only execute if the sign-in was successful.
        Navigator.of(appNavigatorKey.currentContext!).pushAndRemoveUntil(
            createHomeScreenRoute(), (Route<dynamic> route) => false);
        setLoading(false);
      }, onError: (error) {
        // This block will execute if there was an error during sign-in.
        setLoading(false);
        if (error.code == 'too-many-requests') {
          Utility().showErrorSnackBar(appNavigatorKey.currentContext!,
              "Too many requests. Please try again later.");
        } else if (error.code == 'invalid-credential') {
          Utility().showErrorSnackBar(appNavigatorKey.currentContext!,
              "The provided login details are invalid or expired.");
        } else {
          Utility().showErrorSnackBar(
              appNavigatorKey.currentContext!, error.code.toString());
        }
        throw Exception(error);
      });
    } catch (e) {
      throw Exception(e);
    }

    notifyListeners();
  }
}
