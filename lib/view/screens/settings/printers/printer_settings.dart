import 'package:flutter/material.dart';
import 'package:get/get.dart';
// removed get package usage; using local setState instead
import 'package:zavolla/constants/app_colors.dart';
import 'package:zavolla/constants/app_images.dart';
import 'package:zavolla/constants/app_sizes.dart';
import 'package:zavolla/view/screens/settings/receipt_template/receipt_template.dart';
import 'package:zavolla/view/widget/custom_app_bar.dart';
import 'package:zavolla/view/widget/custom_card_widget.dart';
// removed unused imports
import 'package:zavolla/view/widget/layout_locker_widget.dart';
import 'package:zavolla/view/widget/my_button_widget.dart';
import 'package:zavolla/view/widget/my_text_field_widget.dart';
import 'package:zavolla/view/widget/my_text_widget.dart';

class PrinterSettings extends StatelessWidget {
  const PrinterSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(title: 'Printer setting'),
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
    return ListView.builder(
      shrinkWrap: true,
      padding: AppSizes.ZERO,
      physics: BouncingScrollPhysics(),
      itemCount: 15,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.only(bottom: 14),
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
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
              Image.asset(Assets.imagesWifi, height: 24, color: kGreyColor2),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText(
                      text: 'OfficeJet Pro 9015',
                      size: 16,
                      weight: FontWeight.w500,
                      paddingBottom: 4,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: index.isOdd ? kGreyColor2 : kBlueColor,
                          ),
                        ),
                        MyText(
                          paddingLeft: 8,
                          text: index.isEven ? 'Connected' : 'Disconnected',
                          size: 14,
                          color: index.isOdd ? kGreyColor2 : kBlueColor,

                          weight: FontWeight.w500,
                        ),
                      ],
                    ),
                  ],
                ),
              ),

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
    );
  }
}
