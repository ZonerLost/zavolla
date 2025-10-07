import 'package:flutter/material.dart';
import 'package:zavolla/constants/app_colors.dart';
import 'package:zavolla/constants/app_images.dart';
import 'package:zavolla/constants/app_responsiveness.dart';
import 'package:zavolla/constants/app_sizes.dart';
import 'package:zavolla/main.dart';
import 'package:zavolla/view/widget/common_image_view_widget.dart';
import 'package:zavolla/view/widget/custom_app_bar.dart';
import 'package:zavolla/view/widget/layout_locker_widget.dart';
import 'package:zavolla/view/widget/my_text_widget.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  int _selectedStatus = 0; // index of selected status chip

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(
        title: 'Orders',
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
        padding: AppSizes.VERTICAL,
        physics: BouncingScrollPhysics(),
        children: [
          Container(
            margin: AppSizes.DEFAULT,
            height: 40,
            child: Center(
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                children: List.generate(4, (index) {
                  final statusLabels = [
                    'Today',
                    'Yesterday',
                    'This Week',
                    'Last week',
                  ];
                  final selected = _selectedStatus == index;
                  return GestureDetector(
                    onTap: () => setState(() => _selectedStatus = index),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: selected ? kTertiaryColor : Colors.transparent,
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(
                          color: selected ? kTertiaryColor : kBorderColor,
                          width: 1.0,
                        ),
                      ),
                      child: MyText(
                        text: statusLabels[index],
                        size: 14,
                        color: selected ? kPrimaryColor : kTertiaryColor,
                        weight: FontWeight.w500,
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
          LayoutLocker(
            child: Column(
              children: [
                SizedBox(height: 9),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText(text: 'Filter', size: 16, weight: FontWeight.w600),
                    PopupMenuButton<int>(
                      constraints: BoxConstraints(
                        minWidth: 155,
                        maxWidth: 155,
                      ),
                      offset: Offset(0, 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      itemBuilder: (context) {
                        final filterOptions = [
                          'Sales by Day',
                          'Sales by User',
                          'Sales by Category',
                          'Sales by Product',
                          'Gross Profit',
                          'Sales by Hour',
                          'Refunds',
                        ];
                        return List.generate(filterOptions.length, (index) {
                          return PopupMenuItem<int>(
                            value: index,
                            height: 30,
                            child: MyText(
                              text: filterOptions[index],
                              size: 12,
                              weight: FontWeight.w500,
                            ),
                          );
                        });
                      },
                      child: Container(
                        width: 155,
                        padding: EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(width: 1.0, color: kBlueColor),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MyText(
                              paddingLeft: 4,
                              paddingRight: 4,
                              text: 'Order by details',
                              size: 12,
                              weight: FontWeight.w500,
                              color: kBlueColor,
                            ),
                            Image.asset(
                              Assets.imagesDropdown,
                              height: 24,
                              color: kBlueColor,
                            ),
                          ],
                        ),
                      ),
                      onSelected: (value) {
                        // Handle selection
                      },
                    ),
                  ],
                ),
                SizedBox(height: 25),
                if (_selectedStatus == 0) _Today(),
                if (_selectedStatus == 1) _Today(),
                if (_selectedStatus == 2) _Today(),
                if (_selectedStatus == 3) _Today(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Today extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      padding: AppSizes.ZERO,
      physics: BouncingScrollPhysics(),
      itemCount: 10,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: const Color(0xff171A1F).withValues(alpha: .12),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          padding: EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  MyText(
                    text: '#TRX001234',
                    size: 14,
                    color: kQuaternaryColor,
                    weight: FontWeight.w600,
                    paddingRight: 12,
                  ),
                  Image.asset(
                    Assets.imagesTime,
                    height: 12,
                    color: kQuaternaryColor,
                  ),
                  Expanded(
                    child: MyText(
                      paddingLeft: 4,
                      text: '14:30 • 12/12/2025',
                      size: 12,
                      color: kQuaternaryColor,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                    decoration: BoxDecoration(
                      color: kGreenColor,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: MyText(
                      text: 'Completed',
                      size: 12,
                      lineHeight: 1.2,
                      weight: FontWeight.w500,
                      color: kPrimaryColor,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        MyText(
                          text: 'Customer:',
                          size: 12,
                          color: kQuaternaryColor,
                        ),
                        Expanded(
                          child: MyText(
                            text: 'Ali Raza',
                            size: 14,
                            paddingLeft: 4,
                            weight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        MyText(
                          text: 'Item:',
                          size: 12,
                          color: kQuaternaryColor,
                        ),
                        Expanded(
                          child: MyText(
                            paddingLeft: 4,
                            text: 'Burger',
                            size: 14,
                            weight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        MyText(
                          text: 'Total:',
                          size: 12,
                          color: kQuaternaryColor,
                        ),
                        Expanded(
                          child: MyText(
                            paddingLeft: 4,
                            text: '\$34',
                            size: 14,
                            weight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: MyText(
                      text: 'Payment method: Credit Card',
                      size: 12,
                      color: kQuaternaryColor,
                    ),
                  ),
                  Image.asset(
                    Assets.imagesCreditCard,
                    height: 14,
                    color: kQuaternaryColor,
                  ),
                  MyText(
                    paddingLeft: 6,
                    text: 'Credit Card',
                    size: 12,
                    color: kQuaternaryColor,
                  ),
                ],
              ),
            ],
          ),
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(height: 16);
      },
    );
  }
}
