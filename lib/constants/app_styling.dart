import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppStyling {
  static BoxDecoration CUSTOM_CARD = BoxDecoration(
    color: kPrimaryColor,
    borderRadius: BorderRadius.circular(10),
    boxShadow: [
      BoxShadow(
        color: const Color(0xff171A1F).withValues(alpha: .12),
        blurRadius: 24,
        offset: const Offset(0, 0),
      ),
    ],
  );
}
