import 'package:flutter/material.dart';
import 'package:get/get.dart';
// removed get package usage; using local setState instead
import 'package:zavolla/constants/app_colors.dart';
import 'package:zavolla/constants/app_images.dart';
import 'package:zavolla/constants/app_sizes.dart';
import 'package:zavolla/view/screens/settings/printers/printer_settings.dart';
import 'package:zavolla/view/screens/settings/receipt_template/receipt_template.dart';
import 'package:zavolla/view/widget/custom_app_bar.dart';
import 'package:zavolla/view/widget/custom_card_widget.dart';
// removed unused imports
import 'package:zavolla/view/widget/layout_locker_widget.dart';
import 'package:zavolla/view/widget/my_button_widget.dart';
import 'package:zavolla/view/widget/my_text_field_widget.dart';
import 'package:zavolla/view/widget/my_text_widget.dart';

class Printers extends StatelessWidget {
  const Printers({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(title: 'Printers'),
      body: LayoutLocker(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 30),
            Expanded(child: CustomCard(child: _Page())),
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
        MyText(
          text: 'Connected Printers',
          size: 24,
          textAlign: TextAlign.center,
          weight: FontWeight.w600,
          paddingBottom: 10,
        ),
        MyText(
          text: 'Manage your active and available printers.',
          size: 14,
          lineHeight: 1.5,
          color: kQuaternaryColor,
          textAlign: TextAlign.center,
          paddingBottom: 30,
        ),
        ListView.builder(
          shrinkWrap: true,
          padding: AppSizes.ZERO,
          physics: BouncingScrollPhysics(),
          itemCount: 4,
          itemBuilder: (context, index) {
            final List<Map<String, dynamic>> printers = [
              {
                'name': 'Kitchen Star Printer',
                'status': 'Connected',
                'type': 'WiFi',
                'statusColor': Colors.green,
              },
              {
                'name': 'Front Desk Bluetooth',
                'status': 'Disconnected',
                'type': 'Bluetooth',
                'statusColor': Colors.grey,
              },
              {
                'name': 'Bar Receipt Printer',
                'status': 'Error',
                'type': 'WiFi',
                'statusColor': Colors.red,
              },
              {
                'name': 'Portable Handheld',
                'status': 'Pending',
                'type': 'Bluetooth',
                'statusColor': Colors.orange,
              },
            ];
            final printer = printers[index];
            return Container(
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
              child: Row(
                children: [
                  Image.asset(
                    index.isEven ? Assets.imagesWifi : Assets.imagesBluetooth,
                    height: 24,
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText(
                          text: printer['name']!,
                          size: 16,
                          weight: FontWeight.w500,
                          paddingBottom: 4,
                        ),
                        Row(
                          children: [
                            Image.asset(
                              printer['status'] == 'Connected'
                                  ? Assets.imagesConnected
                                  : printer['status'] == 'Disconnected'
                                  ? Assets.imagesDisconnect
                                  : printer['status'] == 'Error'
                                  ? Assets.imagesError
                                  : Assets.imagesPending,
                              height: 16,
                            ),
                            MyText(
                              paddingLeft: 8,
                              text: '${printer['status']}',
                              size: 14,
                              color:
                                  printer['status'] == 'Connected'
                                      ? kGreenColor
                                      : printer['status'] == 'Disconnected'
                                      ? kOrangeColor
                                      : printer['status'] == 'Error'
                                      ? kRedColor
                                      : kBlueColor,
                              weight: FontWeight.w500,
                            ),
                            Expanded(
                              child: MyText(
                                paddingLeft: 14,
                                text: '(${printer['type']})',
                                size: 12,
                                color: kQuaternaryColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Image.asset(Assets.imagesPrint, height: 36),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => ReceiptTemplate());
                    },
                    child: Image.asset(Assets.imagesEdit, height: 36),
                  ),
                ],
              ),
            );
          },
        ),
        MyText(
          onTap: () {
            Get.to(() => PrinterSettings());
          },
          paddingTop: 12,
          text: 'Add New Printer',
          size: 18,
          weight: FontWeight.w500,
          textAlign: TextAlign.center,
          paddingBottom: 30,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              MyButton(buttonText: 'Add Bluetooth Printer', onTap: () {}),
              SizedBox(height: 12),
              MyBorderButton(buttonText: 'Add Wi-Fi Printer', onTap: () {}),
            ],
          ),
        ),
      ],
    );
  }
}
