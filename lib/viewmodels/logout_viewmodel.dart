import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_complete_demo_app/shared/helper/route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import '../shared/helper/utility.dart';
import 'homescreen_viewmodel.dart';

class SignOutViewModel extends ChangeNotifier {
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

  //! Method to sign out a user
  Future<void> signOut() async {
    setLoading(true);
    try {
      // Disconnect from Google Sign-In
      try {
        await GoogleSignIn().disconnect();
        if (kDebugMode) {
          print("Google account disconnected");
        }
      } catch (error) {
        if (kDebugMode) {
          print('Failed to disconnect Google Account: $error');
        }
      }

      // Sign out from Firebase
      await FirebaseAuth.instance.signOut();
      if (kDebugMode) {
        print("User signed out from Firebase");
      }
      await Provider.of<HomeViewModel>(appNavigatorKey.currentContext!,
              listen: false)
          .clearComments();
      Provider.of<HomeViewModel>(appNavigatorKey.currentContext!, listen: false)
          .clearSelectedImage();
      // Navigate to the login screen
      Navigator.of(appNavigatorKey.currentContext!).pushAndRemoveUntil(
          createLoginScreenRoute(), (Route<dynamic> route) => false);
    } catch (e) {
      if (kDebugMode) {
        print('Error signing out: $e');
      }
      Utility().showErrorSnackBar(appNavigatorKey.currentContext!,
          "An error occurred during sign-out. Please try again later.");
    }
    setLoading(false);
  }
}
