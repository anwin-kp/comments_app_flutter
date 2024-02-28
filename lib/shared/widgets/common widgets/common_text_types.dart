import 'package:flutter/material.dart';

import '../../constants/constants.dart';

// Custom Text widget with bold style.
class TextBold extends StatelessWidget {
  final String text;
  final Color textColor;
  final double fontSize;
  final bool isUnderLine;

  const TextBold(
      {super.key,
      required this.text,
      required this.textColor,
      required this.fontSize,
      required this.isUnderLine});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: textColor,
        fontWeight: FontWeight.w700,
        fontFamily: Constants.fontFamilyName,
        fontSize: fontSize,
        decoration:
            isUnderLine ? TextDecoration.underline : TextDecoration.none,
      ),
      textDirection: TextDirection.ltr,
    );
  }
}

// Custom Text widget with extra bold style.
class TextExtraBold extends StatelessWidget {
  final String text;
  final Color textColor;
  final double fontSize;
  final bool isUnderLine;

  const TextExtraBold(
      {super.key,
      required this.text,
      required this.textColor,
      required this.fontSize,
      required this.isUnderLine});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: textColor,
        fontWeight: FontWeight.w800,
        fontFamily: Constants.fontFamilyName,
        fontSize: fontSize,
        decoration:
            isUnderLine ? TextDecoration.underline : TextDecoration.none,
      ),
      textDirection: TextDirection.ltr,
    );
  }
}

// Custom Text widget with medium style.
class TextMedium extends StatelessWidget {
  final String text;
  final Color textColor;
  final double fontSize;
  final bool isUnderLine;
  final bool wantOverFlowEllipsis;

  const TextMedium(
      {super.key,
      required this.text,
      required this.textColor,
      required this.fontSize,
      required this.isUnderLine,
      required this.wantOverFlowEllipsis});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        overflow: wantOverFlowEllipsis ? TextOverflow.ellipsis : null,
        color: textColor,
        fontFamily: Constants.fontFamilyName,
        fontWeight: FontWeight.w500,
        fontSize: fontSize,
        decoration:
            isUnderLine ? TextDecoration.underline : TextDecoration.none,
      ),
      textDirection: TextDirection.ltr,
    );
  }
}

class TextSmall extends StatelessWidget {
  final String text;
  final Color textColor;
  final double fontSize;
  final bool isUnderLine;

  const TextSmall({
    super.key,
    required this.text,
    required this.textColor,
    required this.fontSize,
    required this.isUnderLine,
  });
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: textColor,
        fontFamily: Constants.fontFamilyName,
        fontWeight: FontWeight.w300,
        fontSize: fontSize,
        decoration:
            isUnderLine ? TextDecoration.underline : TextDecoration.none,
      ),
      textDirection: TextDirection.ltr,
    );
  }
}

// Custom Text widget with normal style.
class TextNormal extends StatelessWidget {
  final String text;
  final Color textColor;
  final double fontSize;
  final TextAlign? textAlign;

  const TextNormal(
      {super.key,
      required this.text,
      required this.textColor,
      required this.fontSize,
      this.textAlign});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: textColor,
        fontWeight: FontWeight.w400,
        fontFamily: Constants.fontFamilyName,
        fontSize: fontSize,
        decoration: TextDecoration.none,
      ),
      textDirection: TextDirection.ltr,
      textAlign: textAlign ?? TextAlign.start,
    );
  }
}

// Custom Text widget with semi-bold style.
class TextSemiBold extends StatelessWidget {
  final String text;
  final Color textColor;
  final double fontSize;
  final bool isUnderLine;

  const TextSemiBold(
      {super.key,
      required this.text,
      required this.textColor,
      required this.fontSize,
      required this.isUnderLine});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: textColor,
        fontWeight: FontWeight.w600,
        fontFamily: Constants.fontFamilyName,
        fontSize: fontSize,
        decoration:
            isUnderLine ? TextDecoration.underline : TextDecoration.none,
      ),
      textDirection: TextDirection.ltr,
    );
  }
}
