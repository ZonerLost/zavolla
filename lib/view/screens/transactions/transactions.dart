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

class Transactions extends StatefulWidget {
  const Transactions({super.key});

  @override
  State<Transactions> createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  int _selectedStatus = 0; // index of selected status chip

  @override
  Widget build(BuildContext context) {
    final List<String> _items = ['Today', 'Last 7 Days', 'This Month'];
    return Scaffold(
      appBar: simpleAppBar(
        title: 'Transaction',
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
                MyTextField(
                  prefix: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Image.asset(Assets.imagesSearch, height: 24)],
                  ),
                  hintText: 'Search transactions...',
                ),
                MyText(
                  text: 'Filter Transactions',
                  size: 16,
                  weight: FontWeight.w600,
                  paddingBottom: 14,
                ),
                Container(
                  height: 40,
                  child: ListView(
                    shrinkWrap: true,
                    padding: AppSizes.ZERO,
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    children: [
                      ListView.separated(
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
                            onTap:
                                () => setState(() => _selectedStatus = index),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                color: selected ? kTertiaryColor : kFillColor2,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color:
                                      selected ? kTertiaryColor : kBorderColor,
                                  width: 1.0,
                                ),
                              ),
                              child: MyText(
                                text: _items[index],
                                size: 14,
                                color:
                                    selected ? kPrimaryColor : kTertiaryColor,
                                weight: FontWeight.w500,
                              ),
                            ),
                          );
                        },
                      ),

                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 8),
                        width: 130,
                        child: CustomDropDown(
                          marginBottom: 0,
                          height: 40,
                          hintText: 'Order Type',
                          items: ['Order Type'],
                          selectedValue: 'Order Type',
                          onChanged: (v) {},
                        ),
                      ),
                      Container(
                        width: 150,
                        child: CustomDropDown(
                          marginBottom: 0,
                          height: 40,
                          hintText: 'Payment Status',
                          items: ['Payment Status'],
                          selectedValue: 'Payment Status',
                          onChanged: (v) {},
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 25),
                Row(
                  spacing: 12,
                  children: [
                    SizedBox(
                      width: 130,
                      child: MyBorderButton(
                        height: 40,
                        textSize: 14,
                        borderColor: kBorderColor,
                        buttonText: 'Reset Filters',
                        onTap: () {},
                      ),
                    ),
                    SizedBox(
                      width: 130,
                      child: MyButton(
                        textSize: 14,

                        buttonText: 'Apply Filters',
                        onTap: () {},
                        height: 40,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 25),
                MyText(
                  text: 'Transaction History',
                  size: 16,
                  weight: FontWeight.w600,
                  paddingBottom: 14,
                ),
                GridView.builder(
                  shrinkWrap: true,
                  padding: AppSizes.ZERO,
                  physics: BouncingScrollPhysics(),
                  itemCount: 10,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: AppResponsiveness.isMobile(context) ? 1 : 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    mainAxisExtent: 150,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.symmetric(horizontal: 14),
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
                        mainAxisAlignment: MainAxisAlignment.center,
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
                                      text: 'FFM001',
                                      size: 16,
                                      weight: FontWeight.w600,
                                    ),
                                    MyText(
                                      text: '2023-10-27 10:30 AM',
                                      size: 12,
                                      color: kQuaternaryColor,
                                    ),
                                  ],
                                ),
                              ),
                              Icon(Icons.more_horiz),
                            ],
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
                                  color:
                                      index.isEven ? kGreenColor : kYellowColor,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: MyText(
                                  text: index.isEven ? 'Paid' : 'Pending',
                                  size: 12,
                                  color: kPrimaryColor,
                                  lineHeight: 1.2,
                                  weight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 8),
                          Row(
                            children: [
                              Expanded(
                                child: MyText(
                                  text: 'Payment: Card',
                                  size: 12,
                                  color: kQuaternaryColor,
                                ),
                              ),
                              Expanded(
                                child: MyText(
                                  text: '\$15.75',
                                  size: 16,
                                  textAlign: TextAlign.end,
                                  weight: FontWeight.w600,
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
