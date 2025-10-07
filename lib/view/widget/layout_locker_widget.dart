import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/instance_manager.dart';
import 'package:zavolla/constants/app_responsiveness.dart';

class LayoutLocker extends StatelessWidget {
  const LayoutLocker({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width:
            AppResponsiveness.isMobile(context)
                ? Get.width
                : AppResponsiveness.isTablet(context)
                ? 600
                : AppResponsiveness.isDesktop(context)
                ? 800
                : Get.width,
        child: child,
      ),
    );
  }
}

class BodyLayoutLocker extends StatelessWidget {
  const BodyLayoutLocker({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Center(child: SizedBox(width: Get.width * 0.85, child: child));
  }
}
