import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_complete_demo_app/shared/helper/route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import '../shared/helper/utility.dart';
import 'home_viewmodel.dart';

class LoginViewModel extends ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;

  bool _loading = false;
  late UserCredential _loginUserCredential;

  bool get loading => _loading;

  UserCredential get loginUserCredential => _loginUserCredential;

  void setLoading(bool value) {
    if (kDebugMode) {
      print("loading set -- $value");
    }
    _loading = value;
    notifyListeners();
  }

  Future<void> updateUserCredentials(UserCredential value) async {
    _loginUserCredential = value;
    notifyListeners();
  }

  //! Method to sign in a user
  Future<void> signIn(String emailText, String passwordText) async {
    setLoading(true);
    auth
        .signInWithEmailAndPassword(email: emailText, password: passwordText)
        .then((userCredential) async {
      await retrieveData();

      // This block will only execute if the sign-in was successful.
      Navigator.of(appNavigatorKey.currentContext!).pushAndRemoveUntil(
          createHomeScreenRoute(), (Route<dynamic> route) => false);
      setLoading(false);
      await updateUserCredentials(userCredential);
    }, onError: (error) {
      setLoading(false);
      String errorMessage;
      if (error is FirebaseAuthException) {
        errorMessage = Utility().getLoginErrorMessageToShow(error.code);
      } else {
        errorMessage = "An unexpected error occurred. Please try again later.";
      }
      Utility()
          .showErrorSnackBar(appNavigatorKey.currentContext!, errorMessage);
    });

    notifyListeners();
  }

  //Retrieves saved data from cloud firestore
  Future<void> retrieveData() async {
    final homeViewModel = Provider.of<HomeViewModel>(
        appNavigatorKey.currentContext!,
        listen: false);
    DocumentReference docRef = FirebaseFirestore.instance
        .collection('Users')
        .doc(_loginUserCredential.user?.uid);

    DocumentSnapshot docSnapshot = await docRef.get();

    if (docSnapshot.exists) {
      Map<String, dynamic>? data = docSnapshot.data() as Map<String, dynamic>?;
      if (data != null) {
        String name = data['Name'];
        String email = data['Email'];
        // int phoneNumber = data['Mobile Number'];
        homeViewModel.updateUser(name, email);
        if (kDebugMode) {
          print('Name: $name,');
        }
      } else {
        if (kDebugMode) {
          print('Document data is null');
        }
      }
    } else {
      if (kDebugMode) {
        print('Document does not exist on the database');
      }
    }
  }

  Future<UserCredential> signInWithGoogleOG() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      await googleSignIn.disconnect();
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
        await updateUserCredentials(userCredential);
        await retrieveData();
        debugPrint(userCredential.toString());
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
            "An error occurred during sign-in. Please try again later.");
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
