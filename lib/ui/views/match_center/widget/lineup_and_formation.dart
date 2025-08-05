import 'package:fmlfantasy/app/app_sizings.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/config/global_instances.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/new_model/match_center_inner_new.dart';
import 'package:fmlfantasy/ui/views/match_center/controller/match_center_inner_controller.dart';
import 'package:fmlfantasy/ui/views/match_center/pitches/cricket_ground.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fmlfantasy/ui/views/match_center/player_details.dart';

class LineupAndFormation extends GetView<MatchCenterInner> {
  final MatchCenterInnerNew data;
  const LineupAndFormation({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    Get.put(MatchCenterInner());
    return Obx(() {
      List<PlayerMatchStatistic> filteredPlayers = controller
              .playersTabIsAway.value
          ? data.playerMatchStatistics!
              .where((player) => player.teamKey == data.awayTeamKey)
              .toList()
          : data.playerMatchStatistics!
              .where((player) => player.teamKey == data.homeTeamKey)
              .toList();
      if (controller.isLineup.value) {
        return Column(
          children: [
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: filteredPlayers.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                PlayerMatchStatistic topPlayers = filteredPlayers[index];
                return GestureDetector(
                    onTap: () {
                      Get.to(() => PlayerDetails(
                            playersdata: topPlayers,
                          ));
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: Row(children: [
                        Hero(
                          tag: topPlayers.playerKey,
                          child: Container(
                              padding: const EdgeInsets.all(5),
                              width: 70.w,
                              height: 71.h,
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5.r),
                                    bottomLeft: Radius.circular(5.r)),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                      constraints: BoxConstraints(
                                        maxWidth: 20.w,
                                        maxHeight: 20.h,
                                      ),
                                      child: topPlayers.headshotImageUrl
                                              .endsWith('svg')
                                          ? SvgPicture.network(
                                              topPlayers.headshotImageUrl,
                                              height: 30,
                                              width: 30,
                                            )
                                          : Image.network(
                                              topPlayers.headshotImageUrl,
                                              height: 30,
                                              width: 30,
                                            )),
                                  verticalSpace(2.h),
                                  Text(
                                    topPlayers.rank.toString().padLeft(2, '0'),
                                    style: globalTextStyle2(
                                        fontWeight: FontWeight.w700,
                                        fontSize: AppSizing.isMobile(context)
                                            ? 14.sp
                                            : 10.sp,
                                        color: AppColors.navyBlue),
                                  ),
                                ],
                              )),
                        ),
                        Expanded(
                          child: Container(
                              alignment: Alignment.center,
                              height: 71.h,
                              padding: const EdgeInsets.all(5),
                              decoration: const BoxDecoration(
                                color: AppColors.primaryLight,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    topPlayers.playerName,
                                    style: globalTextStyle2(
                                        fontWeight: FontWeight.w700,
                                        fontSize: AppSizing.isMobile(context)
                                            ? 14.sp
                                            : 10.sp,
                                        color: AppColors.white),
                                  ),
                                  verticalSpace(2.h),
                                  Text(
                                    topPlayers.role
                                        .split('_')
                                        .join(' ')
                                        .capitalizeFirst!,
                                    style: globalTextStyle2(
                                        fontWeight: FontWeight.w700,
                                        fontSize: AppSizing.isMobile(context)
                                            ? 12.sp
                                            : 8.sp,
                                        color: AppColors.white),
                                  ),
                                ],
                              )),
                        ),
                        Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(5),
                            width: 70.w,
                            height: 71.h,
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(5.r),
                                  bottomRight: Radius.circular(5.r)),
                            ),
                            child:
                                Row(mainAxisSize: MainAxisSize.min, children: [
                              Text(
                                topPlayers.totalFantasyPoints
                                    .toStringAsFixed(0),
                                style: globalTextStyle2(
                                    fontWeight: FontWeight.w700,
                                    fontSize: AppSizing.isMobile(context)
                                        ? 14.sp
                                        : 8.sp,
                                    color: AppColors.navyBlue),
                              ),
                              horizontalSpace(10.w),
                              Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  border: Border.all(color: AppColors.dark),
                                  color: AppColors.white,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(FlutterRemix.arrow_right_s_line,
                                    color: AppColors.dark,
                                    size: AppSizing.isMobile(context)
                                        ? 13.sp
                                        : 10.sp),
                              ),
                            ]))
                      ]),
                    ));
              },
            ),
          ],
        );
      } else {
        switch (selectedSPort.value) {
          case 'CR':
            return CricketGround(data: filteredPlayers);
          // case 'FB':
          //   return FootballGround(data: filteredPlayers);
          // case 'BB':
          //   return BasketballGround(data: filteredPlayers);
        }
      }
      return Container();
    });
  }
}
