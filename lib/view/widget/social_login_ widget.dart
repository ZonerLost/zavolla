import 'package:flutter/material.dart';
import 'package:zavolla/view/widget/my_text_widget.dart';
import '../../constants/app_colors.dart';

class SocialLogin extends StatelessWidget {
  const SocialLogin({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  final String icon;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        border: Border.all(width: 1.0, color: kBorderColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(10),
          splashColor: kBorderColor,
          highlightColor: kBorderColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              spacing: 8,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(icon, height: 20),
                Expanded(
                  child: MyText(
                    text: title,
                    size: 14,
                    weight: FontWeight.w500,
                    maxLines: 1,
                    textOverflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
