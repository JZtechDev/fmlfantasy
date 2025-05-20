import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/model/monthly_leader_model.dart';
import 'package:fmlfantasy/ui/components/trapezoid.dart';
import 'package:fmlfantasy/ui/views/monthly_leaderboard_inner/controller/monthly_inner_leaderboard_controller.dart';

class LeaderBoardTable extends GetView<MonthlyInnerLeaderboardController> {
  final List<Rankings> rankings;
  final String homeImageUrl;
  final String home;
  final String awayImageUrl;
  final String away;
  final String sports;

  const LeaderBoardTable(
    this.rankings,
    this.homeImageUrl,
    this.home,
    this.awayImageUrl,
    this.away,
    this.sports, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(MonthlyInnerLeaderboardController());
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        double maxWidth = constraints.maxWidth;
        final textScaler = MediaQuery.of(context).textScaler;

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 12.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: AppColors.backgroud,
            ),
            child: Column(
              children: [
                Container(
                  width: Get.width * 0.9,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.r),
                    color: AppColors.primary,
                  ),
                  child: Text(
                    'LeaderBoard',
                    style: globalTextStyle(
                        fontSize: 16.sp,
                        color: AppColors.secondary,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                SizedBox(
                  width: Get.width,
                  child: ClipPath(
                    clipper: TrapezoidClipper(),
                    child: Container(
                        width: Get.width,
                        height: 25.h,
                        color: AppColors.secondary,
                        padding: EdgeInsets.only(
                            left: 35.w, right: 35.w, top: 5.h, bottom: 5.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              home,
                              style: globalTextStyle(
                                  fontSize: 12.sp,
                                  color: AppColors.darkGreen,
                                  fontWeight: FontWeight.w600),
                            ),
                            Container(
                              alignment: Alignment.center,
                              height: 25.h,
                              width: 25.w,
                              decoration: const BoxDecoration(
                                color: AppColors.backgroud,
                                shape: BoxShape.circle,
                              ),
                              child: Text(
                                'VS',
                                style: globalTextStyle(
                                    fontSize: 10.sp,
                                    color: AppColors.secondary,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                            Text(
                              home,
                              style: globalTextStyle(
                                  fontSize: 12.sp,
                                  color: AppColors.darkGreen,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        )),
                  ),
                ),
                verticalSpace(20.h),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5.r),
                      topRight: Radius.circular(5.r),
                    ),
                    color: AppColors.customWhite,
                  ),
                  padding:
                      EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 5,
                        child: Row(
                          children: [
                            SizedBox(
                              width: maxWidth * 0.15,
                              child: Text(
                                'Rank',
                                style: globalTextStyle(
                                  fontSize: textScaler
                                      .scale(maxWidth > 600 ? 10 : 12),
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.primaryVeryDark,
                                ),
                              ),
                            ),
                            SizedBox(width: 8.w),
                            Expanded(
                              child: Text(
                                'name'.tr,
                                style: globalTextStyle(
                                  fontSize: textScaler
                                      .scale(maxWidth > 600 ? 10 : 12),
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.primaryVeryDark,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Expanded(
                              child: Text(
                                'winnings'.tr,
                                style: globalTextStyle(
                                  fontSize: textScaler
                                      .scale(maxWidth > 600 ? 10 : 12),
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.primaryVeryDark,
                                ),
                                textAlign: TextAlign.right,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            SizedBox(width: 8.w),
                            SizedBox(
                              width: maxWidth * 0.15,
                              child: Text(
                                'points'.tr,
                                style: globalTextStyle(
                                  fontSize: textScaler
                                      .scale(maxWidth > 600 ? 10 : 12),
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.primaryVeryDark,
                                ),
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: rankings.length,
                  itemBuilder: (context, index) {
                    return Obx(() {
                      RxList sortedRankings = List.from(rankings).obs;
                      sortedRankings.sort((a, b) {
                        if (a.userId == controller.userId.value) return -1;
                        if (b.userId == controller.userId.value) return 1;
                        return a.rank.compareTo(b.rank);
                      });
                      final playerRanks = sortedRankings[index];

                      final color = index % 2 == 0
                          ? AppColors.primary
                          : const Color.fromRGBO(18, 96, 85, 1);

                      return Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.w, vertical: 10.h),
                        decoration: BoxDecoration(
                          color: playerRanks.userId == controller.userId.value
                              ? AppColors.darkGreen
                              : color,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 5,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: maxWidth * 0.15,
                                    child: Text(
                                      playerRanks.rank
                                          .toString()
                                          .padLeft(2, '0'),
                                      style: globalTextStyle(
                                        fontSize: textScaler
                                            .scale(maxWidth > 600 ? 10 : 12),
                                        fontWeight: FontWeight.w700,
                                        color: playerRanks.userId ==
                                                controller.userId.value
                                            ? AppColors.white
                                            : AppColors.white,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 8.w),
                                  Expanded(
                                    child: Text(
                                      playerRanks.name ?? '',
                                      style: globalTextStyle(
                                        fontSize: textScaler
                                            .scale(maxWidth > 600 ? 10 : 12),
                                        fontWeight: FontWeight.w700,
                                        color: playerRanks.userId ==
                                                controller.userId.value
                                            ? AppColors.white
                                            : AppColors.white,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 4,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Expanded(
                                    child: Text(
                                      '\$${playerRanks.prizeMoney?.toStringAsFixed(0).padLeft(2, '0') ?? '0'}',
                                      style: globalTextStyle(
                                        fontSize: textScaler
                                            .scale(maxWidth > 600 ? 10 : 12),
                                        fontWeight: FontWeight.w700,
                                        color: playerRanks.userId ==
                                                controller.userId.value
                                            ? AppColors.white
                                            : AppColors.white,
                                      ),
                                      textAlign: TextAlign.center,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  SizedBox(width: 10.w),
                                  SizedBox(
                                    width: maxWidth * 0.1,
                                    child: Text(
                                      playerRanks.fantasyPointsWeighted
                                              ?.toStringAsFixed(0) ??
                                          '0',
                                      style: globalTextStyle(
                                        fontSize: textScaler
                                            .scale(maxWidth > 600 ? 10 : 12),
                                        fontWeight: FontWeight.w700,
                                        color: playerRanks.userId ==
                                                controller.userId.value
                                            ? AppColors.white
                                            : AppColors.white,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    });
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
