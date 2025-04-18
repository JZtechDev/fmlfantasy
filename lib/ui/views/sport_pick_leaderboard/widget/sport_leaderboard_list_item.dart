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
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(5.r),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(matches.competition ?? '',
                        style: globalTextStyle(
                            fontSize: 12.sp,
                            color: AppColors.textGray,
                            fontWeight: FontWeight.w400)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          height: 15,
                          width: 15,
                          AppImages.calender,
                          color: AppColors.errorRed,
                        ),
                        horizontalSpace(5),
                        Text(formattedDifference,
                            textAlign: TextAlign.center,
                            style: globalTextStyle(
                                fontSize: 10.sp,
                                color: AppColors.errorRed,
                                fontWeight: FontWeight.w400))
                      ],
                    )
                  ],
                ),
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
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(8.33.r)),
                              child: matches.homeTeamImageUrl == null ||
                                      matches.homeTeamImageUrl!.isEmpty
                                  ? Container()
                                  : controller.selectedSport.value == 'CR'
                                      ? Image.network(
                                          height: 40.h,
                                          width: 40.w,
                                          replaceSvgWithPng(
                                              matches.homeTeamImageUrl!))
                                      : matches.homeTeamImageUrl!
                                              .endsWith('.svg')
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
                            ),
                            horizontalSpace(10.w),
                            Text(
                              matches.homeTeamName!.split(' ').join('\n'),
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
                              matches.awayTeamName!.split(' ').join('\n'),
                              style: globalTextStyle2(
                                  fontSize: maxWidth > 600 ? 10.sp : 12.sp,
                                  color: AppColors.dark,
                                  fontWeight: FontWeight.w500),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            horizontalSpace(10.w),
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(8.33.r)),
                              child: matches.awayTeamImageUrl == null ||
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
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                verticalSpace(5),
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
                        Text('Total Winnings',
                            style: globalTextStyle(
                                fontSize: maxWidth > 600 ? 10.sp : 12.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.dark),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis),
                        Text(
                          "\$${matches.totalWinning.toString()}",
                          style: globalTextStyle(
                              fontSize: maxWidth > 600 ? 10.sp : 12.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.dark),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
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
