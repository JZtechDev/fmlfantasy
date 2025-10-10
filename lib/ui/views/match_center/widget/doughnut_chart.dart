import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart'; // Adjust import path as needed
import 'package:fmlfantasy/core/imports/imports.dart'; // Adjust import path as needed
import 'package:fmlfantasy/new_model/match_center_inner_new.dart'; // Use the provided model

class DoughnutChart extends StatelessWidget {
  final PlayerMatchStatistic playersdata;
  const DoughnutChart({super.key, required this.playersdata});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        double maxWidth = constraints.maxWidth;
        return Container(
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(color: Color.fromRGBO(18, 96, 85, 1)),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10.w, right: 10.w),
                child: SizedBox(
                  height: Get.height * 0.25,
                  child: SfCircularChart(
                    tooltipBehavior: TooltipBehavior(
                        activationMode: ActivationMode.singleTap),
                    centerX: '20%',
                    centerY: '50%',
                    series: <CircularSeries>[
                      DoughnutSeries<FantasyPointsBreakdown, String>(
                        dataSource: playersdata.fantasyPointsBreakdowns
                            .take(4)
                            .toList(),
                        pointColorMapper:
                            (FantasyPointsBreakdown data, int index) {
                          List<Color> colors = [
                            const Color.fromRGBO(102, 203, 61, 1),
                            const Color.fromRGBO(249, 207, 88, 1),
                            const Color.fromRGBO(0, 100, 148, 1),
                            const Color.fromRGBO(255, 255, 255, 1),
                            const Color.fromRGBO(230, 180, 125, 1),
                          ];
                          return colors[index % colors.length];
                        },
                        xValueMapper: (FantasyPointsBreakdown data, _) => data
                            .fantasyPointType, // Using fantasyPointDescription as name
                        yValueMapper: (FantasyPointsBreakdown data, _) =>
                            data.fantasyPoints, // Using fantasyPoints as value
                        strokeWidth: 1,
                        innerRadius: '70%',
                        radius: '70%',
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 50.h,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    playersdata.fantasyPoints.toStringAsFixed(0),
                    style: globalTextStyle(
                      fontSize: 22.sp,
                      color: AppColors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  padding: EdgeInsets.only(left: 10.w, right: 10.w),
                  height: Get.height * 0.25,
                  width: Get.width * 0.5,
                  decoration: BoxDecoration(
                    color: AppColors
                        .backgroud, // Ensure AppColors.background is defined
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5.r),
                      bottomLeft: Radius.circular(5.r),
                    ),
                  ),
                  alignment: Alignment.center,
                  constraints: const BoxConstraints(
                    maxWidth: 200,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: playersdata.fantasyPointsBreakdowns
                        .asMap()
                        .entries
                        .take(4)
                        .map((entry) {
                      int index = entry.key;
                      var data = entry.value;

                      List<Color> colors = [
                        const Color.fromRGBO(102, 203, 61, 1),
                        const Color.fromRGBO(249, 207, 88, 1),
                        const Color.fromRGBO(0, 100, 148, 1),
                        const Color.fromRGBO(255, 255, 255, 1),
                        const Color.fromRGBO(230, 180, 125, 1),
                      ];

                      return Padding(
                        padding: EdgeInsets.only(bottom: 5.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              width: maxWidth > 600 ? 8.sp : 12.sp,
                              height: maxWidth > 600 ? 8.sp : 12.sp,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: colors[index % colors.length],
                              ),
                            ),
                            horizontalSpace(
                                10.w), // Ensure horizontalSpace is defined
                            Text(
                              textAlign: TextAlign.center,
                              data.fantasyPointType, // Using fantasyPointDescription
                              style: globalTextStyle(
                                fontSize: maxWidth > 600 ? 8.sp : 12.sp,
                                fontWeight: FontWeight.w700,
                                color: colors[index % colors.length],
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
