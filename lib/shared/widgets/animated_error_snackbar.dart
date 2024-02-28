import 'package:firebase_complete_demo_app/shared/widgets/common%20widgets/common_text_types.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/colors.dart';

class AnimatedSnackBar extends StatefulWidget {
  final String message;

  const AnimatedSnackBar({super.key, required this.message});
  @override
  State<AnimatedSnackBar> createState() => _AnimatedSnackBarState();
}

class _AnimatedSnackBarState extends State<AnimatedSnackBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..forward();

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0.0, 2.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticOut,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offsetAnimation,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        color: Colors.red,
        child: TextMedium(
          text: widget.message,
          fontSize: 14.sp,
          isUnderLine: false,
          textColor: AppColors.kColorWhite,
          wantOverFlowEllipsis: false,
        ),
      ),
    );
  }
}
