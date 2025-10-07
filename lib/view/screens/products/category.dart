import 'package:flutter/material.dart';
import 'package:zavolla/constants/app_colors.dart';
import 'package:zavolla/constants/app_images.dart';
import 'package:zavolla/constants/app_responsiveness.dart';
import 'package:zavolla/view/widget/custom_drop_down_widget.dart';
import 'package:zavolla/view/widget/custom_switch_tile_widget.dart';
import 'package:zavolla/view/widget/my_text_field_widget.dart';
import 'package:zavolla/view/widget/my_text_widget.dart';

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  bool _showAdd = false;

  @override
  Widget build(BuildContext context) {
    return _showAdd
        ? _AddNewCategory(onSave: () => setState(() => _showAdd = false))
        : Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 100),
            GestureDetector(
              onTap: () => setState(() => _showAdd = true),
              child: Image.asset(Assets.imagesAdd, height: 38),
            ),
            MyText(
              paddingTop: 14,
              text: 'Add new category',
              size: 24,
              weight: FontWeight.w600,
              textAlign: TextAlign.center,
              paddingBottom: 8,
            ),
            MyText(
              text:
                  'Look like you haven’t created any categories yet.\nTap above to add one.',
              size: 18,
              lineHeight: 1.5,
              color: kQuaternaryColor,
              textAlign: TextAlign.center,
            ),
          ],
        );
  }
}

class _AddNewCategory extends StatefulWidget {
  const _AddNewCategory({Key? key, this.onSave}) : super(key: key);

  final VoidCallback? onSave;

  @override
  State<_AddNewCategory> createState() => _AddNewCategoryState();
}

int _selectedIndex = -1;

class _AddNewCategoryState extends State<_AddNewCategory> {
  final List<String> _Categories = [
    Assets.imagesBurger,
    Assets.imagesCoffee,
    Assets.imagesChicken,
    Assets.imagesBakery,
    Assets.imagesDonut,
    Assets.imagesSalt,
    Assets.imagesCake,
    Assets.imagesPudding,
    Assets.imagesNoodels,
    Assets.imagesFries,
    Assets.imagesFish,
    Assets.imagesPizza,
    Assets.imagesMilkShake,
    Assets.imagesToast,
    Assets.imagesHotDog,
    Assets.imagesMeat,
    Assets.imagesFruit,
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: 16),
        MyTextField(
          labelText: 'Group Name',
          hintText: 'group name',
          prefix: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Image.asset(Assets.imagesProduct, height: 24)],
          ),
        ),
        CustomSwitchTile(
          title: 'Enable Auto Layout',
          value: true,
          onChanged: (val) {},
        ),
        MyText(
          paddingTop: 20,
          paddingBottom: 12,
          text: 'Choose Category',
          size: 14,
          weight: FontWeight.w500,
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: _Categories.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: AppResponsiveness.isMobile(context) ? 4 : 6,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            mainAxisExtent: 60,
          ),
          itemBuilder: (context, index) {
            final selected = _selectedIndex == index;
            return GestureDetector(
              onTap: () => setState(() => _selectedIndex = index),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 200),
                decoration: BoxDecoration(
                  color: selected ? kSecondaryColor : kFillColor,

                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Image.asset(
                    _Categories[index],
                    height: 32,
                    color: selected ? kPrimaryColor : null,
                  ),
                ),
              ),
            );
          },
        ),
        SizedBox(height: 20),
        CustomDropDown(
          marginBottom: 35,
          labelText: 'Assign to print route?',
          hintText: 'Select route',
          items: ['Select route'],
          selectedValue: 'Select route',
          onChanged: (val) {},
        ),
        // MyBorderButton(
        //   buttonText: 'Save',
        //   onTap: () {
        //     if (widget.onSave != null) widget.onSave!();
        //   },
        // ),
      ],
    );
  }
}
