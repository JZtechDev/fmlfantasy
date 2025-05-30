import 'dart:math';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/ui/views/statement/controller/statement_controller.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class StatementChart extends GetView<StatementController> {
  const StatementChart({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(StatementController());
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
      child: SizedBox(
        height: 300.h,
        child: Container(
          padding: EdgeInsets.all(10.r),
          width: Get.width,
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(5.r),
          ),
          child: Obx(() {
            if (controller.filterList.isEmpty) {
              return Center(
                child: Text(
                  'No data found',
                  style: globalTextStyle2(
                      fontSize: 12.sp,
                      color: AppColors.white,
                      fontWeight: FontWeight.w600),
                ),
              );
            } else {
              List<Map<String, dynamic>> amounts =
                  controller.filterList.value.cast<Map<String, dynamic>>();
              List<double> values =
                  amounts.map((e) => (e['amount'] as num).toDouble()).toList();

              double binWidth = 10;
              double minVal = values.reduce(min);
              double maxVal = values.reduce(max);
              int numberOfBins = ((maxVal - minVal) / binWidth).ceil();

              List<Map<String, dynamic>> histogramData =
                  List.generate(numberOfBins, (i) {
                double binStart = minVal + (i * binWidth);
                double binEnd = binStart + binWidth;
                int count =
                    values.where((v) => v >= binStart && v < binEnd).length;

                return {
                  'range': '${binStart.toInt()}-${binEnd.toInt()}',
                  'count': count,
                };
              });

              return SfCartesianChart(
                plotAreaBackgroundColor: AppColors.primary,
                primaryXAxis: CategoryAxis(
                  labelStyle: globalTextStyle2(
                      fontSize: 12.sp,
                      color: AppColors.white,
                      fontWeight: FontWeight.w600),
                ),
                primaryYAxis: NumericAxis(
                  labelStyle: globalTextStyle2(
                      fontSize: 12.sp,
                      color: AppColors.white,
                      fontWeight: FontWeight.w600),
                ),
                plotAreaBorderWidth: 0,
                tooltipBehavior: TooltipBehavior(enable: true),
                series: <CartesianSeries>[
                  ColumnSeries<Map<String, dynamic>, String>(
                    dataSource: histogramData,
                    xValueMapper: (data, _) => data['range'],
                    yValueMapper: (data, _) => data['count'],
                    pointColorMapper: (_, __) => AppColors.secondary,
                    width: 0.6,
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                ],
              );
            }
          }),
        ),
      ),
    );
  }
}
