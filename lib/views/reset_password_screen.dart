import 'package:firebase_complete_demo_app/viewmodels/reset_password_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../shared/constants/colors.dart';
import '../shared/constants/constants.dart';
import '../shared/helper/utility.dart';
import '../shared/widgets/common widgets/common_edit_textfield.dart';
import '../shared/widgets/common widgets/common_elevated_button.dart';
import '../shared/widgets/common widgets/common_text_types.dart';
import '../shared/widgets/custom_overlay_loader.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final GlobalKey<FormState> _resetPasswordFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final Utility _utility = Utility();

  @override
  Widget build(BuildContext context) {
    return Consumer<ResetPasswordViewModel>(
        builder: (context, resetPasswordViewModel, child) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.kCustomBlueColor,
          elevation: 2,
          iconTheme: const IconThemeData(
            color: AppColors.kColorWhite,
          ),
          centerTitle: true,
          title: TextMedium(
            text: Constants.resetPasswordText,
            textColor: AppColors.kColorWhite,
            fontSize: 22.sp,
            isUnderLine: false,
            wantOverFlowEllipsis: false,
          ),
        ),
        resizeToAvoidBottomInset: true,
        extendBody: false,
        extendBodyBehindAppBar: false,
        body: LoadingOverlay(
          isLoading: resetPasswordViewModel.loading,
          child: GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(10.r),
                    child: Form(
                      key: _resetPasswordFormKey,
                      child: Column(
                        children: [
                          CustomTextFormField(
                            controller: _emailController,
                            textInputType: TextInputType.emailAddress,
                            isPassword: false,
                            labelText: Constants.emailText,
                            hintText: Constants.enterYourEmailText,
                            validator: (value) {
                              return _utility.validateEmail(value!);
                            },
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          CommonButton(
                            text: Constants.submitText,
                            onPressed: () {
                              FocusManager.instance.primaryFocus?.unfocus();
                              if (_resetPasswordFormKey.currentState!
                                  .validate()) {
                                resetPasswordViewModel.resetPassword(
                                  _emailController.text.trim(),
                                );
                              }
                            },
                            backgroundColor: AppColors.kCustomBlueColor,
                            textColor: AppColors.kColorWhite,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
