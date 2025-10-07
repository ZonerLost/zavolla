import 'package:flutter/material.dart';
import 'package:get/get.dart';
// removed get package usage; using local setState instead
import 'package:zavolla/constants/app_colors.dart';
import 'package:zavolla/constants/app_sizes.dart';
import 'package:zavolla/view/widget/custom_app_bar.dart';
import 'package:zavolla/view/widget/custom_card_widget.dart';
import 'package:zavolla/view/widget/custom_drop_down_widget.dart';
// removed unused imports
import 'package:zavolla/view/widget/layout_locker_widget.dart';
import 'package:zavolla/view/widget/my_button_widget.dart';
import 'package:zavolla/view/widget/my_text_field_widget.dart';
import 'package:zavolla/view/widget/my_text_widget.dart';

class IngredientLibrary extends StatelessWidget {
  const IngredientLibrary({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(title: ''),
      body: LayoutLocker(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MyText(
              paddingTop: 30,
              text: 'Add your ingredients',
              size: 20,
              textAlign: TextAlign.center,
              weight: FontWeight.w600,
              paddingBottom: 10,
            ),
            MyText(
              text:
                  'Add the ingredient you use in your recipes. Include cost price for accurate tracking.',
              size: 14,
              lineHeight: 1.5,
              color: kQuaternaryColor,
              textAlign: TextAlign.center,
              paddingBottom: 30,
            ),
            Expanded(
              child: CustomCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(child: _Page()),
                    SizedBox(height: 30),
                    MyBorderButton(
                      buttonText: 'Save',
                      onTap: () {
                        Get.back();
                      },
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

class _Page extends StatelessWidget {
  _Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: AppSizes.ZERO,
      physics: BouncingScrollPhysics(),
      children: [
        MyTextField(
          labelText: 'Ingredient Name',
          hintText: 'eg fresh food ltd',
        ),
        MyTextField(labelText: 'Base Unit', hintText: 'order@2343.com'),
        MyTextField(labelText: 'Cost Price', hintText: '027722'),
        MyTextField(
          labelText: 'PAR Level (Low Stock Alert)',
          hintText: '122 market',
        ),
        MyTextField(labelText: 'Default Purchase Size', hintText: '1L'),
        MyTextField(labelText: 'Refund Policy', hintText: 'Restock'),
        CustomDropDown(
          labelText: 'Select Supplier',
          hintText: 'Select Supplier',
          items: ['Supplier 1', 'Supplier 2', 'Supplier 3'],
          selectedValue: 'Supplier 1',
          onChanged: (value) {},
        ),
      ],
    );
  }
}
