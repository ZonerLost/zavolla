import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:zavolla/constants/app_colors.dart';
import 'package:zavolla/constants/app_images.dart';
import 'package:zavolla/view/widget/my_text_widget.dart';

AppBar simpleAppBar({
  bool haveLeading = true,
  String? title,
  Widget? leadingWidget,
  bool? centerTitle = true,
  List<Widget>? actions,
  Color? bgColor,
  double? leadingWidth,
  Color? contentColor,
  VoidCallback? onLeadingTap,
}) {
  return AppBar(
    backgroundColor: bgColor ?? kPrimaryColor,
    centerTitle: centerTitle,
    automaticallyImplyLeading: false,
    titleSpacing: 0.0,
    leadingWidth: leadingWidth ?? null,
    leading:
        haveLeading
            ? leadingWidget ??
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: GestureDetector(
                        onTap: onLeadingTap ?? () => Get.back(),
                        child: Image.asset(Assets.imagesArrowBack, height: 24),
                      ),
                    ),
                  ],
                )
            : null,
    title: MyText(
      text: title ?? '',
      size: 18,
      color: contentColor ?? kSecondaryColor,
      weight: FontWeight.w600,
    ),
    actions: actions,
    elevation: 0,
    shape: Border(bottom: BorderSide(color: kBorderColor, width: 1)),
  );
}

// AppBar customAppBar({
//   bool haveLeading = true,
//   String? title,
//   Widget? leadingWidget,
//   bool? centerTitle = true,
//   List<Widget>? actions,
//   Color? bgColor,
//   VoidCallback? onLeadingTap,
// }) {
//   return AppBar(
//     backgroundColor: Colors.transparent,
//     centerTitle: centerTitle,
//     automaticallyImplyLeading: false,
//     titleSpacing: 16.0,
//     leading: haveLeading
//         ? leadingWidget ??
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   GestureDetector(
//                     onTap: onLeadingTap ?? () => Get.back(),
//                     child: Image.asset(Assets.imagesClose, height: 24),
//                   ),
//                 ],
//               )
//         : null,
//     title: MyText(
//       text: title ?? '',
//       size: 14,
//       color: kTertiaryColor,
//       weight: FontWeight.w600,
//     ),
//     actions: actions,
//   );
// }
