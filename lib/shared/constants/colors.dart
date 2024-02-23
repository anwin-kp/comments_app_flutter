import 'package:flutter/material.dart';

//This class contains the Color constants
const Color kColorLightNavy = Color(0xff132e60);
const Color kColorLightBlue = Color(0xff009ee0);
const Color kBlueButtonColor = Color.fromARGB(255, 68, 124, 220);
const Color kColorWhite = Color.fromARGB(255, 255, 255, 255);
const Color kColorBlack = Color.fromARGB(255, 0, 0, 0);
const Color kColorRed = Color.fromARGB(255, 255, 0, 0);
const Color kColorGreen = Color.fromARGB(255, 0, 255, 0);
const Color kColorBlue = Color.fromARGB(255, 0, 0, 255);
const Color kColorYellow = Color.fromARGB(255, 255, 255, 0);
const Color kColorPurple = Color.fromARGB(255, 128, 0, 128);
const Color kColorOrange = Color.fromARGB(255, 255, 165, 0);
const Color kColorCyan = Color.fromARGB(255, 0, 255, 255);
const Color kColorMagenta = Color.fromARGB(255, 255, 0, 255);
const Color kHintTextGreyColor = Color.fromRGBO(143, 143, 143, 1);
const Color kCheckBoxColor = Color.fromRGBO(115, 115, 115, 1);
const Color kGreyColor = Color.fromRGBO(124, 124, 124, 1);
const Color kGoldColor = Color(0xFFFFD700);
const Color kLiteBlueColor = Color(0xff42a5f5);
const Color kGreyTextColor = Color.fromRGBO(10, 33, 41, 1);
const Color kBackgroundControlPageColor = Color.fromRGBO(243, 246, 253, 1);
const Color kBrownTextColor = Color.fromRGBO(78, 75, 78, 1);
const Color kProgressBlueColor = Color.fromRGBO(71, 122, 221, 1);
const Color kProgressGreenColor = Color.fromRGBO(144, 224, 203, 1);
const Color kProgressRedColor = Color.fromRGBO(233, 73, 79, 1);
const Color kBorderGreyColor = Color.fromRGBO(236, 236, 236, 1);
const Color kTopHomeScreenGreyColor = Color.fromRGBO(243, 246, 253, 1);
const Color kMiddleHomeScreenGreyColor = Color.fromRGBO(235, 249, 246, 1);
const Color kDarkBlue = Color.fromRGBO(35, 101, 213, 1);
const Color kThumbColor = Color.fromRGBO(92, 91, 91, 1);
const Color kGreenColorText = Color.fromRGBO(22, 141, 42, 1);
const Color kGrey300 = Color.fromRGBO(224, 224, 224, 1);
const Color kGrey600 = Color.fromRGBO(117, 117, 117, 1);
const Color kGrey400 = Color.fromRGBO(189, 189, 189, 1);
const Color kBlue500 = Color.fromRGBO(33, 150, 243, 1);

const LinearGradient kBlueACGradient = LinearGradient(
  colors: <Color>[
    Color(0xFFB3E5FC),
    Color(0xFF0288D1),
    Color(0xFFB3E5FC),
  ],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);
const LinearGradient kOrangeHeaterGradient = LinearGradient(
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
const Color kBgLiteGreyColor = Color.fromRGBO(238, 238, 238, 1);
