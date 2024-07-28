import 'package:flutter/material.dart';

import '../constants/constants.dart';

class CustomRichText extends StatelessWidget {
  final String label;
  final String value;

  const CustomRichText({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: '$label: ',
            style: const TextStyle(
              color: Colors.grey,
              fontFamily: Constants.fontFamilyName,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
          TextSpan(
            text: value,
            style: const TextStyle(
              color: Colors.black,
              fontFamily: Constants.fontFamilyName,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
