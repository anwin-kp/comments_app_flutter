import 'package:firebase_complete_demo_app/shared/constants/colors.dart';
import 'package:firebase_complete_demo_app/shared/helper/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../main.dart';
import '../shared/widgets/custom_splash_animation.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    super.key,
  });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  final List<Star> _stars = List.generate(30, (_) => Star.random());
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.of(appNavigatorKey.currentContext!).pushAndRemoveUntil(
        createLoginScreenRoute(),
        (Route<dynamic> route) => false,
      );
    });
    _animationController = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat();

    _animationController.addListener(() {
      setState(() {
        for (var star in _stars) {
          star.update();
        }
      });
    });
  }

  @override
  void dispose() {
    _animationController.stop(); // Stop the animation
    _animationController.dispose(); // Dispose the animation controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackgroundControlPageColor,
      body: CustomPaint(
        painter: StarPainter(
          animation: _animationController,
          stars: _stars,
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 10.0),
              child: SpinKitPouringHourGlass(
                color: AppColors.kColorBlack,
                strokeWidth: 1,
                size: 60,
                duration: Duration(milliseconds: 900),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
