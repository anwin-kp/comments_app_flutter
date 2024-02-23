import 'package:flutter/material.dart';

import '../constants/colors.dart';
import 'custom_text_types.dart';

class TextWithDivider extends StatelessWidget {
  final String textToShow;
  const TextWithDivider({
    super.key,
    required this.textToShow,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(
            color: AppColors.kGrey300,
          ),
        ),
        const SizedBox(width: 20),
        TextMedium(
          text: textToShow,
          fontSize: 14,
          textColor: AppColors.kGrey600,
          isUnderLine: false,
          wantOverFlowEllipsis: false,
        ),
        const SizedBox(width: 20),
        const Expanded(
          child: Divider(color: AppColors.kGrey300),
        ),
      ],
    );
  }
}
