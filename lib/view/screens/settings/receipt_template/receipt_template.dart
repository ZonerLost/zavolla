import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zavolla/constants/app_colors.dart';
import 'package:zavolla/constants/app_images.dart';
import 'package:zavolla/constants/app_responsiveness.dart';
import 'package:zavolla/constants/app_sizes.dart';
import 'package:zavolla/constants/app_styling.dart';
import 'package:zavolla/main.dart';
import 'package:zavolla/view/screens/settings/business_operations/inventory.dart';
import 'package:zavolla/view/screens/settings/printers/printers.dart';
import 'package:zavolla/view/widget/common_image_view_widget.dart';
import 'package:zavolla/view/widget/custom_app_bar.dart';
import 'package:zavolla/view/widget/custom_card_widget.dart';
import 'package:zavolla/view/widget/custom_switch_tile_widget.dart';
import 'package:zavolla/view/widget/layout_locker_widget.dart';
import 'package:zavolla/view/widget/my_button_widget.dart';
import 'package:zavolla/view/widget/my_text_field_widget.dart';
import 'package:zavolla/view/widget/my_text_widget.dart';

class ReceiptTemplate extends StatefulWidget {
  const ReceiptTemplate({super.key});

  @override
  State<ReceiptTemplate> createState() => _ReceiptTemplateState();
}

class _ReceiptTemplateState extends State<ReceiptTemplate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(title: 'Setting'),
      body: Column(
        children: [
          SizedBox(height: 30),
          Expanded(
            child: LayoutLocker(
              child: CustomCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    MyText(
                      text: 'Receipt Template',
                      size: 20,
                      textAlign: TextAlign.center,
                      weight: FontWeight.w600,
                      paddingBottom:
                          AppResponsiveness.isMobile(context) ? 20 : 30,
                    ),
                    Expanded(
                      child: ListView(
                        shrinkWrap: true,
                        padding: AppSizes.ZERO,
                        physics: BouncingScrollPhysics(),
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 14),
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: kPrimaryColor,
                              border: Border.all(color: kBorderColor),
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 4,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                MyText(
                                  text: 'Receipt Template',
                                  size: 18,
                                  paddingBottom: 10,
                                  weight: FontWeight.w600,
                                ),
                                MyText(
                                  color: kQuaternaryColor,
                                  text: 'Text to appear at the top of receipts',
                                  size: 14,
                                  paddingBottom: 8,
                                  weight: FontWeight.w500,
                                ),
                                MyTextField(
                                  marginBottom: 0,
                                  hintText:
                                      'Enter your business name, slogan, or custom message here.',
                                ),
                              ],
                            ),
                          ),

                          Container(
                            margin: EdgeInsets.only(bottom: 14),
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: kPrimaryColor,
                              border: Border.all(color: kBorderColor),
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 4,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                MyText(
                                  text: 'Footer Content',
                                  size: 18,
                                  paddingBottom: 10,
                                  weight: FontWeight.w600,
                                ),
                                MyText(
                                  color: kQuaternaryColor,
                                  text:
                                      'Text to appear at the bottom of receipts',
                                  size: 14,
                                  paddingBottom: 8,
                                  weight: FontWeight.w500,
                                ),
                                MyTextField(
                                  marginBottom: 0,
                                  hintText:
                                      'Thank you for your purchase! Visit us again soon.',
                                ),
                              ],
                            ),
                          ),

                          Container(
                            margin: EdgeInsets.only(bottom: 14),
                            padding: EdgeInsets.all(14),
                            decoration: BoxDecoration(
                              color: kPrimaryColor,
                              border: Border.all(color: kBorderColor),
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 4,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                MyText(
                                  text: 'Business Logo',
                                  size: 18,
                                  paddingBottom: 10,
                                  weight: FontWeight.w600,
                                ),
                                Center(
                                  child: CommonImageView(
                                    url: dummyImg,
                                    height: 100,
                                    width: 100,
                                    radius: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Center(
                                  child: SizedBox(
                                    width: 120,
                                    child: MyButton(
                                      textColor: kSecondaryColor,
                                      bgColor: kFillColor,
                                      buttonText: 'Change Logo',
                                      onTap: () {},
                                      height: 40,
                                      radius: 8,
                                      textSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Container(
                            margin: EdgeInsets.only(bottom: 14),
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: kPrimaryColor,
                              border: Border.all(color: kBorderColor),
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 4,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                MyText(
                                  text: 'Contact Information',
                                  size: 18,
                                  paddingBottom: 10,
                                  weight: FontWeight.w600,
                                ),
                                MyText(
                                  color: kQuaternaryColor,
                                  text: 'Business Phone Number',
                                  size: 14,
                                  paddingBottom: 8,
                                  weight: FontWeight.w500,
                                ),
                                MyTextField(hintText: '+1 (555) 123-4567'),
                                MyText(
                                  color: kQuaternaryColor,
                                  text: 'Business Email Address',
                                  size: 14,
                                  paddingBottom: 8,
                                  weight: FontWeight.w500,
                                ),
                                MyTextField(hintText: 'Contact@support.com'),
                                MyText(
                                  color: kQuaternaryColor,
                                  text: 'Website Link',
                                  size: 14,
                                  paddingBottom: 8,
                                  weight: FontWeight.w500,
                                ),
                                MyTextField(hintText: 'Contact@support.com'),
                                Container(
                                  margin: EdgeInsets.only(bottom: 14),
                                  padding: EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: kPrimaryColor,
                                    border: Border.all(color: kBorderColor),
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: 4,
                                        offset: Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      MyText(
                                        text: 'Printing Options',
                                        size: 18,
                                        paddingBottom: 10,
                                        weight: FontWeight.w600,
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                MyText(
                                                  text: 'Print QR Code',
                                                  size: 16,
                                                  paddingBottom: 8,
                                                  weight: FontWeight.w500,
                                                ),
                                                MyText(
                                                  color: kQuaternaryColor,
                                                  text:
                                                      'Include a QR code for customer feedback or website link.',
                                                  size: 14,
                                                  paddingBottom: 8,
                                                  weight: FontWeight.w500,
                                                ),
                                              ],
                                            ),
                                          ),
                                          CustomSwitch(),
                                        ],
                                      ),
                                      SizedBox(height: 16),

                                      Row(
                                        children: [
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                MyText(
                                                  text: 'Print Barcode',
                                                  size: 16,
                                                  paddingBottom: 8,
                                                  weight: FontWeight.w500,
                                                ),
                                                MyText(
                                                  color: kQuaternaryColor,
                                                  text:
                                                      'Include a scannable barcode for internal tracking.',
                                                  size: 14,
                                                  paddingBottom: 8,
                                                  weight: FontWeight.w500,
                                                ),
                                              ],
                                            ),
                                          ),
                                          CustomSwitch(),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: AppResponsiveness.isMobile(context) ? 20 : 30,
                    ),
                    MyBorderButton(buttonText: 'Save Changes', onTap: () {}),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}
