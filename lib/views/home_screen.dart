import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../shared/constants/colors.dart';
import '../shared/constants/constants.dart';
import '../shared/widgets/comments_card.dart';
import '../shared/widgets/custom_alerts.dart';
import '../shared/widgets/custom_appbars.dart';
import '../shared/widgets/common widgets/common_text_types.dart';
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

  // In your HomePage widget:
  void _handleImageUpload(HomeViewModel viewModel) async {
    try {
      await viewModel.pickImage();

      if (viewModel.selectedImage != null) {
        viewModel.setIsLoading(true);

        final downloadUrl = await viewModel.uploadImageToFirebase();

        if (downloadUrl != null && mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Image uploaded successfully!'),
              backgroundColor: Colors.green,
            ),
          );
        } else if (mounted && viewModel.uploadError != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(viewModel.uploadError!),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    } finally {
      viewModel.setIsLoading(false);
    }
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
              child: Column(
                children: [
                  // Upload Image Button with Preview
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        // Image preview
                        if (homeViewModel.selectedImage != null)
                          Container(
                            height: 200,
                            width: double.infinity,
                            margin: const EdgeInsets.only(bottom: 16),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.file(
                                homeViewModel.selectedImage!,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        // Upload button
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () => _handleImageUpload(homeViewModel),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              padding:
                                  const EdgeInsets.symmetric(vertical: 16.0),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.cloud_upload,
                                    color: Colors.white),
                                const SizedBox(width: 8),
                                Text(
                                  homeViewModel.selectedImage == null
                                      ? 'Select Image'
                                      : 'Upload Image',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Comments List
                  Expanded(
                    child: ListView.builder(
                      itemCount: homeViewModel.comments.length,
                      itemBuilder: (context, index) {
                        final comment = homeViewModel.comments[index];
                        return CommentCard(comment);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
