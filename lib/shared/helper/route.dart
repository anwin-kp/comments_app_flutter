import 'package:flutter/material.dart';

import 'package:page_transition/page_transition.dart';

import '../../views/data_editing_screen.dart';
import '../../views/home_screen.dart';
import '../../views/login_screen.dart';
import '../../views/signup_screen.dart';

//These methods helps to navigate from one page to another

Route createLoginScreenRoute() {
  return PageTransition(
    type: PageTransitionType.scale,
    alignment: Alignment.center,
    duration: const Duration(milliseconds: 500),
    child: const LoginScreen(),
  );
}

Route createSignupScreenRoute() {
  return PageTransition(
    type: PageTransitionType.scale,
    alignment: Alignment.center,
    duration: const Duration(milliseconds: 500),
    child: const SignUpScreen(),
  );
}

Route createHomeScreenRoute() {
  return PageTransition(
    type: PageTransitionType.scale,
    alignment: Alignment.center,
    duration: const Duration(milliseconds: 500),
    child: const MyHomePage(),
  );
}

Route createEditScreenRoute() {
  return PageTransition(
    type: PageTransitionType.scale,
    alignment: Alignment.center,
    duration: const Duration(milliseconds: 1500),
    child: const DataEditingPage(),
  );
}
