import 'package:firebase_complete_demo_app/shared/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void showLogoutConfirmationDialog(
    BuildContext context, VoidCallback onConfirm) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        title: const Text(
          'Confirm Logout',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.kCustomBlueColor,
          ),
        ),
        content: const Text(
          'Are you sure you want to log out?',
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
        actionsPadding:
            const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        contentPadding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 10.h),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              'Cancel',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              onConfirm();
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: AppColors.kCustomBlueColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0), // Match dialog shape
              ),
            ),
            child: const Text('Logout'),
          ),
        ],
      );
    },
  );
}
