import 'package:flutter/material.dart';
import 'package:zavolla/constants/app_responsiveness.dart';
import 'package:zavolla/constants/app_styling.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.child});

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          AppResponsiveness.isMobile(context)
              ? EdgeInsets.all(20)
              : EdgeInsets.all(30),
      decoration: AppStyling.CUSTOM_CARD,
      child: child,
    );
  }
}
