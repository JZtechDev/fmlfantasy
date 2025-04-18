import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/model/account_details_model.dart';
import 'package:fmlfantasy/ui/components/inner_appbar.dart';
import 'package:fmlfantasy/ui/views/statement/controller/statement_controller.dart';
import 'package:fmlfantasy/ui/views/statement/widgets/transaction.dart';
import 'package:fl_chart/fl_chart.dart';

class StatementView extends GetView<StatementController> {
  const StatementView({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(StatementController());
    return Scaffold(
      backgroundColor: AppColors.grey,
      appBar: const AppBarInner(title: 'Statement'),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 15.w, right: 15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(15.h),
              Obx(() {
                if (controller.accountDetailsList.isEmpty) {
                  return const CircularProgressIndicator(
                    color: AppColors.primary,
                  );
                }
                AccountDetailsModel data = controller.accountDetailsList.first;
                return Row(
                  children: [
                    Obx(
                      () => CircleAvatar(
                          radius: 40.r,
                          backgroundColor: AppColors.white,
                          backgroundImage: NetworkImage(data.imageUrl!.value)),
                    ),
                    horizontalSpace(10.w),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${data.firstName} ${data.lastName}',
                            style: globalTextStyle(fontSize: 16.sp),
                          ),
                          Text(
                            '232',
                            style: globalTextStyle(
                                fontSize: 12.sp, color: AppColors.textGray),
                          ),
                        ]),
                  ],
                );
              }),
              verticalSpace(10.h),
              const Divider(
                color: AppColors.borderColor,
              ),
              Text(
                'Statement'.tr,
                style: globalTextStyle(fontSize: 24.sp),
              ),
              verticalSpace(10.h),
              SizedBox(
                height: 300.h,
                child: Container(
                  padding: EdgeInsets.all(10.r),
                  width: Get.width,
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(5.r)),
                  child: Column(
                    children: [
                      Expanded(
                        child: Obx(
                          () => LineChart(
                            LineChartData(
                              borderData: FlBorderData(
                                show: true,
                              ),
                              backgroundColor: Colors.transparent,
                              gridData: const FlGridData(
                                show: true,
                              ),
                              lineBarsData: [
                                LineChartBarData(
                                  barWidth: 2,
                                  color: AppColors.primary,
                                  spots: List.generate(
                                    controller.filterList.length,
                                    (index) => FlSpot(index.toDouble(),
                                        controller.filterList[index]['amount']),
                                  ),
                                  isCurved: true,
                                ),
                              ],
                              titlesData: FlTitlesData(
                                topTitles: const AxisTitles(
                                  sideTitles: SideTitles(showTitles: false),
                                ),
                                rightTitles: const AxisTitles(
                                  sideTitles: SideTitles(showTitles: false),
                                ),
                                bottomTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: false,
                                    getTitlesWidget: (value, meta) {
                                      int index = value.toInt();
                                      if (index <
                                          controller.filterList.length) {
                                        return Text(
                                          controller.filterList[index]['amount']
                                              .toString(),
                                          style: globalTextStyle2(
                                              fontSize: 12.sp,
                                              color: AppColors.textGray),
                                        );
                                      } else {
                                        return const SizedBox.shrink();
                                      }
                                    },
                                    reservedSize: 20.w,
                                    interval: 1,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      verticalSpace(10.h),
                      Container(
                        padding: EdgeInsets.only(
                            left: 5.w, right: 5.w, bottom: 5.h, top: 5.h),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: AppColors.borderColor, width: 1),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Obx(
                                () => GestureDetector(
                                  onTap: () {
                                    controller.filterGraphDateValue('1Day');
                                  },
                                  child: Container(
                                    padding: EdgeInsets.only(
                                        left: 8.w,
                                        right: 8.w,
                                        bottom: 8.h,
                                        top: 8.h),
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(2.5.r),
                                      color: controller.selectedFilter.value ==
                                              '1Day'
                                          ? AppColors.primary
                                          : AppColors.white,
                                      border: Border.all(
                                          color: AppColors.borderColor),
                                    ),
                                    child: Text(
                                      '1D',
                                      style: globalTextStyle(
                                        fontSize: 10.sp,
                                        color:
                                            controller.selectedFilter.value ==
                                                    '1Day'
                                                ? AppColors.white
                                                : AppColors.dark,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            horizontalSpace(5.w),
                            Obx(
                              () => Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    controller.filterGraphDateValue('7Days');
                                  },
                                  child: Container(
                                    padding: EdgeInsets.only(
                                        left: 8.w,
                                        right: 8.w,
                                        bottom: 8.h,
                                        top: 8.h),
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(2.5.r),
                                      color: controller.selectedFilter.value ==
                                              '7Days'
                                          ? AppColors.primary
                                          : AppColors.white,
                                      border: Border.all(
                                          color: AppColors.borderColor),
                                    ),
                                    child: Text(
                                      '7D',
                                      style: globalTextStyle(
                                        fontSize: 10.sp,
                                        color:
                                            controller.selectedFilter.value ==
                                                    '7Days'
                                                ? AppColors.white
                                                : AppColors.dark,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            horizontalSpace(5.w),
                            Obx(
                              () => Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    controller.filterGraphDateValue('1Month');
                                  },
                                  child: Container(
                                    padding: EdgeInsets.only(
                                        left: 8.w,
                                        right: 8.w,
                                        bottom: 8.h,
                                        top: 8.h),
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(2.5.r),
                                      color: controller.selectedFilter.value ==
                                              '1Month'
                                          ? AppColors.primary
                                          : AppColors.white,
                                      border: Border.all(
                                          color: AppColors.borderColor),
                                    ),
                                    child: Text(
                                      '1M',
                                      style: globalTextStyle(
                                        fontSize: 10.sp,
                                        color:
                                            controller.selectedFilter.value ==
                                                    '1Month'
                                                ? AppColors.white
                                                : AppColors.dark,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            horizontalSpace(5.w),
                            Obx(
                              () => Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    controller.filterGraphDateValue('3Months');
                                  },
                                  child: Container(
                                    padding: EdgeInsets.only(
                                        left: 8.w,
                                        right: 8.w,
                                        bottom: 8.h,
                                        top: 8.h),
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(2.5.r),
                                      color: controller.selectedFilter.value ==
                                              '3Months'
                                          ? AppColors.primary
                                          : AppColors.white,
                                      border: Border.all(
                                          color: AppColors.borderColor),
                                    ),
                                    child: Text(
                                      '3M',
                                      style: globalTextStyle(
                                        fontSize: 10.sp,
                                        color:
                                            controller.selectedFilter.value ==
                                                    '3Months'
                                                ? AppColors.white
                                                : AppColors.dark,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            horizontalSpace(5.w),
                            Obx(
                              () => Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    controller.filterGraphDateValue('1Year');
                                  },
                                  child: Container(
                                    padding: EdgeInsets.only(
                                        left: 8.w,
                                        right: 8.w,
                                        bottom: 8.h,
                                        top: 8.h),
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(2.5.r),
                                      color: controller.selectedFilter.value ==
                                              '1Year'
                                          ? AppColors.primary
                                          : AppColors.white,
                                      border: Border.all(
                                          color: AppColors.borderColor,
                                          width: 1.w),
                                    ),
                                    child: Text(
                                      '1Year',
                                      style: globalTextStyle(
                                        fontSize: 10.sp,
                                        color:
                                            controller.selectedFilter.value ==
                                                    '1Year'
                                                ? AppColors.white
                                                : AppColors.dark,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            horizontalSpace(5.w),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              verticalSpace(10.h),
              const TransactionView(),
            ],
          ),
        ),
      ),
    );
  }
}
