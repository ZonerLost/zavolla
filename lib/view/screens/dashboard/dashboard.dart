import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:zavolla/constants/app_colors.dart';
import 'package:zavolla/constants/app_images.dart';
import 'package:zavolla/constants/app_responsiveness.dart';
import 'package:zavolla/constants/app_sizes.dart';
import 'package:zavolla/main.dart';
import 'package:zavolla/view/screens/inventory_management/inventory_management.dart';
import 'package:zavolla/view/screens/sales/sales.dart';
import 'package:zavolla/view/screens/transactions/transactions.dart';
import 'package:zavolla/view/widget/common_image_view_widget.dart';
import 'package:zavolla/view/widget/custom_app_bar.dart';
import 'package:zavolla/view/widget/layout_locker_widget.dart';
import 'package:zavolla/view/widget/my_text_widget.dart';
import 'package:intl/intl.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedStatus = 0; // index of selected status chip

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(
        title: 'Dashboard',
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
                MyText(
                  paddingTop: 25,
                  paddingBottom: 16,
                  text: 'Daily Summary',
                  size: 20,
                  weight: FontWeight.w700,
                ),
                GridView.builder(
                  shrinkWrap: true,
                  padding: AppSizes.ZERO,
                  physics: BouncingScrollPhysics(),
                  itemCount: 4,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    mainAxisExtent: 130,
                  ),
                  itemBuilder: (context, index) {
                    final List<Map<String, dynamic>> summaryData = [
                      {
                        'image': Assets.imagesGrossSale,
                        'title': 'Gross sales this week',
                        'value': '\$150,000',
                      },
                      {
                        'image': Assets.imagesGrossSale,
                        'title': 'Average transaction today',
                        'value': '1267',
                      },
                      {
                        'image': Assets.imagesDollar,
                        'title': 'Gross salary Today',
                        'value': '\$150,000',
                      },
                      {
                        'image': Assets.imagesDollar,
                        'title': 'Transactions Today',
                        'value': '1267',
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
                          Image.asset(item['image'], height: 36),
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
                            size: 20,
                            weight: FontWeight.w700,
                          ),
                        ],
                      ),
                    );
                  },
                ),
                SizedBox(height: 25),
                if (!AppResponsiveness.isMobile(context))
                  Row(
                    spacing: 12,
                    children: [
                      Expanded(
                        child: Container(
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
                                      text: 'Gross Sales Trends',
                                      size: 16,
                                      maxLines: 1,
                                      textOverflow: TextOverflow.ellipsis,
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
                                        majorGridLines: MajorGridLines(
                                          width: 0,
                                        ),
                                        axisLine: AxisLine(width: 0),
                                        majorTickLines: MajorTickLines(
                                          width: 0,
                                        ),
                                      ),
                                      primaryYAxis: NumericAxis(
                                        minimum: 0,
                                        edgeLabelPlacement:
                                            EdgeLabelPlacement.shift,
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
                                        minorGridLines: MinorGridLines(
                                          width: 0,
                                        ),
                                        majorTickLines: MajorTickLines(
                                          width: 0,
                                        ),
                                        labelStyle: TextStyle(
                                          color: kQuaternaryColor,
                                        ),
                                      ),
                                      tooltipBehavior: TooltipBehavior(
                                        enable: true,
                                      ),
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
                      ),
                      Expanded(
                        child: Container(
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
                                      text: 'Top Products',
                                      size: 16,
                                      maxLines: 1,
                                      textOverflow: TextOverflow.ellipsis,
                                      weight: FontWeight.w600,
                                    ),
                                  ),
                                  Image.asset(Assets.imagesMore, height: 20),
                                ],
                              ),
                              Expanded(
                                child: Builder(
                                  builder: (context) {
                                    return SfCircularChart(
                                      tooltipBehavior: TooltipBehavior(
                                        enable: true,
                                      ),
                                      legend: Legend(
                                        position: LegendPosition.bottom,
                                        isVisible: true,
                                        overflowMode:
                                            LegendItemOverflowMode.wrap,
                                        alignment: ChartAlignment.center,
                                        height: '30',
                                        legendItemBuilder: (
                                          legendText,
                                          series,
                                          point,
                                          seriesIndex,
                                        ) {
                                          // Prefer reading color from the series' dataSource (works with pointColorMapper)
                                          Color itemColor = kGreyColor;
                                          try {
                                            final dynSeries = series as dynamic;
                                            final ds = dynSeries.dataSource;
                                            if (ds is List) {
                                              for (final e in ds) {
                                                try {
                                                  final lbl =
                                                      (e as dynamic).label;
                                                  if (lbl == legendText) {
                                                    final c =
                                                        (e as dynamic).color;
                                                    if (c is Color) {
                                                      itemColor = c;
                                                      break;
                                                    }
                                                  }
                                                } catch (_) {}
                                              }
                                            }
                                          } catch (_) {}

                                          // fallback to point.color
                                          if (itemColor == kGreyColor) {
                                            try {
                                              final dynPoint = point as dynamic;
                                              final pColor = dynPoint.color;
                                              if (pColor is Color)
                                                itemColor = pColor;
                                            } catch (_) {}
                                          }

                                          // fallback to series.color
                                          if (itemColor == kGreyColor) {
                                            try {
                                              final dynSeries2 =
                                                  series as dynamic;
                                              final sColor = dynSeries2.color;
                                              if (sColor is Color)
                                                itemColor = sColor;
                                            } catch (_) {}
                                          }

                                          return Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Container(
                                                height: 8,
                                                width: 8,
                                                decoration: BoxDecoration(
                                                  color: itemColor,
                                                  borderRadius:
                                                      BorderRadius.circular(2),
                                                ),
                                              ),
                                              SizedBox(width: 6),
                                              MyText(
                                                text: legendText,
                                                size: 10,
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                      series: <
                                        DoughnutSeries<_PieChartData, String>
                                      >[
                                        DoughnutSeries<_PieChartData, String>(
                                          dataSource: [
                                            _PieChartData(
                                              'Coffee Latte',
                                              30,
                                              kBlueColor,
                                            ),
                                            _PieChartData(
                                              'Breakfast Burrito',
                                              25,
                                              kSecondaryColor,
                                            ),
                                            _PieChartData(
                                              'Classic Burger',
                                              20,
                                              Color(0xffFFC658),
                                            ),
                                            _PieChartData(
                                              'Green Tea',
                                              15,
                                              Color(0xff82CA9D),
                                            ),
                                            _PieChartData(
                                              'Chocolate Cake',
                                              10,
                                              kOrangeColor,
                                            ),
                                          ],
                                          radius: '85%',
                                          innerRadius: '72%',

                                          xValueMapper:
                                              (_PieChartData data, _) =>
                                                  data.label,
                                          yValueMapper:
                                              (_PieChartData data, _) =>
                                                  data.value,
                                          pointColorMapper:
                                              (_PieChartData data, _) =>
                                                  data.color,
                                          dataLabelMapper:
                                              (_PieChartData data, _) =>
                                                  '${data.value}%',
                                          dataLabelSettings: DataLabelSettings(
                                            isVisible: false,
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
                      ),
                    ],
                  )
                else ...[
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
                                text: 'Gross Sales Trends',
                                size: 16,
                                maxLines: 1,
                                textOverflow: TextOverflow.ellipsis,
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
                                  labelStyle: TextStyle(
                                    color: kQuaternaryColor,
                                  ),
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
                  SizedBox(height: 16),
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
                                text: 'Top Products',
                                size: 16,
                                maxLines: 1,
                                textOverflow: TextOverflow.ellipsis,
                                weight: FontWeight.w600,
                              ),
                            ),
                            Image.asset(Assets.imagesMore, height: 20),
                          ],
                        ),
                        Expanded(
                          child: Builder(
                            builder: (context) {
                              return SfCircularChart(
                                tooltipBehavior: TooltipBehavior(enable: true),
                                legend: Legend(
                                  position: LegendPosition.bottom,
                                  isVisible: true,
                                  overflowMode: LegendItemOverflowMode.wrap,
                                  alignment: ChartAlignment.center,
                                  height: '30',
                                  legendItemBuilder: (
                                    legendText,
                                    series,
                                    point,
                                    seriesIndex,
                                  ) {
                                    // Prefer reading color from the series' dataSource (works with pointColorMapper)
                                    Color itemColor = kGreyColor;
                                    try {
                                      final dynSeries = series as dynamic;
                                      final ds = dynSeries.dataSource;
                                      if (ds is List) {
                                        for (final e in ds) {
                                          try {
                                            final lbl = (e as dynamic).label;
                                            if (lbl == legendText) {
                                              final c = (e as dynamic).color;
                                              if (c is Color) {
                                                itemColor = c;
                                                break;
                                              }
                                            }
                                          } catch (_) {}
                                        }
                                      }
                                    } catch (_) {}

                                    // fallback to point.color
                                    if (itemColor == kGreyColor) {
                                      try {
                                        final dynPoint = point as dynamic;
                                        final pColor = dynPoint.color;
                                        if (pColor is Color) itemColor = pColor;
                                      } catch (_) {}
                                    }

                                    // fallback to series.color
                                    if (itemColor == kGreyColor) {
                                      try {
                                        final dynSeries2 = series as dynamic;
                                        final sColor = dynSeries2.color;
                                        if (sColor is Color) itemColor = sColor;
                                      } catch (_) {}
                                    }

                                    return Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Container(
                                          height: 8,
                                          width: 8,
                                          decoration: BoxDecoration(
                                            color: itemColor,
                                            borderRadius: BorderRadius.circular(
                                              2,
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 6),
                                        MyText(text: legendText, size: 10),
                                      ],
                                    );
                                  },
                                ),
                                series: <DoughnutSeries<_PieChartData, String>>[
                                  DoughnutSeries<_PieChartData, String>(
                                    dataSource: [
                                      _PieChartData(
                                        'Coffee Latte',
                                        30,
                                        kBlueColor,
                                      ),
                                      _PieChartData(
                                        'Breakfast Burrito',
                                        25,
                                        kSecondaryColor,
                                      ),
                                      _PieChartData(
                                        'Classic Burger',
                                        20,
                                        Color(0xffFFC658),
                                      ),
                                      _PieChartData(
                                        'Green Tea',
                                        15,
                                        Color(0xff82CA9D),
                                      ),
                                      _PieChartData(
                                        'Chocolate Cake',
                                        10,
                                        kOrangeColor,
                                      ),
                                    ],
                                    radius: '85%',
                                    innerRadius: '72%',

                                    xValueMapper:
                                        (_PieChartData data, _) => data.label,
                                    yValueMapper:
                                        (_PieChartData data, _) => data.value,
                                    pointColorMapper:
                                        (_PieChartData data, _) => data.color,
                                    dataLabelMapper:
                                        (_PieChartData data, _) =>
                                            '${data.value}%',
                                    dataLabelSettings: DataLabelSettings(
                                      isVisible: false,
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
                MyText(
                  paddingTop: 25,
                  paddingBottom: 16,
                  text: 'Quick Actions',
                  size: 20,
                  weight: FontWeight.w700,
                ),
                ListView.separated(
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 16);
                  },
                  shrinkWrap: true,
                  padding: AppSizes.ZERO,
                  physics: BouncingScrollPhysics(),
                  itemCount: 3,

                  itemBuilder: (context, index) {
                    final List<Map<String, dynamic>> summaryData = [
                      {
                        'image': Assets.imagesSales,
                        'title': 'Sales by users today',
                        'value': 'Manage customer orders',
                      },
                      {
                        'image': Assets.imagesTransaction,
                        'title': 'Transactions',
                        'value': 'Review sales history',
                      },
                      {
                        'image': Assets.imagesInventory,
                        'title': 'Inventory Management',
                        'value': 'Review details',
                      },
                    ];
                    final item = summaryData[index];
                    return GestureDetector(
                      onTap: () {
                        if (index == 0) {
                          Get.to(() => Sales());
                        } else if (index == 1) {
                          Get.to(() => Transactions());
                        } else if (index == 2) {
                          Get.to(() => InventoryManagement());
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.circular(12),
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
                        padding: EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 14,
                        ),
                        child: Row(
                          children: [
                            Image.asset(item['image'], height: 24),
                            SizedBox(width: 14),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  MyText(
                                    text: item['title'],
                                    size: 16,
                                    weight: FontWeight.w500,
                                    paddingBottom: 4,
                                  ),
                                  MyText(
                                    text: item['value'],
                                    color: kQuaternaryColor,
                                  ),
                                ],
                              ),
                            ),
                            Image.asset(Assets.imagesArrowNext, height: 20),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(height: 60),
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

class _PieChartData {
  final String label;
  final double value;
  final Color color;
  _PieChartData(this.label, this.value, this.color);
}
