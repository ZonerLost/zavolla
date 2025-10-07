import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zavolla/constants/app_colors.dart';
import 'package:zavolla/constants/app_images.dart';
import 'package:zavolla/constants/app_responsiveness.dart';
import 'package:zavolla/view/screens/dashboard/dashboard.dart';
import 'package:zavolla/view/screens/orders/orders.dart';
import 'package:zavolla/view/screens/products/products.dart';
import 'package:zavolla/view/screens/settings/settings.dart';
import 'package:zavolla/view/screens/table/table.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;
  void _getCurrentIndex(int index) => setState(() {
    _currentIndex = index;
  });
  final List<Map<String, dynamic>> _items = [
    {'icon': Assets.imagesDashboard, 'label': 'Dashboard'},
    {'icon': Assets.imagesProducts, 'label': 'Products'},
    {'icon': Assets.imagesOrder, 'label': 'Orders'},
    {'icon': Assets.imagesTable, 'label': 'Table'},
    {'icon': Assets.imagesSettings, 'label': 'Settings'},
  ];

  final _key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final List<Widget> _screens = [
      Dashboard(),
      Products(),
      Orders(),
      Tables(),
      Settings(),
    ];
    return Scaffold(
      key: _key,
      body: _screens[_currentIndex],
      bottomNavigationBar: _buildNavBar(_items),
    );
  }

  Widget _buildNavBar(List<Map<String, dynamic>> _items) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width:
              AppResponsiveness.isMobile(context)
                  ? Get.width
                  : AppResponsiveness.isTablet(context)
                  ? 600
                  : AppResponsiveness.isDesktop(context)
                  ? 800
                  : Get.width,
          height: 65,
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: kTertiaryColor.withValues(alpha: .12),
                blurRadius: 20,
                offset: Offset(0, -4),
              ),
            ],
            color: kPrimaryColor,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(_items.length, (index) {
              var data = _items[index];
              final isSelected = _currentIndex == index;
              return Expanded(
                child: GestureDetector(
                  onTap: () => _getCurrentIndex(index),
                  child: Container(
                    decoration: BoxDecoration(
                      color: isSelected ? kSecondaryColor : Colors.transparent,
                      borderRadius: BorderRadius.only(
                        topLeft:
                            index == 0
                                ? Radius.circular(12)
                                : Radius.circular(8),
                        topRight:
                            index == _items.length - 1
                                ? Radius.circular(12)
                                : Radius.circular(8),
                        bottomLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 4),
                          child: ImageIcon(
                            AssetImage(data["icon"]),
                            size: 20,
                            color: isSelected ? kPrimaryColor : kGreyColor2,
                          ),
                        ),
                        Text(
                          data["label"],
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: isSelected ? kPrimaryColor : kGreyColor2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
