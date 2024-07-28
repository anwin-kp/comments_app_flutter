import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import '../shared/helper/route.dart';
import '../shared/helper/utility.dart';
import 'login_viewmodel.dart';

class SignUpViewModel extends ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;
  late UserCredential userCredential;
  bool _loading = false;
  final loginViewModel = Provider.of<LoginViewModel>(
      appNavigatorKey.currentContext!,
      listen: false);
  bool get loading => _loading;

  void setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> signUp(
    String emailText,
    String passwordText,
    String name,
  ) async {
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
          .set({'Name': name, 'Email': emailText});

      debugPrint(userCredential.toString());
      // This block will only execute if the sign-up was successful.
      await loginViewModel.updateUserCredentials(userCredential);
      await loginViewModel.retrieveData();
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
            "An error occurred during sign-up. Please try again later.");
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

  Future<void> signUpWithGoogle() async {
    try {
      try {
        await GoogleSignIn().disconnect();
        if (kDebugMode) {
          print("G Account Disconnected Signup");
        }
      } catch (error) {
        if (kDebugMode) {
          print('Failed to disconnect Google Account: $error');
        }
      }
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser != null) {
        setLoading(true);
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        // Create a new credential
        final OAuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        final UserCredential userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);
        debugPrint(userCredential.toString());

        // Check if the user is new
        if (userCredential.additionalUserInfo?.isNewUser == true) {
          // Store additional user information in Firestore
          await FirebaseFirestore.instance
              .collection('/Users')
              .doc(userCredential.user?.uid)
              .set({
            'Name': googleUser.displayName,
            'Email': googleUser.email,
            // Add other fields as needed
          });
        }
        await loginViewModel.updateUserCredentials(userCredential);
        await loginViewModel.retrieveData();
        // This block will only execute if the sign-in was successful.
        Navigator.of(appNavigatorKey.currentContext!).pushAndRemoveUntil(
            createHomeScreenRoute(), (Route<dynamic> route) => false);
        setLoading(false);
      }
    } on FirebaseAuthException catch (error) {
      setLoading(false);
      if (error.code == 'account-exists-with-different-credential') {
        Utility().showErrorSnackBar(appNavigatorKey.currentContext!,
            "The email is already in use with a different credential. Please sign in with a different credential.");
      } else {
        Utility().showErrorSnackBar(appNavigatorKey.currentContext!,
            "An error occurred during sign-up. Please try again later.");
      }
    } catch (e) {
      setLoading(false);
      if (kDebugMode) {
        print(e);
      }
      Utility().showErrorSnackBar(appNavigatorKey.currentContext!,
          "An unexpected error occurred. Please try again later.");
    }

    notifyListeners();
  }
}
