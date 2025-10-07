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
import 'package:zavolla/view/screens/settings/tax_rules/create_new_tax_rule.dart';
import 'package:zavolla/view/widget/common_image_view_widget.dart';
import 'package:zavolla/view/widget/custom_app_bar.dart';
import 'package:zavolla/view/widget/custom_card_widget.dart';
import 'package:zavolla/view/widget/custom_switch_tile_widget.dart';
import 'package:zavolla/view/widget/layout_locker_widget.dart';
import 'package:zavolla/view/widget/my_button_widget.dart';
import 'package:zavolla/view/widget/my_text_widget.dart';

class TaxRules extends StatefulWidget {
  const TaxRules({super.key});

  @override
  State<TaxRules> createState() => _TaxRulesState();
}

class _TaxRulesState extends State<TaxRules> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(title: 'Setting'),
      body: Column(
        children: [
          SizedBox(height: 30),
          Expanded(
            child: LayoutLocker(
              child: Container(
                decoration: AppStyling.CUSTOM_CARD,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    MyText(
                      paddingTop: AppResponsiveness.isMobile(context) ? 20 : 30,
                      text: 'Tax Rules',
                      size: 20,
                      textAlign: TextAlign.center,
                      weight: FontWeight.w600,
                      paddingBottom:
                          AppResponsiveness.isMobile(context) ? 20 : 30,
                    ),
                    Expanded(
                      child: ListView.separated(
                        separatorBuilder: (context, index) {
                          return Container(height: 12);
                        },
                        shrinkWrap: true,
                        padding:
                            AppResponsiveness.isMobile(context)
                                ? EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 10,
                                )
                                : EdgeInsets.symmetric(
                                  horizontal: 30,
                                  vertical: 10,
                                ),
                        physics: BouncingScrollPhysics(),
                        itemCount: 7,
                        itemBuilder: (context, index) {
                          final List<Map<String, dynamic>> items = [
                            {
                              'title': 'Standard Sales Tax',
                              'value': '7.5% - Sales Tax',
                              'active': true,
                            },
                            {
                              'title': 'Service Charge (Dine-in)',
                              'value': '10% - Service Fee',
                              'active': true,
                            },
                            {
                              'title': 'Food & Beverage Tax',
                              'value': '5% - Special Tax',
                              'active': false,
                            },
                            {
                              'title': 'Service Charge (Dine-in)',
                              'value': '10% - Service Fee',
                              'active': true,
                            },
                            {
                              'title': 'Food & Beverage Tax',
                              'value': '5% - Special Tax',
                              'active': false,
                            },
                            {
                              'title': 'Service Charge (Dine-in)',
                              'value': '10% - Service Fee',
                              'active': true,
                            },
                            {
                              'title': 'Food & Beverage Tax',
                              'value': '5% - Special Tax',
                              'active': false,
                            },
                          ];
                          final item = items[index];
                          return Container(
                            decoration: BoxDecoration(
                              color: kPrimaryColor,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(
                                    0xff171A1F,
                                  ).withValues(alpha: .12),
                                  blurRadius: 12,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            padding: EdgeInsets.symmetric(
                              vertical: 20,
                              horizontal: 14,
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      MyText(
                                        text: item['title'],
                                        size: 16,
                                        weight: FontWeight.w500,
                                        paddingBottom: 14,
                                      ),
                                      MyText(
                                        text: item['value'],
                                        color: kQuaternaryColor,
                                      ),
                                      if (item['active']) ...[
                                        SizedBox(height: 8),
                                        Row(
                                          spacing: 8,
                                          children: [
                                            Image.asset(
                                              Assets.imagesActive,
                                              height: 16,
                                            ),
                                            MyText(
                                              text: 'Active',
                                              color: kGreenColor,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ],
                                  ),
                                ),
                                CustomSwitch(
                                  value: false,
                                  onChanged: (value) {},
                                ),
                                SizedBox(width: 20),
                                Image.asset(Assets.imagesEditIcon, height: 20),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          AppResponsiveness.isMobile(context)
                              ? EdgeInsets.all(20)
                              : EdgeInsets.all(30),
                      child: MyBorderButton(
                        buttonText: '+ Create New Tax Rule',
                        onTap: () {
                          Get.to(() => CreateNewTaxRule());
                        },
                      ),
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
