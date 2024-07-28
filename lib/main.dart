import 'package:firebase_complete_demo_app/firebase_options.dart';
import 'package:firebase_complete_demo_app/shared/constants/colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'shared/constants/constants.dart';
import 'viewmodels/custom_text_field_view_model.dart';
import 'viewmodels/homescreen_viewmodel.dart';
import 'viewmodels/login_viewmodel.dart';
import 'viewmodels/logout_viewmodel.dart';
import 'viewmodels/reset_password_viewmodel.dart';
import 'viewmodels/signup_viewmodel.dart';
import 'views/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv
      .load(fileName: ".env")
      .then((value) => debugPrint('ENV File Loaded'));
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) => debugPrint('Firebase initialized'));
  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  runApp(const MyApp());
}

final GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Constants.kGlobalSize,
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MultiProvider(
        providers: [
          ChangeNotifierProvider<HomeViewModel>(
            create: (_) => HomeViewModel(),
          ),
          ChangeNotifierProvider<TextFieldProvider>(
            create: (_) => TextFieldProvider(),
          ),
          ChangeNotifierProvider<LoginViewModel>(
            create: (_) => LoginViewModel(),
          ),
          ChangeNotifierProvider<SignUpViewModel>(
            create: (_) => SignUpViewModel(),
          ),
          ChangeNotifierProvider<ResetPasswordViewModel>(
            create: (_) => ResetPasswordViewModel(),
          ),
          ChangeNotifierProvider<SignOutViewModel>(
            create: (_) => SignOutViewModel(),
          ),
        ],
        child: MaterialApp(
          navigatorKey: appNavigatorKey,
          debugShowCheckedModeBanner: false,
          title: Constants.appTitleText,
          theme: ThemeData(
            useMaterial3: true,
            indicatorColor: AppColors.kLiteBlueColor,
          ),
          home: const SplashScreen(),
        ),
      ),
    );
  }
}
