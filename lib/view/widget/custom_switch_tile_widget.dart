import 'package:flutter/cupertino.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:zavolla/constants/app_colors.dart';
import 'package:zavolla/view/widget/my_text_widget.dart';

class CustomSwitchTile extends StatelessWidget {
  final String title;
  final bool value;
  final ValueChanged<bool>? onChanged;

  const CustomSwitchTile({
    required this.title,
    this.value = false,
    this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = ValueNotifier<bool>(value);
    return Row(
      children: [
        Expanded(child: MyText(text: title, weight: FontWeight.w500, size: 14)),
        AdvancedSwitch(
          controller: controller,
          activeColor: kSecondaryColor,
          inactiveColor: kFillColor,
          borderRadius: BorderRadius.circular(50),
          width: 35.0,
          height: 20.0,
          enabled: true,
          disabledOpacity: 0.5,
          onChanged: (newValue) {
            if (onChanged != null) {
              onChanged!(newValue);
            }
          },
        ),
      ],
    );
  }
}

class CustomSwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool>? onChanged;

  const CustomSwitch({this.value = false, this.onChanged, Key? key})
    : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = ValueNotifier<bool>(value);
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: kSecondaryColor, width: 2.0),
        borderRadius: BorderRadius.circular(50),
      ),
      child: AdvancedSwitch(
        controller: controller,
        activeColor: kBlueColor,
        inactiveColor: kFillColor,
        borderRadius: BorderRadius.circular(50),
        width: 35.0,
        height: 20.0,
        enabled: true,
        disabledOpacity: 0.5,
        onChanged: (newValue) {
          if (onChanged != null) {
            onChanged!(newValue);
          }
        },
      ),
    );
  }
}
