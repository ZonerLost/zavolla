import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:zavolla/constants/app_colors.dart';
import 'package:zavolla/constants/app_images.dart';
import 'package:zavolla/constants/app_sizes.dart';
import 'package:intl/intl.dart';
import 'package:zavolla/view/screens/settings/business_operations/add_suppliers.dart';
import 'package:zavolla/view/screens/settings/business_operations/build_recipes.dart';
import 'package:zavolla/view/screens/settings/business_operations/ingredient_library.dart';
import 'package:zavolla/view/widget/custom_app_bar.dart';
import 'package:zavolla/view/widget/layout_locker_widget.dart';
import 'package:zavolla/view/widget/my_button_widget.dart';
import 'package:zavolla/view/widget/my_text_field_widget.dart';
import 'package:zavolla/view/widget/my_text_widget.dart';

class Inventory extends StatefulWidget {
  const Inventory({super.key});

  @override
  State<Inventory> createState() => _InventoryState();
}

class _InventoryState extends State<Inventory> {
  int _selectedStatus = 0; // index of selected status chip

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(title: 'Inventory'),
      body: ListView(
        shrinkWrap: true,
        padding: AppSizes.DEFAULT,
        physics: BouncingScrollPhysics(),
        children: [
          Container(
            margin: AppSizes.VERTICAL,
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
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 9),
                MyTextField(
                  marginBottom: 25,
                  prefix: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Image.asset(Assets.imagesSearch, height: 20)],
                  ),
                  hintText: 'Search transactions...',
                ),
                MyText(
                  text: 'Set up your stock system',
                  size: 18,
                  textAlign: TextAlign.center,
                  weight: FontWeight.w600,
                  paddingBottom: 10,
                ),
                MyText(
                  text:
                      'Get the more out inventory management by setting up your suppliers ingredients and Recipes.it only take a few minutes',
                  size: 14,
                  color: kQuaternaryColor,
                  textAlign: TextAlign.center,
                  paddingBottom: 24,
                ),
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 16,
                  children: [
                    MyText(
                      onTap: () {
                        Get.to(() => AddSuppliers());
                      },
                      text: 'Add Suppliers',
                      size: 14,
                      color: kBlueColor,
                      decoration: TextDecoration.underline,
                      textAlign: TextAlign.center,
                      paddingBottom: 24,
                    ),
                    MyText(
                      onTap: () {
                        Get.to(() => IngredientLibrary());
                      },
                      text: 'Create ingredient library',
                      size: 14,
                      color: kBlueColor,
                      decoration: TextDecoration.underline,
                      textAlign: TextAlign.center,
                      paddingBottom: 24,
                    ),
                    MyText(
                      onTap: () {
                        Get.to(() => BuildRecipes());
                      },
                      text: 'Build recipes',
                      size: 14,
                      decoration: TextDecoration.underline,
                      color: kBlueColor,
                      textAlign: TextAlign.center,
                      paddingBottom: 24,
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: Get.width * 0.1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 12,
                    children: [
                      Expanded(
                        child: MyButton(
                          buttonText: 'Start setup wizard',
                          onTap: () {},
                          height: 40,
                          radius: 50,
                          textSize: 14,
                          bgColor: kBlueColor,
                        ),
                      ),
                      Expanded(
                        child: MyBorderButton(
                          textColor: kBlueColor,
                          textSize: 14,
                          height: 40,
                          radius: 50,
                          buttonText: 'Don’t show again',
                          onTap: () {},
                        ),
                      ),
                    ],
                  ),
                ),
                MyText(
                  paddingTop: 25,
                  text: 'Daily Summary',
                  size: 20,
                  weight: FontWeight.w600,
                  paddingBottom: 10,
                ),
                GridView.builder(
                  shrinkWrap: true,
                  padding: AppSizes.ZERO,
                  physics: BouncingScrollPhysics(),
                  itemCount: 3,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    mainAxisExtent: 130,
                  ),
                  itemBuilder: (context, index) {
                    final List<Map<String, dynamic>> summaryData = [
                      {
                        'image':
                            Assets
                                .imagesDollar, // Replace with your alert icon asset
                        'title': 'Critical stock alert',
                        'value': 'o',
                      },
                      {
                        'image': Assets.imagesGrossSale,
                        'title': 'Current stock value',
                        'value': '1267',
                      },
                      {
                        'image': Assets.imagesDollar,
                        'title': 'Item needing reorder',
                        'value': '\$150,000',
                      },
                    ];
                    final item = summaryData[index];
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(item['image'], height: 32),
                          MyText(
                            paddingTop: 8,
                            text: item['title'],
                            size: 14,
                            maxLines: 1,
                            textOverflow: TextOverflow.ellipsis,
                            color: kQuaternaryColor,
                            weight: FontWeight.w500,
                          ),
                          MyText(
                            text: item['value'],
                            size: 18,
                            maxLines: 1,
                            textOverflow: TextOverflow.ellipsis,
                            color: kBlueColor,
                            weight: FontWeight.w700,
                          ),
                        ],
                      ),
                    );
                  },
                ),
                SizedBox(height: 25),
                Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    border: Border.all(color: kBorderColor),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  height: 280,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: MyText(
                              text: 'Daily usage trends (last 7 days)',
                              size: 16,
                              weight: FontWeight.w600,
                            ),
                          ),
                          Image.asset(Assets.imagesMore, height: 20),
                        ],
                      ),
                      SizedBox(height: 12),
                      Expanded(
                        child: Builder(
                          builder: (context) {
                            // sample data for the stacked spline chart
                            final List<_ChartData> dataA = [
                              _ChartData('Jan', 3600),
                              _ChartData('Feb', 2700),
                              _ChartData('Mar', 1800),
                              _ChartData('Apr', 900),
                              _ChartData('May', 600),
                              _ChartData('Jun', 300),
                            ];
                            final List<_ChartData> dataB = [
                              _ChartData('Jan', 1800),
                              _ChartData('Feb', 1350),
                              _ChartData('Mar', 900),
                              _ChartData('Apr', 450),
                              _ChartData('May', 300),
                              _ChartData('Jun', 150),
                            ];

                            return SfCartesianChart(
                              plotAreaBorderWidth: 0,
                              primaryXAxis: CategoryAxis(
                                majorGridLines: MajorGridLines(width: 0),
                                axisLine: AxisLine(width: 0),
                                majorTickLines: MajorTickLines(width: 0),
                              ),
                              primaryYAxis: NumericAxis(
                                minimum: 0,
                                edgeLabelPlacement: EdgeLabelPlacement.shift,
                                placeLabelsNearAxisLine: false,
                                maximum: 3600,
                                interval: 900,
                                numberFormat: NumberFormat.compact(),
                                labelFormat: '{value}',
                                majorGridLines: MajorGridLines(
                                  width: 0.5,
                                  color: kBorderColor,
                                ),
                                axisLine: AxisLine(width: 0),
                                minorGridLines: MinorGridLines(width: 0),
                                majorTickLines: MajorTickLines(width: 0),
                                labelStyle: TextStyle(color: kQuaternaryColor),
                              ),
                              tooltipBehavior: TooltipBehavior(enable: true),
                              legend: Legend(
                                position: LegendPosition.bottom,
                                isVisible: true,
                                legendItemBuilder: (
                                  legendText,
                                  series,
                                  point,
                                  seriesIndex,
                                ) {
                                  return Row(
                                    spacing: 6,
                                    children: [
                                      Container(
                                        height: 8,
                                        width: 8,
                                        color:
                                            legendText == 'Revenue'
                                                ? kBlueColor
                                                : kSecondaryColor,
                                      ),
                                      MyText(text: legendText),
                                    ],
                                  );
                                },
                              ),
                              series: <CartesianSeries>[
                                SplineSeries<_ChartData, String>(
                                  dataSource: dataA,
                                  xValueMapper: (d, i) => d.x,
                                  yValueMapper: (d, i) => d.y,
                                  color: kBlueColor,
                                  splineType: SplineType.natural,
                                  width: 2,
                                  name: 'Revenue',
                                  markerSettings: MarkerSettings(
                                    isVisible: true,
                                    color: kBlueColor,
                                  ),
                                ),
                                SplineSeries<_ChartData, String>(
                                  dataSource: dataB,
                                  xValueMapper: (d, i) => d.x,
                                  yValueMapper: (d, i) => d.y,
                                  color: kSecondaryColor,
                                  splineType: SplineType.natural,
                                  width: 2,
                                  name: 'Orders',
                                  markerSettings: MarkerSettings(
                                    isVisible: true,
                                    color: kSecondaryColor,
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Simple chart data model
class _ChartData {
  final String x;
  final double y;

  _ChartData(this.x, this.y);
}
