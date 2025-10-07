import 'package:flutter/material.dart';
import 'package:zavolla/constants/app_colors.dart';
import 'package:zavolla/view/widget/my_text_widget.dart';

class MyTextField extends StatelessWidget {
  MyTextField({
    Key? key,
    this.controller,
    this.hintText,
    this.labelText,
    this.onChanged,
    this.isObSecure = false,
    this.marginBottom = 20.0,
    this.maxLines = 1,
    this.labelSize,
    this.prefix,
    this.suffix,
    this.isReadOnly,
    this.onTap,
    this.fillColor,
  }) : super(key: key);

  final String? labelText, hintText;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final bool? isObSecure, isReadOnly;
  final double? marginBottom;
  final int? maxLines;
  final double? labelSize;
  final Widget? prefix, suffix;
  final VoidCallback? onTap;
  final Color? fillColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: marginBottom!),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (labelText != null)
            MyText(
              text: labelText ?? '',
              paddingBottom: 8,
              size: 14,
              weight: FontWeight.w500,
            ),
          TextFormField(
            onTap: onTap,
            textAlignVertical:
                prefix != null || suffix != null
                    ? TextAlignVertical.center
                    : null,
            cursorColor: kTertiaryColor,
            maxLines: maxLines,
            readOnly: isReadOnly ?? false,
            controller: controller,
            onChanged: onChanged,
            textInputAction: TextInputAction.next,
            obscureText: isObSecure!,
            obscuringCharacter: '*',
            style: TextStyle(fontSize: 14, color: kTertiaryColor),
            decoration: InputDecoration(
              filled: true,
              fillColor: fillColor ?? kFillColor,
              prefixIcon: prefix,
              suffixIcon: suffix,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 15,
                vertical: maxLines! > 1 ? 15 : 0,
              ),
              hintText: hintText,
              hintStyle: TextStyle(fontSize: 14, color: kHintColor),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: kBorderColor, width: 1),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: kBorderColor, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: kSecondaryColor, width: 1),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: kRedColor, width: 1),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: kRedColor, width: 1),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
