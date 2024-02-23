import 'package:flutter/material.dart';

class AppColors {
  AppColors._();
//This class contains the Color static constants
  static const Color kColorLightNavy = Color(0xff132e60);
  static const Color kColorLightBlue = Color(0xff009ee0);
  static const Color kBlueButtonColor = Color.fromARGB(255, 68, 124, 220);
  static const Color kColorWhite = Color.fromARGB(255, 255, 255, 255);
  static const Color kColorBlack = Color.fromARGB(255, 0, 0, 0);
  static const Color kColorRed = Color.fromARGB(255, 255, 0, 0);
  static const Color kColorGreen = Color.fromARGB(255, 0, 255, 0);
  static const Color kColorBlue = Color.fromARGB(255, 0, 0, 255);
  static const Color kColorYellow = Color.fromARGB(255, 255, 255, 0);
  static const Color kColorPurple = Color.fromARGB(255, 128, 0, 128);
  static const Color kColorOrange = Color.fromARGB(255, 255, 165, 0);
  static const Color kColorCyan = Color.fromARGB(255, 0, 255, 255);
  static const Color kColorMagenta = Color.fromARGB(255, 255, 0, 255);
  static const Color kHintTextGreyColor = Color.fromRGBO(143, 143, 143, 1);
  static const Color kCheckBoxColor = Color.fromRGBO(115, 115, 115, 1);
  static const Color kGreyColor = Color.fromRGBO(124, 124, 124, 1);
  static const Color kGoldColor = Color(0xFFFFD700);
  static const Color kLiteBlueColor = Color(0xff42a5f5);
  static const Color kGreyTextColor = Color.fromRGBO(10, 33, 41, 1);
  static const Color kBackgroundControlPageColor =
      Color.fromRGBO(243, 246, 253, 1);
  static const Color kBrownTextColor = Color.fromRGBO(78, 75, 78, 1);
  static const Color kProgressBlueColor = Color.fromRGBO(71, 122, 221, 1);
  static const Color kProgressGreenColor = Color.fromRGBO(144, 224, 203, 1);
  static const Color kProgressRedColor = Color.fromRGBO(233, 73, 79, 1);
  static const Color kBorderGreyColor = Color.fromRGBO(236, 236, 236, 1);
  static const Color kTopHomeScreenGreyColor = Color.fromRGBO(243, 246, 253, 1);
  static const Color kMiddleHomeScreenGreyColor =
      Color.fromRGBO(235, 249, 246, 1);
  static const Color kDarkBlue = Color.fromRGBO(35, 101, 213, 1);
  static const Color kThumbColor = Color.fromRGBO(92, 91, 91, 1);
  static const Color kGreenColorText = Color.fromRGBO(22, 141, 42, 1);
  static const Color kGrey300 = Color.fromRGBO(224, 224, 224, 1);
  static const Color kGrey600 = Color.fromRGBO(117, 117, 117, 1);
  static const Color kGrey400 = Color.fromRGBO(189, 189, 189, 1);
  static const Color kBlue500 = Color.fromRGBO(33, 150, 243, 1);
  static Color kBackground = const Color(0XFFFAFAFA);
  static Color kPrimary = const Color(0XFF1460F2);
  static Color kWhite = const Color(0XFFFFFFFF);
  static Color kGrayscaleDark100 = const Color(0XFF1C1C1E);
  static Color kLine = const Color(0XFFEBEBEB);
  static Color kBackground2 = const Color(0XFFF6F6F6);
  static Color kGrayscale40 = const Color(0XFFAEAEB2);
  static const LinearGradient kBlueACGradient = LinearGradient(
    colors: <Color>[
      Color(0xFFB3E5FC),
      Color(0xFF0288D1),
      Color(0xFFB3E5FC),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  static const LinearGradient kOrangeHeaterGradient = LinearGradient(
    colors: <Color>[
      Color(0xFFFFE5B4),
      Color(0xFFFF7F41),
      Color(0xFFFFE5B4),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  /// gradient decoration - home screen
  Decoration kHomeScreenGradientDecoration = const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: [0.1, 0.9],
      colors: [kTopHomeScreenGreyColor, kMiddleHomeScreenGreyColor],
    ),
  );
  static const Color kBgLiteGreyColor = Color.fromRGBO(238, 238, 238, 1);
}
