import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'my_text_widget.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_images.dart';

AppBar simpleAppBar({
  bool haveLeading = true,
  bool centerTitle = true,
  String? title,
  List<Widget>? actions,
}) {
  return AppBar(
    titleSpacing: 0.0,
    backgroundColor: kPrimaryColor,
    automaticallyImplyLeading: false,
    centerTitle: centerTitle,
    leading:
        haveLeading
            ? Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => Get.back(),
                  child: Image.asset(Assets.imagesArrowBack, height: 28),
                ),
              ],
            )
            : null,
    title: MyText(
      text: title ?? '',
      size: 18,
      color: kTertiaryColor,
      weight: FontWeight.w600,
    ),
    actions: actions,
  );
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
      height: 80,
      width: Get.width,
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0, 1.0],
          colors: [Color(0xffFCC167), Color(0xffF0A22D)],
        ),
      ),
      child: child,
    );
  }
}
