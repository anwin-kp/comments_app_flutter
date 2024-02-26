import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_complete_demo_app/main.dart';
import 'package:firebase_complete_demo_app/views/home_screen.dart';
import 'package:flutter/material.dart';

class FirebaseServices {
  FirebaseAuth auth = FirebaseAuth.instance;
  void signIn(String emailText, String passwordText) {
    auth
        .signInWithEmailAndPassword(email: emailText, password: passwordText)
        .whenComplete(
          () => ScaffoldMessenger.of(appNavigatorKey.currentContext!)
              .showSnackBar(
                const SnackBar(
                  content: Text("Logged In Successfully"),
                ),
              )
              .closed
              .whenComplete(
                () => Navigator.pushReplacement(
                  appNavigatorKey.currentContext!,
                  MaterialPageRoute(
                    builder: (context) => const MyHomePage(),
                  ),
                ),
              ),
        );
  }
}
