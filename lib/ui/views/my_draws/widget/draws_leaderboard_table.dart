import 'dart:developer';

import 'package:fmlfantasy/app/app_images/app_images.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/model/my_draws_model.dart';
import 'package:fmlfantasy/ui/helpers/local_time.dart';
import 'package:fmlfantasy/ui/views/my_draws/controller/my_draws_controller.dart';
import 'package:fmlfantasy/ui/views/my_draws/widget/expansion_tile_players.dart';
import 'package:fmlfantasy/ui/views/my_draws/widget/table_skeleton.dart';
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
        backgroundColor: AppColors.grey,
        appBar: const AppBarGeneral(
          title: 'Draws Leaderboard',
          enableBorder: false,
        ),
        body: CustomScrollView(slivers: [
          SliverAppBar(
              expandedHeight: 45.h,
              automaticallyImplyLeading: false,
              pinned: true,
              backgroundColor: Colors.transparent,
              elevation: 0,
              flexibleSpace: Container(
                color: AppColors.white,
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.r),
                        color: AppColors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            myDrawsTeams.homeTeamName!.split(' ').join('\n'),
                            style: globalTextStyle2(
                              fontSize: 12.sp,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 5.h),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.r),
                              color: AppColors.grey,
                            ),
                            child: Text(
                              'won'.tr,
                              style: globalTextStyle(
                                  fontSize: 12.sp, color: AppColors.primary),
                            ),
                          )
                        ],
                      ),
                    )),
                    horizontalSpace(5.w),
                    Expanded(
                        child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.r),
                        color: AppColors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'totalwinning'.tr,
                            style: globalTextStyle2(
                                fontSize: 12.sp, color: AppColors.textGray),
                          ),
                          Text(
                            '\$500',
                            style: globalTextStyle(
                                fontSize: 24.sp, fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                    ))
                  ],
                ),
              )),
          SliverToBoxAdapter(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(10.h),
                Container(
                  alignment: Alignment.center,
                  width: Get.width,
                  margin: EdgeInsets.symmetric(horizontal: 15.w),
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(AppImages.calender, height: 10.h),
                      horizontalSpace(5.w),
                      Text(
                        formatEndDateTime(DateTime.parse(
                                myDrawsTeams.matchStartsAt.toString())
                            .toLocal()),
                        style: globalTextStyle2(fontSize: 12.sp),
                      ),
                    ],
                  ),
                ),
                verticalSpace(10.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          width: Get.width,
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(5.r),
                          ),
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                width: Get.width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.r),
                                  color: AppColors.grey,
                                ),
                                child: Text(
                                  'TBD',
                                  style: globalTextStyle(
                                      fontSize: 24.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              verticalSpace(10.h),
                              Image.asset(
                                'assets/images/team.png',
                                height: 45,
                              ),
                              verticalSpace(10),
                              SizedBox(
                                width: Get.width * 0.41,
                                child: Text(
                                  'Los Angeles Clippers',
                                  style: globalTextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              verticalSpace(5.h),
                            ],
                          ),
                        ),
                      ),
                      horizontalSpace(5.w),
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          width: Get.width,
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(5.r),
                          ),
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                width: Get.width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.r),
                                  color: AppColors.grey,
                                ),
                                child: Text(
                                  'TBD',
                                  style: globalTextStyle(
                                      fontSize: 24.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              verticalSpace(10.h),
                              Image.asset(
                                'assets/images/team.png',
                                height: 45,
                              ),
                              verticalSpace(10),
                              SizedBox(
                                width: Get.width * 0.41,
                                child: Text(
                                  'Los Angeles Clippers',
                                  style: globalTextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              verticalSpace(5.h),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                verticalSpace(5.h),
                Obx(
                  () => Container(
                    padding: EdgeInsets.only(
                        left: 5.w, right: 5.w, top: 10.h, bottom: 10.h),
                    margin: EdgeInsets.only(left: 10.w, right: 10.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      color: AppColors.white,
                    ),
                    child: Column(children: [
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.r),
                          color: AppColors.grey,
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
                                        padding:
                                            EdgeInsets.symmetric(vertical: 5.h),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5.r),
                                            color: AppColors.white),
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
                                                  color: AppColors.navyBlue,
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
                                                        bottom: 10.h),
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
                                                              style:
                                                                  globalTextStyle(
                                                                      fontSize:
                                                                          10.sp)),
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
                                                                      fontSize:
                                                                          10.sp)),
                                                              Text(
                                                                '#${draws.drawUserEntryID}',
                                                                style: globalTextStyle2(
                                                                    fontSize:
                                                                        10.sp,
                                                                    color: AppColors
                                                                        .textGray),
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
                                                                      fontSize:
                                                                          10.sp)),
                                                              Text(
                                                                  "dMPPoints"
                                                                      .tr,
                                                                  style: globalTextStyle2(
                                                                      fontSize:
                                                                          8.sp,
                                                                      color: AppColors
                                                                          .textGray)),
                                                            ],
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Column(
                                                            children: [
                                                              Text(
                                                                  " \$${draws.winning!.toStringAsFixed(0)}",
                                                                  style: globalTextStyle(
                                                                      fontSize:
                                                                          10.sp)),
                                                              Text("winning".tr,
                                                                  style: globalTextStyle2(
                                                                      fontSize:
                                                                          8.sp,
                                                                      color: AppColors
                                                                          .textGray)),
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
                                                                    .grey,
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
                                                                            .grey,
                                                                      ),
                                                                      child: Container(
                                                                          padding: const EdgeInsets.all(5),
                                                                          decoration: BoxDecoration(
                                                                            borderRadius:
                                                                                BorderRadius.circular(2.5.r),
                                                                            color:
                                                                                AppColors.white,
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
                                                                            .navyBlue,
                                                                        borderRadius:
                                                                            BorderRadius.circular(2.5.r)),
                                                                    child: RotatedBox(
                                                                        quarterTurns: 3,
                                                                        child: Text(
                                                                          'Winner',
                                                                          style: globalTextStyle(
                                                                              fontSize: 10.sp,
                                                                              fontWeight: FontWeight.w600,
                                                                              color: AppColors.white),
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
