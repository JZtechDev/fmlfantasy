import 'package:fmlfantasy/app/app_colors/app_colors.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/model/match_center_model.dart';
import 'package:fmlfantasy/ui/helpers/commons.dart';
import 'package:fmlfantasy/ui/helpers/replace_svg_with_png.dart';
import 'package:fmlfantasy/ui/views/match_center/controller/match_center_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class MatchCenterTiles extends GetView<MatchCenterController> {
  final PastMatches matches;
  const MatchCenterTiles({super.key, required this.matches});

  @override
  Widget build(BuildContext context) {
    Get.put(MatchCenterController());
    return LayoutBuilder(builder: (context, constraints) {
      //double maxWidth = constraints.maxWidth;
      return Container(
        width: Get.width,
        margin: EdgeInsets.only(bottom: 10.h),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(77, 134, 126, 1),
          borderRadius: BorderRadius.circular(5.r),
        ),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 5.h),
              width: Get.width,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(
                    18, 96, 85, 1), // Changed to match screenshot background
                borderRadius: BorderRadius.circular(5.r),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                    top: 15, bottom: 10.h, left: 10.w, right: 10.w),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.all(10.w),
                              height: 40.h,
                              width: 40.w,
                              decoration: const BoxDecoration(
                                  color: Color.fromRGBO(217, 217, 217, 1),
                                  shape: BoxShape.circle),
                              child: matches.homeImageUrl == null ||
                                      matches.homeImageUrl!.isEmpty
                                  ? Container()
                                  : controller.selectedSport.value == 'CR'
                                      ? Image.network(
                                          replaceSvgWithPng(
                                              matches.homeImageUrl!),
                                          height: 30.h,
                                          width: 30.w,
                                        )
                                      : matches.homeImageUrl!.endsWith('.svg')
                                          ? SvgPicture.network(
                                              matches.homeImageUrl!,
                                              height: 30.h,
                                              width: 30.w,
                                            )
                                          : Image.network(
                                              matches.homeImageUrl!,
                                              height: 30.h,
                                              width: 30.w,
                                            ),
                            ),
                            verticalSpace(5.h),
                            SizedBox(
                              width: Get.width * 0.3,
                              child: Text(
                                matches.home ?? 'Team 2 large name here',
                                textAlign: TextAlign.center,
                                style: globalTextStyle2(
                                  fontSize: 12.sp,
                                  color: AppColors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 80.h,
                          child: VerticalDivider(
                            color: AppColors.white,
                            thickness: 1,
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.all(10.w),
                              height: 40.h,
                              width: 40.w,
                              decoration: const BoxDecoration(
                                color: AppColors.white,
                                shape: BoxShape.circle,
                              ),
                              child: matches.awayImageUrl == null ||
                                      matches.awayImageUrl!.isEmpty
                                  ? Container()
                                  : controller.selectedSport.value == 'CR'
                                      ? Image.network(
                                          replaceSvgWithPng(
                                              matches.awayImageUrl!),
                                          height: 30.h,
                                          width: 30.w,
                                        )
                                      : matches.awayImageUrl!.endsWith('.svg')
                                          ? SvgPicture.network(
                                              matches.awayImageUrl!,
                                              height: 30.h,
                                              width: 30.w,
                                            )
                                          : Image.network(
                                              matches.awayImageUrl!,
                                              height: 30.h,
                                              width: 30.w,
                                            ),
                            ),
                            verticalSpace(5.h),
                            SizedBox(
                              width: Get.width * 0.3,
                              child: Text(
                                matches.away ?? 'Team 1 large name here',
                                textAlign: TextAlign.center,
                                style: globalTextStyle2(
                                  fontSize: 12.sp,
                                  color: AppColors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 5.h),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset('assets/new_images/calender.png',
                          height: 15.h, width: 15.w),
                      horizontalSpace(5.w),
                      Text(
                        matches.start != null
                            ? DateFormat('d MMM yyyy').format(
                                DateTime.parse(matches.start ?? '').toLocal())
                            : '6th May 1430',
                        style: globalTextStyle2(
                          fontSize: 12.sp,
                          color: AppColors.white,
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  Text(
                    matches.competitionName ?? 'English Premier League',
                    style: globalTextStyle2(
                      fontSize: 12.sp,
                      color: AppColors.white,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
