import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/model/monthly_leader_model.dart';
import 'package:fmlfantasy/ui/views/monthly_leaderboard_inner/controller/monthly_inner_leaderboard_controller.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../app/app_images/app_images.dart';

class LeaderBoardTable extends GetView<MonthlyInnerLeaderboardController> {
  final List<Rankings> rankings;
  final String homeImageUrl;
  final String home;
  final String awayImageUrl;
  final String away;
  final String sports;

  const LeaderBoardTable(this.rankings, this.homeImageUrl, this.home,
      this.awayImageUrl, this.away, this.sports,
      {super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MonthlyInnerLeaderboardController());
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      double maxWidth = constraints.maxWidth;

      return Padding(
        padding: EdgeInsets.only(left: 15.w, right: 15.w),
        child: Container(
          padding:
              EdgeInsets.only(left: 10.w, right: 10.w, top: 10.h, bottom: 2.h),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5), color: AppColors.white),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 10.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "leaderBoard".tr,
                      style: globalTextStyle(
                          fontSize: maxWidth > 600 ? 20.sp : 24.sp,
                          fontWeight: FontWeight.w600),
                    ),
                    horizontalSpace(10.w),
                    SvgPicture.asset(
                      AppImages.leaderboard,
                      height: 21.h,
                      width: 21.w,
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Text(
                    home,
                    style: globalTextStyle2(
                        fontSize: maxWidth > 600 ? 10.sp : 12.sp,
                        color: AppColors.textGray),
                  ),
                  horizontalSpace(2.w),
                  Text(
                    "vs",
                    style: globalTextStyle2(
                        fontSize: maxWidth > 600 ? 10.sp : 12.sp,
                        color: AppColors.textGray),
                  ),
                  horizontalSpace(2.w),
                  Text(
                    away,
                    style: globalTextStyle2(
                        fontSize: maxWidth > 600 ? 10.sp : 12.sp,
                        color: AppColors.textGray),
                  ),
                ],
              ),
              verticalSpace(10.h),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.r),
                  color: AppColors.grey,
                ),
                padding: EdgeInsets.only(
                    top: 5.h, bottom: 5.h, left: 10.w, right: 10.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '#',
                      style: globalTextStyle(
                          fontSize: maxWidth > 600 ? 10.sp : 12.sp,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      'name'.tr,
                      style: globalTextStyle(
                          fontSize: maxWidth > 600 ? 10.sp : 12.sp,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      'winnings'.tr,
                      style: globalTextStyle(
                          fontSize: maxWidth > 600 ? 10.sp : 12.sp,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      'points'.tr,
                      style: globalTextStyle(
                          fontSize: maxWidth > 600 ? 10.sp : 12.sp,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              ),
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: rankings.length,
                  itemBuilder: (context, index) {
                    return Obx(() {
                      RxList sortedRankings = List.from(rankings).obs;
                      sortedRankings.sort((a, b) {
                        if (a.userId == controller.userId.value) {
                          return -1;
                        }
                        if (b.userId == controller.userId.value) {
                          return 1;
                        }
                        return a.rank.compareTo(b.rank);
                      });
                      final playerRanks = sortedRankings[index];

                      return Column(
                        children: [
                          Obx(
                            () => Container(
                              padding: EdgeInsets.only(
                                left: 10.w,
                                right: 10.w,
                                top: 10.h,
                                bottom: 10.h,
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: playerRanks.userId ==
                                          controller.userId.value
                                      ? AppColors.primary
                                      : AppColors.white),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        playerRanks.rank
                                            .toString()
                                            .padLeft(2, '0'),
                                        style: globalTextStyle(
                                            fontSize:
                                                maxWidth > 600 ? 10.sp : 12.sp,
                                            fontWeight: FontWeight.w600,
                                            color: playerRanks.userId ==
                                                    controller.userId.value
                                                ? AppColors.white
                                                : AppColors.dark),
                                      ),
                                      horizontalSpace(14.w),
                                      Container(
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          gradient: RadialGradient(
                                            colors: [
                                              Color(0xFFE0F9FF),
                                              Color(0xFF7AE5FF),
                                              Color(0xFF008CAD),
                                            ],
                                            radius: 0.85,
                                          ),
                                        ),
                                        child: CircleAvatar(
                                          radius: 14
                                              .r, // Adjust the radius as needed
                                          backgroundImage: const AssetImage(
                                              'assets/images/leaderoard_user.png'),
                                          backgroundColor: Colors
                                              .transparent, // To show the gradient background
                                        ),
                                      ),
                                      SizedBox(width: 10.w),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: Get.width * 0.3,
                                            child: Text(
                                              playerRanks.name!,
                                              style: globalTextStyle(
                                                  fontSize: maxWidth > 600
                                                      ? 10.sp
                                                      : 12.sp,
                                                  fontWeight: FontWeight.w600,
                                                  color: playerRanks.userId ==
                                                          controller
                                                              .userId.value
                                                      ? AppColors.white
                                                      : AppColors.dark),
                                            ),
                                          ),
                                          SizedBox(
                                            width: Get.width * 0.3,
                                            child: Text(
                                              playerRanks.name!,
                                              style: globalTextStyle(
                                                  fontSize: maxWidth > 600
                                                      ? 8.sp
                                                      : 10.sp,
                                                  fontWeight: FontWeight.w600,
                                                  color: playerRanks.userId ==
                                                          controller
                                                              .userId.value
                                                      ? AppColors.white
                                                      : AppColors.textGray),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        '\$${playerRanks.prizeMoney!.toStringAsFixed(0).padLeft(2, '0')}',
                                        style: globalTextStyle(
                                            fontSize:
                                                maxWidth > 600 ? 10.sp : 12.sp,
                                            color: playerRanks.userId ==
                                                    controller.userId.value
                                                ? AppColors.white
                                                : AppColors.dark),
                                      ),
                                      const Expanded(child: SizedBox()),
                                      Text(
                                        '${playerRanks.fantasyPointsWeighted!.toStringAsFixed(0)} Points',
                                        style: globalTextStyle(
                                            fontSize:
                                                maxWidth > 600 ? 10.sp : 12.sp,
                                            fontWeight: FontWeight.w600,
                                            color: playerRanks.userId ==
                                                    controller.userId.value
                                                ? AppColors.white
                                                : AppColors.dark),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Divider(
                            height: 1,
                            color: AppColors.grey,
                          )
                        ],
                      );
                    });
                  }),
            ],
          ),
        ),
      );
    });
  }
}
