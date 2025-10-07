import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zavolla/constants/app_colors.dart';
import 'package:zavolla/constants/app_images.dart';
import 'package:zavolla/constants/app_responsiveness.dart';
import 'package:zavolla/constants/app_sizes.dart';
import 'package:zavolla/main.dart';
import 'package:zavolla/view/screens/products/add_discount.dart';
import 'package:zavolla/view/screens/products/add_new_product.dart';
import 'package:zavolla/view/screens/products/category.dart';
import 'package:zavolla/view/screens/products/portion.dart';
import 'package:zavolla/view/widget/common_image_view_widget.dart';
import 'package:zavolla/view/widget/custom_app_bar.dart';
import 'package:zavolla/view/widget/layout_locker_widget.dart';
import 'package:zavolla/view/widget/my_button_widget.dart';
import 'package:zavolla/view/widget/my_text_widget.dart';

class Products extends StatefulWidget {
  const Products({super.key});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  int _selectedStatus = 0; // index of selected status chip

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(
        title: 'Products',
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
              children: [
                CommonImageView(
                  height: 200,
                  width: Get.width,
                  radius: 16,
                  url: dummyImg,
                  fit: BoxFit.cover,
                ),
                Container(
                  margin: AppSizes.VERTICAL,
                  height: 40,
                  child: Center(
                    child: Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: List.generate(4, (index) {
                        final statusLabels = [
                          'All Products',
                          'Categories',
                          'Portion',
                          'Add discount',
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
                              color:
                                  selected
                                      ? kTertiaryColor
                                      : Colors.transparent,
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
                if (_selectedStatus == 0) _AllProducts(),
                if (_selectedStatus == 1) Category(),
                if (_selectedStatus == 2) Portion(),
                if (_selectedStatus == 3) AddDiscount(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _AllProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: MyText(
                text: 'List of All Products',
                size: 16,
                weight: FontWeight.w600,
              ),
            ),
            SizedBox(
              width: 160,
              child: MyBorderButton(
                radius: 50,
                textSize: 13,
                buttonText: 'Add new product',
                onTap: () {
                  Get.to(() => AddNewProduct());
                },
                height: 40,
              ),
            ),
          ],
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
                      Expanded(
                        child: MyText(
                          text: '#TKT-001',
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
                          color: Color(0xffF3FCF8),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: MyText(
                          text: 'New',
                          size: 12,
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
                          text: 'Name: Burger',
                          size: 12,
                          color: kQuaternaryColor,
                        ),
                      ),
                      Expanded(
                        child: MyText(
                          textAlign: TextAlign.end,
                          text: 'Category: Burger',
                          size: 12,
                          color: kQuaternaryColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: MyText(
                          text: 'Price: \$30',
                          size: 12,
                          color: kQuaternaryColor,
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            MyText(
                              text: 'Color: ',
                              size: 12,
                              color: kQuaternaryColor,
                            ),
                            SizedBox(width: 6),
                            Icon(Icons.circle, size: 16, color: kOrangeColor),
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
                          text: 'Portion: --',
                          size: 12,
                          color: kQuaternaryColor,
                        ),
                      ),
                      Expanded(
                        child: MyText(
                          textAlign: TextAlign.end,
                          text: 'Stock: --',
                          size: 12,
                          color: kQuaternaryColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  MyBorderButton(
                    buttonText: 'Edit',
                    onTap: () {},
                    height: 40,
                    textSize: 14,
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
