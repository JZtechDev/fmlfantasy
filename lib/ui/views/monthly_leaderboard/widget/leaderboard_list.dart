import 'package:fmlfantasy/app/app_colors/app_colors.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/model/monthly_leader_model.dart';
import 'package:fmlfantasy/ui/helpers/commons.dart';
import 'package:fmlfantasy/ui/helpers/replace_svg_with_png.dart';
import 'package:fmlfantasy/ui/views/monthly_leaderboard/controller/monthly_leaderboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class LeaderboardListItems extends GetView<MonthlyLeaderboardController> {
  final MonthlyLeaderBoardModel leaderboard;
  const LeaderboardListItems({super.key, required this.leaderboard});

  @override
  Widget build(BuildContext context) {
    Get.put(MonthlyLeaderboardController());
    return LayoutBuilder(builder: (context, constraints) {
      double maxWidth = constraints.maxWidth;
      return Column(
        children: [
          Container(
            width: Get.width,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(5.r),
            ),
            child: Padding(
              padding: EdgeInsets.only(top: 5.h, left: 5.w, right: 5.w),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.grey,
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: 5.h, left: 5.w, right: 5.w, bottom: 5.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                  height: maxWidth > 600 ? 50.h : 60.h,
                                  width: maxWidth > 600 ? 50.w : 60.w,
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: AppColors.white,
                                      borderRadius:
                                          BorderRadius.circular(8.33.r)),
                                  child: leaderboard.homeImageUrl
                                          .toString()
                                          .endsWith('.png')
                                      ? Image.network(leaderboard.homeImageUrl!)
                                      : controller.selectedSport.value == 'CR'
                                          ? Image.network(
                                              replaceSvgWithPng(
                                                  leaderboard.homeImageUrl!),
                                              height: maxWidth > 600
                                                  ? 30.h
                                                  : 36.28.h,
                                              width: maxWidth > 600
                                                  ? 40.w
                                                  : 47.72.w,
                                              fit: BoxFit.contain,
                                            )
                                          : SvgPicture.network(
                                              leaderboard.homeImageUrl!)),
                              horizontalSpace(10.w),
                              Text(
                                leaderboard.home!.split(' ').join('\n'),
                                style: globalTextStyle2(
                                    fontSize: maxWidth > 600 ? 10.sp : 12.sp,
                                    color: AppColors.dark,
                                    fontWeight: FontWeight.w500),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                textAlign: TextAlign.end,
                                leaderboard.away!.split(' ').join('\n'),
                                style: globalTextStyle2(
                                    fontSize: maxWidth > 600 ? 10.sp : 12.sp,
                                    color: AppColors.dark,
                                    fontWeight: FontWeight.w500),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              horizontalSpace(10.w),
                              Container(
                                  height: maxWidth > 600 ? 50.h : 60.h,
                                  width: maxWidth > 600 ? 50.w : 60.w,
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: AppColors.white,
                                      borderRadius:
                                          BorderRadius.circular(8.33.r)),
                                  child: leaderboard.awayImageUrl
                                          .toString()
                                          .endsWith('.png')
                                      ? Image.network(leaderboard.awayImageUrl!)
                                      : controller.selectedSport.value == 'CR'
                                          ? Image.network(
                                              replaceSvgWithPng(
                                                  leaderboard.awayImageUrl!),
                                              height: maxWidth > 600
                                                  ? 30.h
                                                  : 36.28.h,
                                              width: maxWidth > 600
                                                  ? 40.w
                                                  : 47.72.w,
                                              fit: BoxFit.contain,
                                            )
                                          : SvgPicture.network(
                                              leaderboard.awayImageUrl!)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: 5.h, left: 5.w, right: 5.w, bottom: 5.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(leaderboard.matchCode!.substring(0, 3),
                            style: globalTextStyle(
                                fontSize: maxWidth > 600 ? 8.sp : 10.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.textGray),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis),
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/icons/clock.svg',
                              // ignore: deprecated_member_use
                              color: Colors.red,
                              height: 16.h,
                              width: 16.w,
                            ),
                            horizontalSpace(5.w),
                            Text(
                              DateFormat('d MMM hh:mm a').format(
                                  DateTime.parse(leaderboard.matchTime!)
                                      .toLocal()),
                              style: globalTextStyle(
                                fontSize: maxWidth > 600 ? 8.sp : 10.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.red,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          verticalSpace(5.h),
        ],
      );
    });
  }
}
