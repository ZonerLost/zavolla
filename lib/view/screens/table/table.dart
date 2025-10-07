import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zavolla/constants/app_colors.dart';
import 'package:zavolla/constants/app_images.dart';
import 'package:zavolla/constants/app_responsiveness.dart';
import 'package:zavolla/constants/app_sizes.dart';
import 'package:zavolla/main.dart';
import 'package:zavolla/view/widget/common_image_view_widget.dart';
import 'package:zavolla/view/widget/custom_app_bar.dart';
import 'package:zavolla/view/widget/custom_dialog_widget.dart';
import 'package:zavolla/view/widget/custom_drop_down_widget.dart';
import 'package:zavolla/view/widget/layout_locker_widget.dart';
import 'package:zavolla/view/widget/my_button_widget.dart';
import 'package:zavolla/view/widget/my_text_field_widget.dart';
import 'package:zavolla/view/widget/my_text_widget.dart';

class Tables extends StatefulWidget {
  const Tables({super.key});

  @override
  State<Tables> createState() => _TablesState();
}

class _TablesState extends State<Tables> {
  int _selectedAreaIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(
        title: 'POSIFY Retail',
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
                CommonImageView(
                  height: 200,
                  width: Get.width,
                  radius: 16,
                  url: dummyImg,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: MyText(
                        text: 'Table',
                        size: 16,
                        weight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      width: 120,
                      child: MyBorderButton(
                        radius: 50,
                        textSize: 14,
                        buttonText: 'Add Table',
                        onTap: () {
                          Get.dialog(_AddTable());
                        },
                        height: 40,
                      ),
                    ),
                    SizedBox(width: 12),
                    SizedBox(
                      width: 140,
                      child: MyBorderButton(
                        radius: 50,
                        textSize: 14,
                        buttonText: 'Add new Area',
                        onTap: () {
                          Get.dialog(_AddTableArea());
                        },
                        height: 40,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 25),
                MyText(
                  text: 'Area',
                  size: 16,
                  weight: FontWeight.w600,
                  paddingBottom: 12,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ...List.generate(3, (index) {
                            final seatLabels = [
                              '2 person seat',
                              '4 person seat',
                              '2 person seat',
                            ];
                            final selected = _selectedAreaIndex == index;
                            return GestureDetector(
                              onTap:
                                  () => setState(
                                    () => _selectedAreaIndex = index,
                                  ),
                              child: Container(
                                height: 40,
                                alignment: Alignment.centerLeft,
                                margin: EdgeInsets.only(bottom: 6),
                                decoration: BoxDecoration(
                                  color:
                                      selected
                                          ? kOrangeColor
                                          : Colors.transparent,
                                  border: Border.all(
                                    color:
                                        selected ? kOrangeColor : kBorderColor,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                child: MyText(
                                  text: seatLabels[index],
                                  size: 14,
                                  color:
                                      selected
                                          ? kPrimaryColor
                                          : kQuaternaryColor,
                                  weight: FontWeight.w500,
                                ),
                              ),
                            );
                          }),
                        ],
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      flex: 7,
                      child: Container(
                        color: kSecondaryColor,
                        padding: EdgeInsets.all(20),
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          padding: EdgeInsets.zero,
                          itemCount: 10,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10,
                                mainAxisExtent: 50,
                              ),
                          itemBuilder: (context, index) {
                            return Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Container(
                                  height: Get.height,
                                  width: Get.width,
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border.all(
                                      color: kPrimaryColor,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: MyText(
                                      text: 'Table ${index + 1}',
                                      size: 14,
                                      weight: FontWeight.w500,
                                      color: kPrimaryColor,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: -4,
                                  right: -4,
                                  child: Container(
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(
                                      color: kOrangeColor,
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black12,
                                          blurRadius: 4,
                                          offset: Offset(0, 2),
                                        ),
                                      ],
                                    ),
                                    child: Icon(
                                      Icons.close,
                                      color: kPrimaryColor,
                                      size: 14,
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _AddTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      child: ListView(
        shrinkWrap: true,
        padding: AppSizes.DEFAULT,
        physics: BouncingScrollPhysics(),
        children: [
          MyText(
            text: 'Add Tables',
            size: 18,
            weight: FontWeight.w600,
            paddingBottom: 25,
          ),
          CustomDropDown(
            labelText: 'Shape',
            hintText: 'Square',
            items: ['Square'],
            selectedValue: 'Square',
            onChanged: (value) {},
          ),
          CustomDropDown(
            labelText: 'Starting table number',
            hintText: 'Starting table number',
            items: ['Starting table number', '1', '2', '3'],
            selectedValue: '1',
            onChanged: (value) {},
          ),
          CustomDropDown(
            labelText: 'Count (max 25)',
            hintText: 'Count (max 25)',
            items: ['Count (max 25)', '1', '2', '3'],
            selectedValue: '1',
            onChanged: (value) {},
            marginBottom: 25,
          ),
          Row(
            spacing: 10,
            children: [
              Expanded(
                child: MyButton(
                  buttonText: 'Save',
                  onTap: () {
                    Get.back();
                  },
                ),
              ),
              Expanded(
                child: MyBorderButton(
                  buttonText: 'Cancel',
                  onTap: () {
                    Get.back();
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _AddTableArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      child: ListView(
        shrinkWrap: true,
        padding: AppSizes.DEFAULT,
        physics: BouncingScrollPhysics(),
        children: [
          MyText(
            text: 'Add New Table Area Name',
            size: 18,
            weight: FontWeight.w600,
            paddingBottom: 25,
          ),
          MyTextField(
            labelText: 'Table area name',
            hintText: 'Enter table area  name',
          ),
          CustomDropDown(
            labelText: 'Starting table number',
            hintText: 'Starting table number',
            items: ['Starting table number', '1', '2', '3'],
            selectedValue: '1',
            onChanged: (value) {},
          ),
          CustomDropDown(
            labelText: 'Count (max 25)',
            hintText: 'Count (max 25)',
            items: ['Count (max 25)', '1', '2', '3'],
            selectedValue: '1',
            onChanged: (value) {},
            marginBottom: 25,
          ),
          Row(
            spacing: 10,
            children: [
              Expanded(
                child: MyButton(
                  buttonText: 'Save',
                  onTap: () {
                    Get.back();
                  },
                ),
              ),
              Expanded(
                child: MyBorderButton(
                  buttonText: 'Cancel',
                  onTap: () {
                    Get.back();
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
