import 'package:fmlfantasy/app/app_colors/app_colors.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/ui/helpers/commons.dart';
import 'package:fmlfantasy/ui/helpers/replace_svg_with_png.dart';
import 'package:fmlfantasy/ui/views/monthly_leaderboard_inner/monthly_inner_leaderboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class TopHomeAwayTeam extends GetView<MonthlyInnerLeaderboard> {
  const TopHomeAwayTeam(this.homeImageUrl, this.home, this.awayImageUrl,
      this.away, this.homeScore, this.awayScore, this.sportsType,
      {super.key});

  final String homeImageUrl;
  final String home;
  final String awayImageUrl;
  final String away;
  final String homeScore;
  final String awayScore;
  final String sportsType;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.white,
        border:
            Border(bottom: BorderSide(color: AppColors.borderColor, width: 1)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 10.h, bottom: 10.h, left: 10.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                horizontalSpace(40),
                Container(
                  constraints: BoxConstraints(
                    maxHeight: 35.h,
                    maxWidth: 45.w,
                    minHeight: 35.h,
                    minWidth: 45.w,
                  ),
                  child: homeImageUrl.isEmpty
                      ? const SizedBox()
                      : homeImageUrl.endsWith('.png')
                          ? Image.network(homeImageUrl,
                              height: 35.h, width: 35.w)
                          : sportsType == 'CR'
                              ? Image.network(replaceSvgWithPng(homeImageUrl),
                                  height: 35.h, width: 35.w)
                              : SvgPicture.network(
                                  homeImageUrl,
                                  height: 35.h,
                                  width: 35.w,
                                ),
                ),
                verticalSpace(5.h),
                Text(
                  home.toString(),
                  style: globalTextStyle(
                      fontSize: 12.sp, fontWeight: FontWeight.w600),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                ),
                verticalSpace(5.h),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(
                      left: 50.w, right: 50.w, top: 2.h, bottom: 2.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.r),
                    color: AppColors.grey,
                  ),
                  child: Text(
                    homeScore.toString(),
                    style: globalTextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w800,
                        color: AppColors.primary),
                  ),
                )
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                height: 5.h,
                width: 5.w,
                color: AppColors.dark.withValues(alpha: 0.6),
              ),
              verticalSpace(5.h),
              Container(
                alignment: Alignment.center,
                height: 5.h,
                width: 5.w,
                color: AppColors.dark.withValues(alpha: 0.6),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                constraints: BoxConstraints(
                  maxHeight: 35.h,
                  maxWidth: 45.w,
                  minHeight: 35.h,
                  minWidth: 45.w,
                ),
                child: awayImageUrl.isEmpty
                    ? const SizedBox()
                    : awayImageUrl.endsWith('.png')
                        ? Image.network(awayImageUrl, height: 35.h, width: 35.w)
                        : sportsType == 'CR'
                            ? Image.network(replaceSvgWithPng(awayImageUrl),
                                height: 35.h, width: 35.w)
                            : SvgPicture.network(
                                awayImageUrl,
                                height: 35.h,
                                width: 35.w,
                              ),
              ),
              verticalSpace(5.h),
              Text(
                away.toString(),
                style: globalTextStyle(
                    fontSize: 12.sp, fontWeight: FontWeight.w600),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
              ),
              verticalSpace(5.h),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(
                    left: 50.w, right: 50.w, top: 2.h, bottom: 2.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.r),
                  color: AppColors.grey,
                ),
                child: Text(
                  awayScore.toString(),
                  style: globalTextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w800,
                      color: AppColors.primary),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
