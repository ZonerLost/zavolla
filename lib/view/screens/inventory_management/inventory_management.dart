import 'package:flutter/material.dart';
import 'package:zavolla/constants/app_colors.dart';
import 'package:zavolla/constants/app_images.dart';
import 'package:zavolla/constants/app_responsiveness.dart';
import 'package:zavolla/constants/app_sizes.dart';
import 'package:zavolla/main.dart';
import 'package:zavolla/view/widget/common_image_view_widget.dart';
import 'package:zavolla/view/widget/custom_app_bar.dart';
import 'package:zavolla/view/widget/layout_locker_widget.dart';
import 'package:zavolla/view/widget/my_button_widget.dart';
import 'package:zavolla/view/widget/my_text_field_widget.dart';
import 'package:zavolla/view/widget/my_text_widget.dart';

class InventoryManagement extends StatefulWidget {
  const InventoryManagement({super.key});

  @override
  State<InventoryManagement> createState() => _InventoryManagementState();
}

class _InventoryManagementState extends State<InventoryManagement> {
  int _selectedStatus = 0; // index of selected status chip

  @override
  Widget build(BuildContext context) {
    final List<String> _items = [
      'All Categories',
      'Vegetables',
      'Meats',
      'Dairy',
      'Grains',
      'Condiments',
      'Beverages',
      'Desserts',
    ];
    return Scaffold(
      appBar: simpleAppBar(
        title: 'Inventory Management',
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
              children: [
                MyTextField(
                  prefix: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Image.asset(Assets.imagesSearch, height: 24)],
                  ),
                  hintText: 'Search inventory items',
                ),
                Container(
                  height: 40,
                  child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return SizedBox(width: 8);
                    },
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: _items.length,
                    itemBuilder: (context, index) {
                      final selected = _selectedStatus == index;
                      return GestureDetector(
                        onTap: () => setState(() => _selectedStatus = index),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color:
                                selected ? kTertiaryColor : Colors.transparent,
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(
                              color: selected ? kTertiaryColor : kBorderColor,
                              width: 1.0,
                            ),
                          ),
                          child: MyText(
                            text: _items[index],
                            size: 14,
                            color: selected ? kPrimaryColor : kTertiaryColor,
                            weight: FontWeight.w500,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 25),
                GridView.builder(
                  shrinkWrap: true,
                  padding: AppSizes.ZERO,
                  physics: BouncingScrollPhysics(),
                  itemCount: 10,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: AppResponsiveness.isMobile(context) ? 1 : 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    mainAxisExtent: 180,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
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
                      padding: EdgeInsets.all(14),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: MyText(
                                  text: 'Burger Buns',
                                  size: 16,
                                  weight: FontWeight.w600,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: kTertiaryColor.withValues(alpha: 0.05),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: MyText(
                                  text: 'Grains',
                                  size: 12,
                                  color: kQuaternaryColor,
                                  lineHeight: 1.2,
                                  weight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 12),
                          Row(
                            children: [
                              Expanded(
                                child: MyText(
                                  text: 'Current Stock:',
                                  size: 12,
                                  color: kQuaternaryColor,
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  spacing: 6,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    MyText(
                                      textAlign: TextAlign.end,
                                      text: '150',
                                      size: 16,
                                      weight: FontWeight.w700,
                                    ),
                                    if (index.isEven)
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 12,
                                          vertical: 4,
                                        ),
                                        decoration: BoxDecoration(
                                          color: kRedColor,
                                          borderRadius: BorderRadius.circular(
                                            50,
                                          ),
                                        ),
                                        child: MyText(
                                          text: 'Low Stock',
                                          size: 12,
                                          color: kPrimaryColor,
                                          lineHeight: 1.2,
                                          weight: FontWeight.w500,
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
                                  text: 'Minimum Threshold:',
                                  size: 12,
                                  color: kQuaternaryColor,
                                ),
                              ),
                              Expanded(
                                child: MyText(
                                  text: '50',
                                  size: 14,
                                  textAlign: TextAlign.end,
                                  weight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Row(
                            spacing: 12,
                            children: [
                              Expanded(
                                flex: 4,
                                child: MyBorderButton(
                                  buttonText: '150',
                                  onTap: () {},
                                  height: 40,
                                  textSize: 14,
                                ),
                              ),
                              Expanded(
                                flex: 6,
                                child: MyButton(
                                  buttonText: 'Update Stock',
                                  onTap: () {},
                                  height: 40,
                                  textSize: 14,
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
