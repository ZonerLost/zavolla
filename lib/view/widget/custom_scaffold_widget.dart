import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zavolla/constants/app_images.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.imagesAuthBg),
          fit: BoxFit.fill,
        ),
      ),
      child: child,
    );
  }
}
