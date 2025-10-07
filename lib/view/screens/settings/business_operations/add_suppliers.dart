import 'package:flutter/material.dart';
import 'package:get/get.dart';
// removed get package usage; using local setState instead
import 'package:zavolla/constants/app_colors.dart';
import 'package:zavolla/constants/app_sizes.dart';
import 'package:zavolla/view/widget/custom_app_bar.dart';
import 'package:zavolla/view/widget/custom_card_widget.dart';
// removed unused imports
import 'package:zavolla/view/widget/layout_locker_widget.dart';
import 'package:zavolla/view/widget/my_button_widget.dart';
import 'package:zavolla/view/widget/my_text_field_widget.dart';
import 'package:zavolla/view/widget/my_text_widget.dart';

class AddSuppliers extends StatelessWidget {
  const AddSuppliers({super.key});

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
              text: 'Add your suppliers',
              size: 20,
              textAlign: TextAlign.center,
              weight: FontWeight.w600,
              paddingBottom: 10,
            ),
            MyText(
              text:
                  'Add the supplier you purchase ingredient from. You can always add more.',
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
          labelText: 'Supplier Name',
          hintText: 'eg. Fresh food itll',
        ),
        MyTextField(labelText: 'Email', hintText: 'Order@23.com'),
        MyTextField(labelText: 'Phone Number', hintText: '23234565'),
        MyTextField(labelText: 'Address', hintText: '1223 acard'),
        MyTextField(
          labelText: 'Notes',
          hintText: 'Delivery days, minimum order, special target...',
          maxLines: 3,
        ),
      ],
    );
  }
}
