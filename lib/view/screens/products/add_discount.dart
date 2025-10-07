import 'package:flutter/material.dart';
import 'package:zavolla/view/widget/my_button_widget.dart';
import 'package:zavolla/view/widget/my_text_field_widget.dart';

class AddDiscount extends StatelessWidget {
  const AddDiscount({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: 16),
        MyTextField(labelText: 'Discount name', hintText: 'Summer discount'),
        MyTextField(labelText: 'Discount Type', hintText: 'Percentage'),
        MyTextField(
          labelText: 'Discount Value',
          hintText: 'Percentage',
          marginBottom: 35,
        ),
        MyBorderButton(buttonText: 'Save', onTap: () {}),
      ],
    );
  }
}
