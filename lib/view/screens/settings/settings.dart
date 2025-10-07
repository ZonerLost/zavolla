import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zavolla/constants/app_colors.dart';
import 'package:zavolla/constants/app_images.dart';
import 'package:zavolla/constants/app_responsiveness.dart';
import 'package:zavolla/constants/app_sizes.dart';
import 'package:zavolla/main.dart';
import 'package:zavolla/view/screens/settings/business_operations/inventory.dart';
import 'package:zavolla/view/screens/settings/printers/printers.dart';
import 'package:zavolla/view/screens/settings/tax_rules/tax_rules.dart';
import 'package:zavolla/view/widget/common_image_view_widget.dart';
import 'package:zavolla/view/widget/custom_app_bar.dart';
import 'package:zavolla/view/widget/custom_switch_tile_widget.dart';
import 'package:zavolla/view/widget/layout_locker_widget.dart';
import 'package:zavolla/view/widget/my_text_widget.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  int _selectedStatus = 0; // index of selected status chip

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(
        title: 'Setting',
        haveLeading: false,
        actions: [
          Center(child: Image.asset(Assets.imagesNotification, height: 36)),
          SizedBox(width: 16),
          Center(
            child: CommonImageView(
              height: 36,
              width: 36,
              radius: 100,
              url: dummyImg,
            ),
          ),
          SizedBox(
            width:
                AppResponsiveness.isMobile(context)
                    ? 20
                    : AppResponsiveness.isTablet(context)
                    ? 70
                    : 100,
          ),
        ],
      ),
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
                  paddingBottom: 14,
                  text: 'Hardware & Peripherals',
                  size: 18,
                  weight: FontWeight.w700,
                ),
                ListView.separated(
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 0);
                  },
                  shrinkWrap: true,
                  padding: AppSizes.ZERO,
                  physics: BouncingScrollPhysics(),
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    final List<Map<String, dynamic>> summaryData = [
                      {
                        'image':
                            Assets.imagesPrinter, // Make sure this asset exists
                        'title': 'Printers',
                        'value':
                            'Manage Bluetooth & WiFi connections for receipt and kitchen printers.',
                      },
                    ];
                    final item = summaryData[index];
                    return GestureDetector(
                      onTap: () => Get.to(() => Printers()),
                      child: Container(
                        decoration: BoxDecoration(
                          color: kPrimaryColor,
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
                            Image.asset(item['image'], height: 24),
                            SizedBox(width: 14),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  MyText(
                                    text: item['title'],
                                    size: 16,
                                    weight: FontWeight.w500,
                                    paddingBottom: 4,
                                  ),
                                  MyText(
                                    text: item['value'],
                                    color: kQuaternaryColor,
                                  ),
                                ],
                              ),
                            ),
                            Image.asset(Assets.imagesArrowNext, height: 20),
                          ],
                        ),
                      ),
                    );
                  },
                ),

                ListView.separated(
                  separatorBuilder: (context, index) {
                    return Container(height: 1, color: kBorderColor);
                  },
                  shrinkWrap: true,
                  padding: AppSizes.ZERO,
                  physics: BouncingScrollPhysics(),
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    final List<Map<String, dynamic>> summaryData = [
                      {
                        'title': 'Bluetooth',
                        'value': 'Enable Bluetooth for device discovery.',
                      },
                      {
                        'title': 'Wi-Fi',
                        'value': 'Enable Wi-Fi for network device connections.',
                      },
                    ];
                    final item = summaryData[index];
                    return Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 14,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                MyText(
                                  text: item['title'],
                                  size: 16,
                                  weight: FontWeight.w500,
                                  paddingBottom: 4,
                                ),
                                MyText(
                                  text: item['value'],
                                  color: kQuaternaryColor,
                                ),
                              ],
                            ),
                          ),
                          CustomSwitch(value: false, onChanged: (value) {}),
                        ],
                      ),
                    );
                  },
                ),
                MyText(
                  paddingTop: 25,
                  paddingBottom: 14,
                  text: 'Business Operations',
                  size: 18,
                  weight: FontWeight.w700,
                ),
                ListView.separated(
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 0);
                  },
                  shrinkWrap: true,
                  padding: AppSizes.ZERO,
                  physics: BouncingScrollPhysics(),
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    final List<Map<String, dynamic>> summaryData = [
                      {
                        'image':
                            Assets
                                .imagesInventoryIcon, // Replace with your inventory image asset
                        'title': 'Inventory',
                        'value': 'You can get the recipe track',
                      },
                      {
                        'image':
                            Assets
                                .imagesTaxSettings, // Replace with your tax image asset
                        'title': 'Tax Settings',
                        'value':
                            'Configure tax rates, exemptions, and reporting rules.',
                      },
                    ];
                    final item = summaryData[index];
                    return GestureDetector(
                      onTap: () {
                        if (index == 0) {
                          Get.to(() => Inventory());
                        } else if (index == 1) {
                          Get.to(() => TaxRules());
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: kPrimaryColor,
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
                            Image.asset(item['image'], height: 24),
                            SizedBox(width: 14),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  MyText(
                                    text: item['title'],
                                    size: 16,
                                    weight: FontWeight.w500,
                                    paddingBottom: 4,
                                  ),
                                  MyText(
                                    text: item['value'],
                                    color: kQuaternaryColor,
                                  ),
                                ],
                              ),
                            ),
                            Image.asset(Assets.imagesArrowNext, height: 20),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                ListView.separated(
                  separatorBuilder: (context, index) {
                    return Container(height: 1, color: kBorderColor);
                  },
                  shrinkWrap: true,
                  padding: AppSizes.ZERO,
                  physics: BouncingScrollPhysics(),
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    final List<Map<String, dynamic>> summaryData = [
                      {
                        'title': 'Offline Mode',
                        'value':
                            'Allow transactions to be processed without internet connection.',
                      },
                      {
                        'title': 'Auto Print Receipts',
                        'value':
                            'Automatically print customer receipts after each transaction.',
                      },
                    ];
                    final item = summaryData[index];
                    return Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 14,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                MyText(
                                  text: item['title'],
                                  size: 16,
                                  weight: FontWeight.w500,
                                  paddingBottom: 4,
                                ),
                                MyText(
                                  text: item['value'],
                                  color: kQuaternaryColor,
                                ),
                              ],
                            ),
                          ),
                          CustomSwitch(value: false, onChanged: (value) {}),
                        ],
                      ),
                    );
                  },
                ),
                MyText(
                  paddingTop: 25,
                  paddingBottom: 14,
                  text: 'Users & Location',
                  size: 18,
                  weight: FontWeight.w700,
                ),
                ListView.separated(
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 0);
                  },
                  shrinkWrap: true,
                  padding: AppSizes.ZERO,
                  physics: BouncingScrollPhysics(),
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    final List<Map<String, dynamic>> summaryData = [
                      {
                        'image':
                            Assets
                                .imagesUserRoles, // Replace with your user role image asset
                        'title': 'User Roles',
                        'value':
                            'Define and manage staff access levels and permissions.',
                      },
                      {
                        'image':
                            Assets
                                .imagesLocationIcon, // Replace with your location image asset
                        'title': 'Location',
                        'value':
                            'Set your primary store address, currency, and time zone.',
                      },
                    ];
                    final item = summaryData[index];
                    return Container(
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
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
                          Image.asset(item['image'], height: 24),
                          SizedBox(width: 14),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                MyText(
                                  text: item['title'],
                                  size: 16,
                                  weight: FontWeight.w500,
                                  paddingBottom: 4,
                                ),
                                MyText(
                                  text: item['value'],
                                  color: kQuaternaryColor,
                                ),
                              ],
                            ),
                          ),
                          Image.asset(Assets.imagesArrowNext, height: 20),
                        ],
                      ),
                    );
                  },
                ),
                MyText(
                  paddingTop: 25,
                  paddingBottom: 14,
                  text: 'System',
                  size: 18,
                  weight: FontWeight.w700,
                ),
                ListView.separated(
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 0);
                  },
                  shrinkWrap: true,
                  padding: AppSizes.ZERO,
                  physics: BouncingScrollPhysics(),
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    final List<Map<String, dynamic>> summaryData = [
                      {
                        'image':
                            Assets
                                .imagesAdvanceSettings, // Replace with your advanced settings image asset
                        'title': 'Advanced Settings',
                        'value':
                            'View system information, manage updates, and perform diagnostics.',
                      },
                    ];
                    final item = summaryData[index];
                    return Container(
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
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
                          Image.asset(item['image'], height: 24),
                          SizedBox(width: 14),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                MyText(
                                  text: item['title'],
                                  size: 16,
                                  weight: FontWeight.w500,
                                  paddingBottom: 4,
                                ),
                                MyText(
                                  text: item['value'],
                                  color: kQuaternaryColor,
                                ),
                              ],
                            ),
                          ),
                          Image.asset(Assets.imagesArrowNext, height: 20),
                        ],
                      ),
                    );
                  },
                ),

                SizedBox(height: 60),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
