import 'package:flutter/material.dart';
import 'package:zavolla/constants/app_images.dart';
import 'package:zavolla/constants/app_sizes.dart';
import 'package:zavolla/view/widget/custom_app_bar_widget.dart';
import 'package:zavolla/view/widget/custom_drop_down_widget.dart';
import 'package:zavolla/view/widget/layout_locker_widget.dart';
import 'package:zavolla/view/widget/my_button_widget.dart';
import 'package:zavolla/view/widget/my_text_field_widget.dart';

class AddNewProduct extends StatelessWidget {
  const AddNewProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(title: 'Add New Product'),
      body: ListView(
        shrinkWrap: true,
        padding: AppSizes.DEFAULT,
        physics: BouncingScrollPhysics(),
        children: [
          LayoutLocker(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                MyTextField(
                  prefix: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Image.asset(Assets.imagesProduct, height: 20)],
                  ),
                  labelText: 'Product name',
                  hintText: 'Burger',
                ),
                CustomDropDown(
                  prefix: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Image.asset(Assets.imagesCategory, height: 20)],
                  ),
                  labelText: 'Category',
                  hintText: 'Fast food',
                  items: ['Fast food', 'Beverages', 'Desserts'],
                  selectedValue: 'Fast food',
                  onChanged: (value) {},
                ),
                MyTextField(
                  prefix: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Image.asset(Assets.imagesPrice, height: 20)],
                  ),
                  labelText: 'Price',
                  hintText: '44',
                ),
                CustomDropDown(
                  prefix: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Image.asset(Assets.imagesColor, height: 20)],
                  ),
                  labelText: 'Color',
                  hintText: 'red',
                  items: ['red', 'green', 'blue'],
                  selectedValue: 'red',
                  onChanged: (value) {},
                ),
                CustomDropDown(
                  prefix: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Image.asset(Assets.imagesPortion, height: 20)],
                  ),
                  labelText: 'Portion',
                  hintText: '1/4',
                  items: ['1/4', '1/2', '3/4', 'Full'],
                  selectedValue: '1/4',
                  onChanged: (value) {},
                ),
                CustomDropDown(
                  prefix: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Image.asset(Assets.imagesStock, height: 20)],
                  ),
                  labelText: 'Stock',
                  hintText: '10000',
                  items: ['10000', '20000', '30000'],
                  selectedValue: '10000',
                  onChanged: (value) {},
                  marginBottom: 35,
                ),
                MyBorderButton(buttonText: 'Save', onTap: () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
