import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_complete_demo_app/shared/helper/route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import '../shared/helper/utility.dart';

class Retrieves extends ChangeNotifier {
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
      // This block will only execute if the sign-in was successful.
      Navigator.of(appNavigatorKey.currentContext!).pushAndRemoveUntil(
          createHomeScreenRoute(), (Route<dynamic> route) => false);
      setLoading(false);
      await updateUserCredentials(userCredential);
      await retrieveData();
    }, onError: (error) {
      setLoading(false);
      String errorMessage;
      if (error is FirebaseAuthException) {
        errorMessage = Utility().getErrorMessageToShow(error.code);
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
    DocumentReference docRef = FirebaseFirestore.instance
        .collection('Users')
        .doc(_loginUserCredential.user?.uid);

    DocumentSnapshot docSnapshot = await docRef.get();

    if (docSnapshot.exists) {
      Map<String, dynamic>? data = docSnapshot.data() as Map<String, dynamic>?;
      if (data != null) {
        String name = data['Name'];
        int phoneNumber = data['Mobile Number'];
        if (kDebugMode) {
          print('Name: $name, Phone Number: $phoneNumber');
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
}
