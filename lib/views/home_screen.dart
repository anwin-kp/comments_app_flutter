import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:firebase_complete_demo_app/shared/widgets/common%20widgets/common_text_types.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../shared/constants/colors.dart';
import '../shared/constants/constants.dart';
import '../shared/widgets/comments_card.dart';
import '../shared/widgets/custom_alerts.dart';
import '../shared/widgets/custom_appbars.dart';

import '../shared/widgets/custom_overlay_loader.dart';
import '../viewmodels/homescreen_viewmodel.dart';
import '../viewmodels/logout_viewmodel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<HomeViewModel>(context, listen: false).fetchComments();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<SignOutViewModel, HomeViewModel>(
      builder: (context, signOutViewModel, homeViewModel, child) {
        return Scaffold(
          backgroundColor: AppColors.kColorWhite,
          appBar: CustomAppBar(
            title: Constants.commentsText,
            onActionPressed: () {
              showLogoutConfirmationDialog(
                context,
                () {
                  signOutViewModel.signOut();
                },
              );
            },
          ),
          body: DoubleBackToCloseApp(
            snackBar: const SnackBar(
              content: TextMedium(
                text: Constants.backButtonWarningText,
                fontSize: 14,
                isUnderLine: false,
                textColor: AppColors.kColorWhite,
                wantOverFlowEllipsis: false,
              ),
            ),
            child: LoadingOverlay(
              isLoading: homeViewModel.isLoading,
              child: ListView.builder(
                itemCount: homeViewModel.comments.length,
                itemBuilder: (context, index) {
                  final comment = homeViewModel.comments[index];
                  return CommentCard(comment);
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
