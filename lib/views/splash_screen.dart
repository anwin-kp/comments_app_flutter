import 'package:firebase_complete_demo_app/shared/constants/colors.dart';
import 'package:firebase_complete_demo_app/shared/helper/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../main.dart';
import '../shared/constants/constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    super.key,
  });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(appNavigatorKey.currentContext!).pushAndRemoveUntil(
        createLoginScreenRoute(),
        (Route<dynamic> route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackground2,
      body: const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 30.0),
              child: Text(
                Constants.appTitleText,
                style: TextStyle(
                  color: AppColors.kCustomBlueColor,
                  fontSize: 26,
                  fontFamily: Constants.fontFamilyName,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SpinKitPouringHourGlass(
              color: AppColors.kCustomBlueColor,
              strokeWidth: 1,
              size: 60,
              duration: Duration(milliseconds: 800),
            ),
          ],
        ),
      ),
    );
  }
}
