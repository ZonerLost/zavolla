import 'package:flutter/material.dart';
import 'package:zavolla/constants/app_colors.dart';
import 'package:zavolla/constants/app_images.dart';
import 'package:zavolla/constants/app_responsiveness.dart';
import 'package:zavolla/constants/app_sizes.dart';
import 'package:zavolla/main.dart';
import 'package:zavolla/view/widget/common_image_view_widget.dart';
import 'package:zavolla/view/widget/custom_app_bar.dart';
import 'package:zavolla/view/widget/custom_drop_down_widget.dart';
import 'package:zavolla/view/widget/layout_locker_widget.dart';
import 'package:zavolla/view/widget/my_button_widget.dart';
import 'package:zavolla/view/widget/my_text_field_widget.dart';
import 'package:zavolla/view/widget/my_text_widget.dart';

class Sales extends StatefulWidget {
  const Sales({super.key});

  @override
  State<Sales> createState() => _SalesState();
}

class _SalesState extends State<Sales> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(
        title: 'Sales Today',
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
        padding: AppSizes.VERTICAL,
        physics: BouncingScrollPhysics(),
        children: [
          LayoutLocker(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  spacing: 14,
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          border: Border.all(width: 1.0, color: kBorderColor),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                spacing: 4,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  MyText(
                                    text: 'Total Revenue',
                                    size: 12,
                                    color: kQuaternaryColor,
                                  ),
                                  MyText(
                                    text: '\$12,450.75',
                                    size: 16,
                                    weight: FontWeight.w600,
                                  ),
                                ],
                              ),
                            ),
                            Image.asset(Assets.imagesMoney, height: 24),
                          ],
                        ),
                      ),
                    ),

                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          border: Border.all(width: 1.0, color: kBorderColor),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                spacing: 4,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  MyText(
                                    text: 'Orders',
                                    size: 12,
                                    color: kQuaternaryColor,
                                  ),
                                  MyText(
                                    text: '158 Orders',
                                    size: 16,
                                    color: kOrangeColor,
                                    weight: FontWeight.w600,
                                  ),
                                ],
                              ),
                            ),
                            Image.asset(Assets.imagesOrders, height: 14),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 14),
                Row(
                  children: [
                    Expanded(
                      child: MyText(
                        text: 'Today\'s Orders',
                        size: 16,
                        weight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      width: 150,
                      child: CustomDropDown(
                        height: 40,
                        marginBottom: 0,
                        hintText: 'All Users',
                        items: ['All Users'],
                        selectedValue: 'All Users',
                        onChanged: (value) {},
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 14),

                GridView.builder(
                  shrinkWrap: true,
                  padding: AppSizes.ZERO,
                  physics: BouncingScrollPhysics(),
                  itemCount: 10,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: AppResponsiveness.isMobile(context) ? 1 : 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    mainAxisExtent: 220,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(16),
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  spacing: 4,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    MyText(
                                      text: '#FFM-20230523-001',
                                      size: 16,
                                      weight: FontWeight.w600,
                                    ),
                                    MyText(
                                      text: 'Alice Wonderland',
                                      size: 12,
                                      color: kQuaternaryColor,
                                    ),
                                  ],
                                ),
                              ),
                              MyText(
                                text: '12:30 PM',
                                size: 10,
                                color: kQuaternaryColor,
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 12),
                            height: 1,
                            color: kBorderColor,
                          ),
                          Expanded(
                            child: ListView.separated(
                              separatorBuilder: (context, index) {
                                return SizedBox(height: 4);
                              },
                              shrinkWrap: true,
                              padding: AppSizes.ZERO,
                              itemCount: 3,
                              physics: BouncingScrollPhysics(),
                              itemBuilder: (context, index) {
                                final items = [
                                  'Classic Burger (x1)',
                                  'Large Fries (x1)',
                                  'Strawberry Milkshake (x1)',
                                ];
                                return MyText(text: items[index], size: 12);
                              },
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 12),
                            height: 1,
                            color: kBorderColor,
                          ),

                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1.0,
                                    color: kBorderColor,
                                  ),

                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: MyText(
                                  text:
                                      index % 3 == 0
                                          ? 'Delivered'
                                          : index % 3 == 1
                                          ? 'Preparing'
                                          : 'Ready for Pickup',
                                  size: 12,
                                  lineHeight: 1.2,
                                  weight: FontWeight.w500,
                                ),
                              ),
                              Expanded(
                                child: MyText(
                                  text: '\$18.50',
                                  textAlign: TextAlign.end,
                                  size: 16,
                                  weight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
