import 'package:firebase_complete_demo_app/views/reset_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../views/home_screen.dart';

import '../../views/login_screen.dart';
import '../../views/signup_screen.dart';

//These methods helps to navigate from one page to another

Route createLoginScreenRoute() {
  return PageTransition(
    type: PageTransitionType.leftToRight,
    alignment: Alignment.center,
    duration: const Duration(milliseconds: 300),
    child: const LoginScreen(),
  );
}

Route createSignupScreenRoute() {
  return PageTransition(
    type: PageTransitionType.leftToRight,
    alignment: Alignment.center,
    duration: const Duration(milliseconds: 300),
    child: const SignUpScreen(),
  );
}

Route createHomeScreenRoute() {
  return PageTransition(
    type: PageTransitionType.leftToRight,
    alignment: Alignment.center,
    duration: const Duration(milliseconds: 300),
    child: const HomePage(),
  );
}

Route createResetPasswordScreenRoute() {
  return PageTransition(
    type: PageTransitionType.leftToRight,
    alignment: Alignment.center,
    duration: const Duration(milliseconds: 300),
    child: const ResetPasswordScreen(),
  );
}
