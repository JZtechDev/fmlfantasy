import 'package:fmlfantasy/app/app_images/app_images.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/ui/views/sport_pick_inner_leaderboard/controller/sport_pick_inner_leaderboard_controller.dart';
import 'package:flutter_svg/svg.dart';

class SportPickTopPlayers extends GetView<SportPickInnerLeaderboardController> {
  const SportPickTopPlayers({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SportPickInnerLeaderboardController());
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            controller.drawsLeaderboardMatches.player1Image == null ||
                    controller.drawsLeaderboardMatches.player1Image == ''
                ? Image.asset(
                    AppImages.userPlaceHolder,
                    height: 100.h,
                  )
                : controller.drawsLeaderboardMatches.player1Image!
                        .endsWith('.svg')
                    ? SvgPicture.network(
                        controller.drawsLeaderboardMatches.player1Image!,
                        height: 100.h,
                      )
                    : Image.network(
                        controller.drawsLeaderboardMatches.player1Image!,
                        height: 100.h,
                      ),
            verticalSpace(2.h),
            Container(
              width: 107.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.r),
                color: AppColors.navyBlue,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    AppImages.reward,
                    // ignore: deprecated_member_use
                    color: AppColors.white,
                    height: 13.h,
                  ),
                  horizontalSpace(5.w),
                  Text(
                    '01',
                    style: globalTextStyle2(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.white),
                  )
                ],
              ),
            ),
            verticalSpace(2.h),
            Text(
              controller.drawsLeaderboardMatches.player1Name ?? '',
              style: globalTextStyle2(fontSize: 12.sp, color: AppColors.dark),
            ),
            Text(
              controller.drawsLeaderboardMatches.player1Team ?? '',
              style:
                  globalTextStyle2(fontSize: 10.sp, color: AppColors.textGray),
            ),
          ],
        ),
        horizontalSpace(10.w),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            controller.drawsLeaderboardMatches.player2Image == null ||
                    controller.drawsLeaderboardMatches.player2Image == ''
                ? Image.asset(
                    AppImages.userPlaceHolder,
                    height: 100.h,
                  )
                : controller.drawsLeaderboardMatches.player2Image!
                        .endsWith('.svg')
                    ? SvgPicture.network(
                        controller.drawsLeaderboardMatches.player2Image!,
                        height: 100.h,
                      )
                    : Image.network(
                        controller.drawsLeaderboardMatches.player2Image!,
                        height: 100.h,
                      ),
            verticalSpace(2.h),
            Container(
              width: 107.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.r),
                color: AppColors.navyBlue,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    AppImages.reward,
                    // ignore: deprecated_member_use
                    color: AppColors.white,
                    height: 13.h,
                  ),
                  horizontalSpace(5.w),
                  Text(
                    '02',
                    style: globalTextStyle2(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.white),
                  )
                ],
              ),
            ),
            verticalSpace(2.h),
            Text(
              controller.drawsLeaderboardMatches.player2Name ?? '',
              style: globalTextStyle2(fontSize: 12.sp, color: AppColors.dark),
            ),
            Text(
              controller.drawsLeaderboardMatches.player2Team ?? '',
              style:
                  globalTextStyle2(fontSize: 10.sp, color: AppColors.textGray),
            ),
          ],
        ),
        horizontalSpace(10.w),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            controller.drawsLeaderboardMatches.player3Image == null ||
                    controller.drawsLeaderboardMatches.player3Image == ''
                ? Image.asset(
                    AppImages.userPlaceHolder,
                    height: 80.h,
                  )
                : controller.drawsLeaderboardMatches.player3Image!
                        .endsWith('.svg')
                    ? SvgPicture.network(
                        controller.drawsLeaderboardMatches.player3Image!,
                        height: 100.h,
                      )
                    : Image.network(
                        controller.drawsLeaderboardMatches.player3Image!,
                        height: 100.h,
                      ),
            verticalSpace(2.h),
            Container(
              width: 107.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.r),
                color: AppColors.navyBlue,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    AppImages.reward,
                    // ignore: deprecated_member_use
                    color: AppColors.white,
                    height: 13.h,
                  ),
                  horizontalSpace(5.w),
                  Text(
                    '03',
                    style: globalTextStyle2(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.white),
                  )
                ],
              ),
            ),
            verticalSpace(2.h),
            Text(
              controller.drawsLeaderboardMatches.player3Name ?? '',
              style: globalTextStyle2(fontSize: 12.sp, color: AppColors.dark),
            ),
            Text(
              controller.drawsLeaderboardMatches.player3Team ?? '',
              style:
                  globalTextStyle2(fontSize: 10.sp, color: AppColors.textGray),
            ),
          ],
        ),
        horizontalSpace(10.w),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            controller.drawsLeaderboardMatches.player4Image == null ||
                    controller.drawsLeaderboardMatches.player4Image == ''
                ? Image.asset(
                    AppImages.userPlaceHolder,
                    height: 80.h,
                  )
                : controller.drawsLeaderboardMatches.player4Image!
                        .endsWith('.svg')
                    ? SvgPicture.network(
                        controller.drawsLeaderboardMatches.player4Image!,
                        height: 100.h,
                      )
                    : Image.network(
                        controller.drawsLeaderboardMatches.player4Image!,
                        height: 100.h,
                      ),
            verticalSpace(2.h),
            Container(
              width: 107.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.r),
                color: AppColors.navyBlue,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    AppImages.reward,
                    // ignore: deprecated_member_use
                    color: AppColors.white,
                    height: 13.h,
                  ),
                  horizontalSpace(5.w),
                  Text(
                    '04',
                    style: globalTextStyle2(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.white),
                  )
                ],
              ),
            ),
            verticalSpace(2.h),
            Text(
              controller.drawsLeaderboardMatches.player4Name ?? '',
              style: globalTextStyle2(fontSize: 12.sp, color: AppColors.dark),
            ),
            Text(
              controller.drawsLeaderboardMatches.player4Team ?? '',
              style:
                  globalTextStyle2(fontSize: 10.sp, color: AppColors.textGray),
            ),
          ],
        ),
        horizontalSpace(10.w),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            controller.drawsLeaderboardMatches.player5Image == null ||
                    controller.drawsLeaderboardMatches.player5Image == ''
                ? Image.asset(
                    AppImages.userPlaceHolder,
                    height: 80.h,
                  )
                : controller.drawsLeaderboardMatches.player5Image!
                        .endsWith('.svg')
                    ? SvgPicture.network(
                        controller.drawsLeaderboardMatches.player5Image!,
                        height: 100.h,
                      )
                    : Image.network(
                        controller.drawsLeaderboardMatches.player5Image!,
                        height: 100.h,
                      ),
            verticalSpace(2.h),
            Container(
              width: 107.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.r),
                color: AppColors.navyBlue,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    AppImages.reward,
                    // ignore: deprecated_member_use
                    color: AppColors.white,
                    height: 13.h,
                  ),
                  horizontalSpace(5.w),
                  Text(
                    '05',
                    style: globalTextStyle2(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.white),
                  )
                ],
              ),
            ),
            verticalSpace(2.h),
            Text(
              controller.drawsLeaderboardMatches.player5Name ?? '',
              style: globalTextStyle2(fontSize: 12.sp, color: AppColors.dark),
            ),
            Text(
              controller.drawsLeaderboardMatches.player5Team ?? '',
              style:
                  globalTextStyle2(fontSize: 10.sp, color: AppColors.textGray),
            ),
          ],
        )
      ]),
    );
  }
}
