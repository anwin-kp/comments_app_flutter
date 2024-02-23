import 'package:flutter/material.dart';

import 'package:page_transition/page_transition.dart';

import '../../views/data_editing_screen.dart';
import '../../views/home_screen.dart';
import '../../views/login_screen.dart';

//These methods helps to navigate from one page to another

Route createHomeScreenRoute() {
  return PageTransition(
    type: PageTransitionType.scale,
    alignment: Alignment.center,
    duration: const Duration(milliseconds: 1500),
    child: const MyHomePage(),
  );
}

Route createLoginScreenRoute() {
  return PageTransition(
    type: PageTransitionType.scale,
    alignment: Alignment.center,
    duration: const Duration(milliseconds: 1500),
    child: const LoginScreen(),
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
