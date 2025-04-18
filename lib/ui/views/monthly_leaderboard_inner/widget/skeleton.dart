import 'package:fmlfantasy/app/app_colors/app_colors.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/ui/components/skeleton.dart';
import 'package:fmlfantasy/ui/helpers/commons.dart';
import 'package:fmlfantasy/ui/views/monthly_leaderboard_inner/widget/carousel_slider_top_player.dart';
import 'package:fmlfantasy/ui/views/monthly_leaderboard_inner/widget/top_home_away_team.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class MonthlyInnerLeaderboardSkeleton extends StatelessWidget {
  const MonthlyInnerLeaderboardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeleton(
      child: LayoutBuilder(
        builder: (context, constraints) {
          double maxWidth = constraints.maxWidth;
          return Column(
            children: [
              const TopHomeAwayTeam(
                '',
                '',
                '',
                '',
                '',
                '',
                '',
              ),
              verticalSpace(10.h),
              Container(
                color: AppColors.grey,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 10.h,
                    left: 15.w,
                    right: 15.w,
                  ),
                  child: Column(
                    children: [
                      const CarouselSliderTopPlayerToggle([]),
                      verticalSpace(10.h),
                      Container(
                        margin: EdgeInsets.only(left: 10.w, right: 10.w),
                        padding: EdgeInsets.only(
                            left: 15.w, right: 15.w, top: 10.h, bottom: 2.h),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: AppColors.white),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 10.w),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "LeaderBoard",
                                    style: globalTextStyle(
                                      fontSize: maxWidth > 600 ? 22.sp : 24.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  horizontalSpace(10.w),
                                  SvgPicture.asset(
                                    "assets/icons/leaderboard_icon.svg",
                                    height: maxWidth > 600 ? 19 : 21.h,
                                    width: maxWidth > 600 ? 19 : 21.h,
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  'home',
                                  style: globalTextStyle(
                                      fontSize: maxWidth > 600 ? 10.sp : 12.sp,
                                      color: AppColors.textGray),
                                ),
                                horizontalSpace(2.w),
                                Text(
                                  "vs",
                                  style: globalTextStyle(
                                      fontSize: maxWidth > 600 ? 10.sp : 12.sp,
                                      color: AppColors.textGray),
                                ),
                                horizontalSpace(2.w),
                                Text(
                                  'away',
                                  style: globalTextStyle(
                                      fontSize: maxWidth > 600 ? 10.sp : 12.sp,
                                      color: AppColors.textGray),
                                ),
                              ],
                            ),
                            verticalSpace(10.h),
                            Column(
                              children: [
                                Container(
                                  height: maxWidth > 600 ? 48.h : 50.h,
                                  width: maxWidth > 600 ? 221.w : 323.w,
                                  padding: EdgeInsets.only(
                                    left: 10.w,
                                    right: 10.w,
                                    top: 10.h,
                                    bottom: 10.h,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    // color: controller.selectedleader.value == index
                                    //     ? AppColors.primary
                                    //     : Colors.white
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            '1',
                                            style: globalTextStyle(
                                                fontSize: maxWidth > 600
                                                    ? 10.sp
                                                    : 12.sp,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          horizontalSpace(14.w),
                                          SvgPicture.asset(
                                            "assets/icons/leader_board_profile.svg",
                                            height:
                                                maxWidth > 600 ? 28.h : 30.h,
                                            width: maxWidth > 600 ? 28.w : 30.w,
                                          ),
                                          SizedBox(width: 10.w),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'John Doe',
                                                style: globalTextStyle(
                                                  fontSize: maxWidth > 600
                                                      ? 10
                                                      : 12.h,
                                                  fontWeight: FontWeight.w600,
                                                  // color: controller.selectedleader
                                                  //             .value ==
                                                  //         index
                                                  //     ? AppColors.white
                                                  //     : Colors.black
                                                ),
                                              ),
                                            ],
                                          ),
                                          const Expanded(child: SizedBox()),
                                          Text(
                                            '9.3 Points',
                                            style: globalTextStyle(
                                              fontSize:
                                                  maxWidth > 600 ? 10 : 12.h,
                                              fontWeight: FontWeight.w600,
                                              // color:
                                              //controller.selectedleader.value ==
                                              //       index
                                              //   ? AppColors.white
                                              //    : Colors.black
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const Divider(
                                  height: 1,
                                  color: AppColors.grey,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
