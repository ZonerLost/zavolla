import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zavolla/constants/app_images.dart';
import 'package:zavolla/view/screens/auth/login.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    splashScreenHandler();
  }

  void splashScreenHandler() {
    Timer(Duration(seconds: 2), () => Get.offAll(() => Login()));
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        height: Get.height,
        width: Get.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.imagesSplashBg),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(child: Image.asset(Assets.imagesLogo, height: 160)),
      ),
    );
  }
}
