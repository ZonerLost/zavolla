import 'package:expandable/expandable.dart';
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
import 'package:zavolla/view/widget/custom_check_box_widget.dart';
import 'package:zavolla/view/widget/custom_drop_down_widget.dart';
import 'package:zavolla/view/widget/custom_switch_tile_widget.dart';
import 'package:zavolla/view/widget/layout_locker_widget.dart';
import 'package:zavolla/view/widget/my_button_widget.dart';
import 'package:zavolla/view/widget/my_text_field_widget.dart';
import 'package:zavolla/view/widget/my_text_widget.dart';

class CreateNewTaxRule extends StatefulWidget {
  const CreateNewTaxRule({super.key});

  @override
  State<CreateNewTaxRule> createState() => _CreateNewTaxRuleState();
}

class _CreateNewTaxRuleState extends State<CreateNewTaxRule> {
  late ExpandableController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ExpandableController(initialExpanded: false);
    _controller.addListener(() {
      setState(() {});
    });
  }

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
                      text: 'Tax Rules',
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
                                  text: 'Rule Details',
                                  size: 18,
                                  paddingBottom: 10,
                                  weight: FontWeight.w600,
                                ),
                                MyText(
                                  color: kQuaternaryColor,
                                  text: 'Tax Rule Name',
                                  size: 14,
                                  paddingBottom: 8,
                                  weight: FontWeight.w500,
                                ),
                                MyTextField(
                                  prefix: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        Assets.imagesTaxRule,
                                        height: 20,
                                      ),
                                    ],
                                  ),
                                  hintText:
                                      'Enter your business name, slogan, or custom message here.',
                                ),
                                MyText(
                                  color: kQuaternaryColor,
                                  text: 'Tax Rule Name',
                                  size: 14,
                                  paddingBottom: 8,
                                  weight: FontWeight.w500,
                                ),
                                MyTextField(
                                  prefix: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        Assets.imagesTaxRate,
                                        height: 20,
                                      ),
                                    ],
                                  ),
                                  suffix: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        Assets.imagesPercentage,
                                        height: 16,
                                      ),
                                    ],
                                  ),
                                  hintText: '20',
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
                                  text: 'Configuration',
                                  size: 18,
                                  paddingBottom: 10,
                                  weight: FontWeight.w600,
                                ),
                                MyText(
                                  color: kQuaternaryColor,
                                  text: 'Tax Type',
                                  size: 14,
                                  paddingBottom: 8,
                                  weight: FontWeight.w500,
                                ),
                                MyTextField(
                                  prefix: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(Assets.imagesVat, height: 20),
                                    ],
                                  ),
                                  hintText: 'VAT',
                                ),
                                MyText(
                                  text: 'Applicable Locations',
                                  size: 14,
                                  paddingBottom: 8,
                                  weight: FontWeight.w500,
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

                                  child: ExpandableNotifier(
                                    controller: _controller,
                                    child: ScrollOnExpand(
                                      child: ExpandablePanel(
                                        controller: _controller,
                                        theme: ExpandableThemeData(
                                          tapHeaderToExpand: true,
                                          hasIcon: false,
                                        ),
                                        header: Row(
                                          children: [
                                            Expanded(
                                              child: MyText(
                                                text: 'Select Locations',
                                                size: 16,
                                              ),
                                            ),
                                            Container(
                                              width: 90,
                                              height: 25,
                                              decoration: BoxDecoration(
                                                color: kFillColor,
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              child: Center(
                                                child: MyText(
                                                  text: '3 selected',
                                                  size: 14,
                                                  weight: FontWeight.w500,
                                                  color: kQuaternaryColor,
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 10),
                                            RotatedBox(
                                              quarterTurns:
                                                  _controller.expanded ? 2 : 0,
                                              child: Image.asset(
                                                Assets.imagesDropdown,
                                                height: 20,
                                              ),
                                            ),
                                          ],
                                        ),
                                        collapsed: SizedBox(),
                                        expanded: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(
                                                top: 12,
                                                bottom: 6,
                                              ),
                                              height: 1,
                                              color: kBorderColor,
                                            ),
                                            ...List.generate(6, (index) {
                                              final locations = [
                                                'New York Office',
                                                'London Branch',
                                                'Berlin HQ',
                                                'Sydney Hub',
                                                'San Francisco Studio',
                                                'Online Storefront',
                                              ];
                                              return Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                      vertical: 6,
                                                    ),
                                                child: Row(
                                                  spacing: 8,
                                                  children: [
                                                    CustomCheckBox(
                                                      isActive: index.isEven,
                                                      onTap: () {},
                                                    ),
                                                    Expanded(
                                                      child: MyText(
                                                        text: locations[index],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            }),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),

                                Row(
                                  children: [
                                    Image.asset(
                                      Assets.imagesActive,
                                      height: 20,
                                    ),
                                    Expanded(
                                      child: MyText(
                                        size: 16,
                                        paddingLeft: 10,
                                        text: 'Activation Status',
                                        weight: FontWeight.w500,
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
                    SizedBox(
                      height: AppResponsiveness.isMobile(context) ? 20 : 30,
                    ),
                    Row(
                      spacing: 12,
                      children: [
                        Expanded(
                          child: MyBorderButton(
                            buttonText: 'Save Changes',
                            onTap: () {},
                          ),
                        ),
                        Expanded(
                          child: MyBorderButton(
                            borderColor: kBorderColor,
                            buttonText: 'Save Rule',
                            onTap: () {},
                          ),
                        ),
                      ],
                    ),
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
