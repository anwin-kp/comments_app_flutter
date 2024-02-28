import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../constants/colors.dart';

class LoadingOverlay extends StatelessWidget {
  final bool isLoading;
  final Widget child;

  const LoadingOverlay({
    super.key,
    required this.isLoading,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        child,
        if (isLoading)
          const Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: SpinKitPouringHourGlass(
                color: AppColors.kGoldColor,
                strokeWidth: 2,
                duration: Duration(milliseconds: 1000),
                size: 60,
              ),
            ),
          ),
        if (isLoading)
          AbsorbPointer(
            absorbing: true,
            child: IgnorePointer(
              ignoring: !isLoading,
              child: ModalBarrier(
                color: Colors.black.withOpacity(0.3),
              ),
            ),
          ),
      ],
    );
  }
}
