import 'package:flutter/material.dart';
import 'package:zavolla/constants/app_images.dart';
import 'package:zavolla/constants/app_responsiveness.dart';

import '../../constants/app_colors.dart';
import 'my_text_widget.dart';

class AuthHeading extends StatelessWidget {
  const AuthHeading({
    super.key,
    required this.title,
    required this.subTitle,
    this.mT,
  });
  final String? title;
  final String? subTitle;
  final double? mT;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: mT ?? 39),
        Image.asset(Assets.imagesLogo, height: 100),
        MyText(
          text: title ?? '',
          size: 24,
          textAlign: TextAlign.center,
          paddingBottom: 6,
          weight: FontWeight.w700,
        ),
        if (subTitle != null)
          MyText(
            text: subTitle ?? '',
            size: 16,
            color: kQuaternaryColor,
            weight: FontWeight.w500,
            lineHeight: 1.5,
            paddingBottom: AppResponsiveness.isMobile(context) ? 26 : 45,
            textAlign: TextAlign.center,
          ),
      ],
    );
  }
}
