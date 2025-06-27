import 'dart:developer';

import 'package:fmlfantasy/app/app_images/app_images.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/model/my_draws_model.dart';
import 'package:fmlfantasy/ui/components/home_appbar.dart';
import 'package:fmlfantasy/ui/helpers/local_time.dart';
import 'package:fmlfantasy/ui/views/my_draws/controller/my_draws_controller.dart';
import 'package:fmlfantasy/ui/views/my_draws/widget/expansion_tile_players.dart';
import 'package:fmlfantasy/ui/views/my_draws/widget/table_skeleton.dart';
import 'package:fmlfantasy/ui/widgets/navigation_buttons.dart';
import 'package:fmlfantasy/ui/widgets/primary_button.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';

class DrawsLeaderboardTable extends GetView<MyDrawsController> {
  final DrawTeamsModel myDrawsTeams;
  const DrawsLeaderboardTable({super.key, required this.myDrawsTeams});

  @override
  Widget build(BuildContext context) {
    Get.put(MyDrawsController());
    return Scaffold(
        appBar: const HomeAppBar(title: 'Draws Leaderboard'),
        body: CustomScrollView(slivers: [
          const NavigationButtons(),
          SliverToBoxAdapter(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(20.h),
                Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(18, 96, 85, 1),
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.dark,
                          borderRadius: BorderRadius.circular(5.r),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 60.h,
                                  decoration: BoxDecoration(
                                    color:
                                        const Color.fromRGBO(77, 134, 126, 1),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5.r),
                                      bottomLeft: Radius.circular(5.r),
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Column(
                                          children: [
                                            Image.asset(
                                              'assets/new_images/medal.png',
                                              color: AppColors.secondary,
                                              height: 20.h,
                                              width: 20.w,
                                            ),
                                            verticalSpace(5.h),
                                            Text(
                                              'WINNER',
                                              style: globalTextStyle(
                                                  fontSize: 10.sp,
                                                  fontWeight: FontWeight.w700,
                                                  color: AppColors.secondary),
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 50.h,
                                        child: const VerticalDivider(
                                          color: AppColors.secondary,
                                          thickness: 1,
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 10),
                                        child: Text(
                                          myDrawsTeams.homeTeamName.toString(),
                                          style: globalTextStyle(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w700,
                                              color: AppColors.white),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                horizontalSpace(1),
                                Expanded(
                                  child: Container(
                                    height: 60.h,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: const Color.fromRGBO(
                                          217, 217, 217, 1),
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(5.r),
                                        bottomRight: Radius.circular(5.r),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '\$1200',
                                          style: globalTextStyle(
                                              fontSize: 28.sp,
                                              fontWeight: FontWeight.w500,
                                              color: AppColors.dark),
                                        ),
                                        horizontalSpace(5.w),
                                        Text(
                                          'Winning\nPrize',
                                          style: globalTextStyle(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w700,
                                              color: AppColors.dark),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                            verticalSpace(10.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/new_images/calender.png',
                                  height: 20.h,
                                  color: AppColors.secondary,
                                ),
                                horizontalSpace(10.w),
                                Text(
                                  formatEndDateTime(DateTime.parse(
                                          myDrawsTeams.matchStartsAt.toString())
                                      .toLocal()),
                                  style: globalTextStyle2(
                                      fontSize: 14.sp,
                                      color: AppColors.secondary),
                                ),
                              ],
                            ),
                            verticalSpace(10.h)
                          ],
                        ),
                      ),
                      verticalSpace(10.h),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 15, right: 15, bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              myDrawsTeams.homeTeamName ?? '',
                              style: globalTextStyle(
                                  fontSize: 12.sp, fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              height: 20.h,
                              child: const VerticalDivider(
                                color: AppColors.secondary,
                                thickness: 1.0,
                              ),
                            ),
                            Text(
                              myDrawsTeams.homeTeamName ?? '',
                              style: globalTextStyle(
                                  fontSize: 12.sp, fontWeight: FontWeight.w700),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Obx(
                  () => Container(
                    padding: EdgeInsets.only(
                        left: 5.w, right: 5.w, top: 10.h, bottom: 10.h),
                    margin: EdgeInsets.only(left: 10.w, right: 10.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      color: AppColors.backgroud,
                    ),
                    child: Column(children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.r),
                          color: AppColors.primaryLight,
                        ),
                        child: controller.isLoading.value
                            ? const TableSkeleton()
                            : Column(
                                children: [
                                  ...controller.myDrawsDetails
                                      .asMap()
                                      .entries
                                      .map((e) {
                                    log(e.key.toString());

                                    final index = e.key;
                                    final draws = e.value;
                                    return AnimatedContainer(
                                        clipBehavior: Clip.hardEdge,
                                        height: controller.expanded[index]
                                            ? 250.h
                                            : 40.h,
                                        duration:
                                            const Duration(milliseconds: 400),
                                        margin: EdgeInsets.only(bottom: 5.h),
                                        // padding:
                                        //     EdgeInsets.symmetric(vertical: 5.h),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5.r),
                                            color: AppColors.primaryLight),
                                        child: OverflowBox(
                                          alignment: Alignment.topCenter,
                                          minHeight: 40.h,
                                          maxHeight: 250.h,
                                          fit: OverflowBoxFit.deferToChild,
                                          child: Stack(
                                            children: [
                                              Container(
                                                width: 5.w,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.r),
                                                  color: AppColors.secondary,
                                                ),
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 5.w,
                                                        right: 5.w,
                                                        bottom: 10.h,
                                                        top: 10),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        horizontalSpace(5.w),
                                                        Expanded(
                                                          child: Text(
                                                              draws.rank!,
                                                              style: globalTextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  fontSize:
                                                                      14.sp)),
                                                        ),
                                                        Expanded(
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                  draws.winLevel!
                                                                          .isEmpty
                                                                      ? 'N/A'
                                                                      : draws
                                                                          .winLevel!,
                                                                  style: globalTextStyle(
                                                                      color: AppColors
                                                                          .secondary,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700,
                                                                      fontSize:
                                                                          14.sp)),
                                                              Text(
                                                                '#${draws.drawUserEntryID}',
                                                                style: globalTextStyle2(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontSize:
                                                                        12.sp,
                                                                    color: AppColors
                                                                        .white),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Column(
                                                            children: [
                                                              Text(
                                                                  "${draws.dmpPoints.toString()} Pts",
                                                                  style: globalTextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700,
                                                                      color: AppColors
                                                                          .secondary,
                                                                      fontSize:
                                                                          14.sp)),
                                                              Text(
                                                                  "dMPPoints"
                                                                      .tr,
                                                                  style: globalTextStyle2(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      fontSize:
                                                                          12.sp,
                                                                      color: AppColors
                                                                          .white)),
                                                            ],
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Column(
                                                            children: [
                                                              Text(
                                                                  " \$${draws.winning!.toStringAsFixed(0)}",
                                                                  style: globalTextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700,
                                                                      color: AppColors
                                                                          .secondary,
                                                                      fontSize:
                                                                          14.sp)),
                                                              Text("winning".tr,
                                                                  style: globalTextStyle2(
                                                                      fontSize:
                                                                          12.sp,
                                                                      color: AppColors
                                                                          .white)),
                                                            ],
                                                          ),
                                                        ),
                                                        GestureDetector(
                                                          onTap: () {
                                                            controller.expanded[
                                                                    index] =
                                                                !controller
                                                                        .expanded[
                                                                    index];
                                                          },
                                                          child: Container(
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      right:
                                                                          5.w),
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      vertical:
                                                                          5.h,
                                                                      horizontal:
                                                                          8.w),
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: AppColors
                                                                    .secondary,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5.r),
                                                              ),
                                                              child:
                                                                  Image.asset(
                                                                controller.expanded[
                                                                            index] ==
                                                                        true
                                                                    ? AppImages
                                                                        .arrowUp
                                                                    : AppImages
                                                                        .arrowDown,
                                                                height: 20,
                                                                color: AppColors
                                                                    .darkGreen,
                                                              )),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 7.w),
                                                    child: Wrap(
                                                      spacing: 2.w,
                                                      runSpacing: 10,
                                                      clipBehavior:
                                                          Clip.hardEdge,
                                                      alignment:
                                                          WrapAlignment.start,
                                                      children: [
                                                        ExpansionTilePlayers(
                                                          playerName: draws
                                                                  .player1Name ??
                                                              '-',
                                                          playerPosition: 'PG',
                                                          playerTeam: draws
                                                                  .player1Team ??
                                                              '-',
                                                          playerImageUrl: draws
                                                                  .player1ImageUrl ??
                                                              '',
                                                          rank: '01',
                                                        ),
                                                        ExpansionTilePlayers(
                                                          playerName: draws
                                                              .player2Name!,
                                                          playerPosition: 'PG',
                                                          playerTeam: draws
                                                                  .player2Team ??
                                                              '-',
                                                          playerImageUrl: draws
                                                                  .player2ImageUrl ??
                                                              '',
                                                          rank: '02',
                                                        ),
                                                        ExpansionTilePlayers(
                                                          playerName: draws
                                                              .player3Name!,
                                                          playerPosition: 'PG',
                                                          playerTeam: draws
                                                                  .player3Team ??
                                                              '-',
                                                          playerImageUrl: draws
                                                                  .player3ImageUrl ??
                                                              '',
                                                          rank: '03',
                                                        ),
                                                        ExpansionTilePlayers(
                                                          playerName: draws
                                                              .player4Name!,
                                                          playerPosition: 'PG',
                                                          playerTeam: draws
                                                                  .player4Team ??
                                                              '-',
                                                          playerImageUrl: draws
                                                                  .player4ImageUrl ??
                                                              '',
                                                          rank: '04',
                                                        ),
                                                        ExpansionTilePlayers(
                                                          playerName: draws
                                                              .player5Name!,
                                                          playerPosition: 'PG',
                                                          playerTeam: draws
                                                                  .player5Team ??
                                                              '-',
                                                          playerImageUrl: draws
                                                                  .player5ImageUrl ??
                                                              '',
                                                          rank: '05',
                                                        ),
                                                        Column(
                                                          children: [
                                                            SizedBox(
                                                              width: Get.width *
                                                                  0.3,
                                                              child: Row(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Container(
                                                                      width: Get
                                                                              .width *
                                                                          0.21,
                                                                      height: Get
                                                                              .height *
                                                                          0.09,
                                                                      padding:
                                                                          const EdgeInsets
                                                                              .all(
                                                                              5),
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(5.r),
                                                                        color: AppColors
                                                                            .primaryDark,
                                                                      ),
                                                                      child: Container(
                                                                          padding: const EdgeInsets.all(5),
                                                                          decoration: BoxDecoration(
                                                                            borderRadius:
                                                                                BorderRadius.circular(2.5.r),
                                                                            color:
                                                                                AppColors.primaryDark,
                                                                          ),
                                                                          child: e.value.winnerTeamImageUrl == '' || e.value.winnerTeamImageUrl == null
                                                                              ? Image.asset(
                                                                                  AppImages.userPlaceHolder,
                                                                                  height: 75,
                                                                                )
                                                                              : e.value.winnerTeamImageUrl!.endsWith('.svg')
                                                                                  ? SvgPicture.network(
                                                                                      e.value.winnerTeamImageUrl!,
                                                                                    )
                                                                                  : Image.network(
                                                                                      e.value.winnerTeamImageUrl!,
                                                                                    ))),
                                                                  horizontalSpace(
                                                                      2.w),
                                                                  Container(
                                                                    alignment:
                                                                        Alignment
                                                                            .center,
                                                                    padding: EdgeInsets.only(
                                                                        left: 5,
                                                                        right:
                                                                            5,
                                                                        bottom: 15
                                                                            .h,
                                                                        top: 15
                                                                            .h),
                                                                    width: 20.w,
                                                                    decoration: BoxDecoration(
                                                                        color: AppColors
                                                                            .secondary,
                                                                        borderRadius:
                                                                            BorderRadius.circular(2.5.r)),
                                                                    child: RotatedBox(
                                                                        quarterTurns: 3,
                                                                        child: Text(
                                                                          'Winner',
                                                                          style: globalTextStyle(
                                                                              fontSize: 10.sp,
                                                                              fontWeight: FontWeight.w600,
                                                                              color: AppColors.backgroud),
                                                                        )),
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                            verticalSpace(10.h),
                                                            SizedBox(
                                                              width: Get.width *
                                                                  0.28,
                                                              child: Text(
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                e.value.winnnerTeamName ??
                                                                    '-',
                                                                style: globalTextStyle(
                                                                    fontSize:
                                                                        10.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    color: AppColors
                                                                        .dark),
                                                              ),
                                                            ),
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ));
                                  }),
                                ],
                              ),
                      ),
                      verticalSpace(10.h),
                      PrimaryButton(
                        buttonText: 'viewLeaderBoard'.tr,
                        onPressed: () {},
                        isEnabled: true,
                        padding: 0,
                      )
                    ]),
                  ),
                ),
              ],
            ),
          )
        ]));
  }
}
