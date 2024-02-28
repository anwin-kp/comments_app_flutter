import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import '../shared/helper/route.dart';
import '../shared/helper/utility.dart';

class SignUpViewModel extends ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;
  late UserCredential userCredential;
  bool _loading = false;

  bool get loading => _loading;

  void setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> signUp(String emailText, String passwordText, String name,
      int phoneNumber) async {
    setLoading(true);
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: emailText,
        password: passwordText,
      );

      await userCredential.user?.updateDisplayName(name);
      await FirebaseFirestore.instance
          .collection('/Users')
          .doc(userCredential.user?.uid)
          .set({'Name': name, 'Mobile Number': phoneNumber});

      debugPrint(userCredential.toString());
      // This block will only execute if the sign-up was successful.
      Navigator.of(appNavigatorKey.currentContext!).pushAndRemoveUntil(
          createHomeScreenRoute(), (Route<dynamic> route) => false);
      setLoading(false);
    } on FirebaseAuthException catch (error) {
      setLoading(false);
      if (error.code == 'email-already-in-use') {
        Utility().showErrorSnackBar(appNavigatorKey.currentContext!,
            "The email is already in use. Please sign in instead.");
      } else if (error.code == 'weak-password') {
        Utility().showErrorSnackBar(appNavigatorKey.currentContext!,
            "The password is too weak. Please choose a stronger password.");
      } else {
        Utility().showErrorSnackBar(appNavigatorKey.currentContext!,
            "An error occurred during sign-up. Please try again later. ");
      }
    } catch (e) {
      setLoading(false);
      if (kDebugMode) {
        print("Error -- $e");
      }
      Utility().showErrorSnackBar(appNavigatorKey.currentContext!,
          "An unexpected error occurred. Please try again later.");
    }

    notifyListeners();
  }
}
