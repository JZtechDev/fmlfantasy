import 'package:fmlfantasy/app/app_images/app_images.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/model/lotto_leaderboard_models.dart';
import 'package:fmlfantasy/ui/views/sport_pick_inner_leaderboard/controller/sport_pick_inner_leaderboard_controller.dart';
import 'package:flutter_svg/svg.dart';

class InnerLeaderboard extends GetView<SportPickInnerLeaderboardController> {
  final LotoInnerLeaderboardModel leaderboard;
  const InnerLeaderboard({super.key, required this.leaderboard});

  @override
  Widget build(BuildContext context) {
    Get.put(SportPickInnerLeaderboardController());
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      double maxWidth = constraints.maxWidth;
      return Container(
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
                    "LeaderBoard",
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
                  leaderboard.homeTeamName ?? '-',
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
                  leaderboard.awayTeamName ?? '-',
                  style: globalTextStyle2(
                      fontSize: maxWidth > 600 ? 10.sp : 12.sp,
                      color: AppColors.textGray),
                ),
              ],
            ),
            verticalSpace(10.h),
            leaderboard.details == null
                ? Container()
                : ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: leaderboard.details!.length,
                    itemBuilder: (context, index) {
                      Details playerRanks = leaderboard.details![index];
                      return Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(
                              left: 10.w,
                              right: 10.w,
                              top: 10.h,
                              bottom: 10.h,
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: AppColors.white),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      playerRanks.drawID.toString(),
                                      style: globalTextStyle(
                                          fontSize:
                                              maxWidth > 600 ? 10.sp : 12.sp,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.dark),
                                    ),
                                    horizontalSpace(14.w),
                                    SvgPicture.asset(
                                      AppImages.userPlaceHolder,
                                    ),
                                    horizontalSpace(20.w),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: Get.width * 0.3,
                                          child: Text(
                                            playerRanks.winLevel ?? '',
                                            style: globalTextStyle(
                                                fontSize: maxWidth > 600
                                                    ? 10.sp
                                                    : 12.sp,
                                                fontWeight: FontWeight.w600,
                                                color: AppColors.dark),
                                          ),
                                        ),
                                        SizedBox(
                                          width: Get.width * 0.3,
                                          child: Text(
                                            playerRanks.drawID.toString(),
                                            style: globalTextStyle(
                                                fontSize: maxWidth > 600
                                                    ? 8.sp
                                                    : 10.sp,
                                                fontWeight: FontWeight.w600,
                                                color: AppColors.textGray),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          playerRanks.dmpPoints.toString(),
                                          style: globalTextStyle(
                                              fontSize: maxWidth > 600
                                                  ? 10.sp
                                                  : 12.sp,
                                              color: AppColors.dark),
                                        ),
                                        // Text(
                                        //   playerRanks.,
                                        //   style: globalTextStyle(
                                        //       fontSize:
                                        //           maxWidth > 600 ? 8.sp : 10.sp,
                                        //       color: AppColors.dark),
                                        // ),
                                      ],
                                    ),
                                    const Expanded(child: SizedBox()),
                                    Text(
                                      playerRanks.winning.toString(),
                                      style: globalTextStyle(
                                          fontSize:
                                              maxWidth > 600 ? 10.sp : 12.sp,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.dark),
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
                      );
                    })
          ],
        ),
      );
    });
  }
}
