import 'package:flutter/material.dart';
// removed get package usage; using local setState instead
import 'package:zavolla/constants/app_colors.dart';
import 'package:zavolla/constants/app_sizes.dart';
import 'package:zavolla/view/widget/custom_app_bar.dart';
import 'package:zavolla/view/widget/custom_card_widget.dart';
// removed unused imports
import 'package:zavolla/view/widget/layout_locker_widget.dart';
import 'package:zavolla/view/widget/my_text_field_widget.dart';
import 'package:zavolla/view/widget/my_text_widget.dart';

class BuildRecipes extends StatelessWidget {
  const BuildRecipes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(title: ''),
      body: ListView(
        shrinkWrap: true,
        padding: AppSizes.DEFAULT,
        physics: BouncingScrollPhysics(),
        children: [
          LayoutLocker(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                MyText(
                  paddingTop: 30,
                  text: 'Create your Recipes',
                  size: 20,
                  textAlign: TextAlign.center,
                  weight: FontWeight.w600,
                  paddingBottom: 10,
                ),
                MyText(
                  text:
                      'Link your products to ingredients so you can track stock consumption automatically.',
                  size: 14,
                  lineHeight: 1.5,
                  color: kQuaternaryColor,
                  textAlign: TextAlign.center,
                  paddingBottom: 40,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    MyText(
                      text: 'Recipe 1',
                      size: 16,
                      weight: FontWeight.w500,
                      paddingBottom: 10,
                    ),
                    CustomCard(child: _Page()),
                  ],
                ),
              ],
            ),
          ),
        ],
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
        MyTextField(labelText: 'Product', hintText: 'Select product'),
        MyTextField(labelText: 'Ingredient', hintText: 'Ingredient'),
        MyTextField(
          labelText: 'Quantity',
          hintText: 'Custom',
          marginBottom: 25,
        ),
        MyText(
          onTap: () {},
          text: '+ Add ingredient',
          size: 14,
          color: kBlueColor,
          decoration: TextDecoration.underline,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
