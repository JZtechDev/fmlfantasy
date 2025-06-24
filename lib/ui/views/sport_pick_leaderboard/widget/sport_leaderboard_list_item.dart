import 'package:fmlfantasy/app/app_colors/app_colors.dart';
import 'package:fmlfantasy/app/app_images/app_images.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/model/lotto_leaderboard_models.dart';
import 'package:fmlfantasy/ui/helpers/commons.dart';
import 'package:fmlfantasy/ui/helpers/local_time.dart';
import 'package:fmlfantasy/ui/helpers/replace_svg_with_png.dart';
import 'package:fmlfantasy/ui/views/sport_pick_leaderboard/controller/sport_pick_leaderboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SportLeaderboardListItem extends GetView<SportPickLeaderboardController> {
  final LotoLeaderboardMatches matches;
  const SportLeaderboardListItem({super.key, required this.matches});

  @override
  Widget build(BuildContext context) {
    final DateTime endDate = DateTime.parse(matches.matchStartsAt!);
    final String formattedDifference = formatEndDateTime(endDate.toLocal());
    return LayoutBuilder(builder: (context, constraints) {
      double maxWidth = constraints.maxWidth;
      return Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.r),
              color: const Color.fromRGBO(18, 96, 85, 1),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/new_images/trophy.png',
                            color: AppColors.secondary,
                            height: 20,
                            width: 20,
                          ),
                          horizontalSpace(5.w),
                          Text(matches.competition ?? '',
                              style: globalTextStyle(
                                  fontSize: 14.sp,
                                  color: AppColors.secondary,
                                  fontWeight: FontWeight.w600)),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            height: 20,
                            width: 20,
                            'assets/new_images/calender.png',
                            color: AppColors.secondary,
                          ),
                          horizontalSpace(5),
                          Text(formattedDifference,
                              textAlign: TextAlign.center,
                              style: globalTextStyle(
                                  fontSize: 14.sp,
                                  color: AppColors.secondary,
                                  fontWeight: FontWeight.w600))
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                      color: AppColors.primary,
                      border: Border(
                        top: BorderSide(width: 1, color: AppColors.white),
                      )),
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: 10.h, left: 10.w, right: 10.w, bottom: 10.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            matches.homeTeamImageUrl == null ||
                                    matches.homeTeamImageUrl!.isEmpty
                                ? Container()
                                : controller.selectedSport.value == 'CR'
                                    ? Image.network(
                                        height: 40.h,
                                        width: 40.w,
                                        replaceSvgWithPng(
                                            matches.homeTeamImageUrl!))
                                    : matches.homeTeamImageUrl!.endsWith('.svg')
                                        ? SvgPicture.network(
                                            matches.homeTeamImageUrl!,
                                            fit: BoxFit.fill,
                                            height: 40.h,
                                          )
                                        : Image.network(
                                            matches.homeTeamImageUrl!,
                                            fit: BoxFit.fill,
                                            height: 40.h,
                                          ),
                            horizontalSpace(10.w),
                            SizedBox(
                              width: Get.width * 0.2,
                              child: Text(
                                matches.homeTeamName! ?? '',
                                style: globalTextStyle2(
                                    fontSize: maxWidth > 600 ? 10.sp : 14.sp,
                                    color: AppColors.secondary,
                                    fontWeight: FontWeight.w700),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10.h),
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                              color: AppColors.backgroud,
                              shape: BoxShape.circle),
                          child: Text(
                            'vs',
                            style: globalTextStyle2(
                                fontWeight: FontWeight.w700,
                                fontSize: 12.sp,
                                color: AppColors.secondary),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: Get.width * 0.2,
                              child: Text(
                                textAlign: TextAlign.end,
                                matches.awayTeamName! ?? '',
                                style: globalTextStyle2(
                                    fontSize: maxWidth > 600 ? 10.sp : 14.sp,
                                    color: AppColors.secondary,
                                    fontWeight: FontWeight.w700),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            horizontalSpace(10.w),
                            matches.awayTeamImageUrl == null ||
                                    matches.awayTeamImageUrl!.isEmpty
                                ? Container()
                                : matches.awayTeamImageUrl!.endsWith('.svg')
                                    ? controller.selectedSport.value == 'CR'
                                        ? Image.network(
                                            height: 40.h,
                                            width: 40.w,
                                            replaceSvgWithPng(
                                                matches.awayTeamImageUrl!))
                                        : SvgPicture.network(
                                            matches.awayTeamImageUrl!,
                                            fit: BoxFit.fill,
                                            height: 40.h,
                                          )
                                    : Image.network(
                                        matches.awayTeamImageUrl!,
                                        fit: BoxFit.fill,
                                        height: 35.h,
                                      ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                verticalSpace(5),
                Padding(
                  padding: EdgeInsets.only(
                      top: 5.h, left: 5.w, right: 5.w, bottom: 5.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Total Winnings',
                          style: globalTextStyle(
                              fontSize: maxWidth > 600 ? 10.sp : 14.sp,
                              fontWeight: FontWeight.w700,
                              color: AppColors.white),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis),
                      horizontalSpace(10.w),
                      Text(
                        "\$${matches.totalWinning.toString()}",
                        style: globalTextStyle(
                            fontSize: maxWidth > 600 ? 10.sp : 16.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColors.white),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                )
                // Padding(
                //   padding: EdgeInsets.only(
                //       top: 5.h, left: 5.w, right: 5.w, bottom: 5.h),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Text('eeee',
                //           style: globalTextStyle(
                //               fontSize: maxWidth > 600 ? 8.sp : 10.sp,
                //               fontWeight: FontWeight.w500,
                //               color: AppColors.textGray),
                //           maxLines: 2,
                //           overflow: TextOverflow.ellipsis),
                //     ],
                //   ),
                // )
              ],
            ),
          ),
          verticalSpace(5.h),
        ],
      );
    });
  }
}
