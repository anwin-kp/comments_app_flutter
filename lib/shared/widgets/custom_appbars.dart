import 'package:firebase_complete_demo_app/shared/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback onActionPressed;

  const CustomAppBar(
      {super.key, required this.title, required this.onActionPressed});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.kCustomBlueColor,
      title: Text(
        title,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: AppColors.kWhite,
          fontFamily: "Roboto",
          letterSpacing: 1.5,
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.exit_to_app),
          color: AppColors.kWhite,
          onPressed: onActionPressed,
        ),
      ],
    );
  }
}
