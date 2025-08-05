import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart'; // Adjust import path as needed
import 'package:fmlfantasy/core/imports/imports.dart'; // Adjust import path as needed
import 'package:fmlfantasy/new_model/match_center_inner_new.dart'; // Use the provided model

class PointsGrid extends StatelessWidget {
  final PlayerMatchStatistic playersdata;
  const PointsGrid({super.key, required this.playersdata});

  @override
  Widget build(BuildContext context) {
    // Sort fantasyPointsBreakdowns by fantasyPoints in descending order (highest first)
    List<FantasyPointsBreakdown> sortedStats =
        List.from(playersdata.fantasyPointsBreakdowns)
          ..sort((a, b) => b.fantasyPoints.compareTo(a.fantasyPoints));

    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      width: Get.width,
      color: AppColors.primaryLight, // Ensure AppColors.primaryLight is defined
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.w),
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 5.w,
            mainAxisSpacing: 5.h,
            childAspectRatio: 1.2, // Adjust as needed for proper height
          ),
          itemCount: sortedStats.length,
          itemBuilder: (context, index) {
            FantasyPointsBreakdown data = sortedStats[index];

            Color containerColor =
                (index < 3) ? AppColors.secondary : AppColors.primaryLight;
            Color textColor =
                (index < 3) ? AppColors.darkGreen : AppColors.white;

            return Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 2.w),
              decoration: BoxDecoration(
                color: containerColor,
                borderRadius: BorderRadius.circular(5.r),
                border: Border.all(
                  color: AppColors
                      .secondary, // Ensure AppColors.secondary is defined
                  width: 1.5,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    data.fantasyPoints.toStringAsFixed(0).padLeft(2, "0"),
                    style: globalTextStyle(
                      fontSize: 24.sp,
                      color: textColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    data.fantasyPointDescription, // Using fantasyPointDescription as name
                    style: globalTextStyle2(
                      fontSize: 12.sp,
                      color: textColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
