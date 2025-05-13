import 'package:fmlfantasy/app/app_colors/app_colors.dart';
import 'package:fmlfantasy/app/app_images/app_images.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/model/monthly_leader_model.dart';
import 'package:fmlfantasy/ui/helpers/commons.dart';
import 'package:fmlfantasy/ui/views/monthly_leaderboard_inner/controller/monthly_inner_leaderboard_controller.dart';
import 'package:fmlfantasy/ui/views/monthly_leaderboard_inner/widget/monthy_leaderbiard_toggle.dart';
import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CarouselSliderTopPlayerToggle
    extends GetView<MonthlyInnerLeaderboardController> {
  const CarouselSliderTopPlayerToggle(this.topPlayers, {super.key});

  final List<TopPlayers> topPlayers;

  @override
  Widget build(BuildContext context) {
    Get.put(MonthlyInnerLeaderboardController());
    return LayoutBuilder(builder: (context, constraints) {
      //double maxWidth = constraints.maxWidth;
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 15.w),
                child: Text(
                  'topPlayers'.tr,
                  style: globalTextStyle(
                      fontSize: 24.sp, fontWeight: FontWeight.w600),
                ),
              ),
              Obx(
                () => MonthlyLeaderboardToggle(
                  iconPathN: 'assets/icons/arrowright.svg',
                  iconPathP: 'assets/icons/arrowright.svg',
                  onPrevious: () {
                    controller.onPreviousPlayerCard();
                  },
                  onNext: () {
                    controller.onNextPlayerCard();
                  },
                  previousButtonColor: controller.topPlayerCrouselIndex.value ==
                          controller.colorPlayerCrouselIndex.value - 0
                      ? AppColors.dark
                      : AppColors.white,
                  nextButtonColor: controller.topPlayerCrouselIndex.value ==
                          controller.colorPlayerCrouselIndex.value - 0
                      ? AppColors.white
                      : AppColors.dark,
                  previousIconColor: controller.topPlayerCrouselIndex.value ==
                          controller.colorPlayerCrouselIndex.value - 0
                      ? AppColors.white
                      : AppColors.dark,
                  nextIconColor: controller.topPlayerCrouselIndex.value ==
                          controller.colorPlayerCrouselIndex.value - 0
                      ? AppColors.dark
                      : AppColors.white,
                ),
              ),
            ],
          ),
          verticalSpace(10.h),
          CarouselSlider.builder(
            controller: controller.carouselController,
            itemCount: topPlayers.length,
            itemBuilder: (context, index, realIndex) {
              final player = topPlayers[index];
              return Padding(
                padding: EdgeInsets.only(
                  left: 20.h,
                ),
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  alignment: Alignment.center,
                                  //height: 55.h,
                                  width: 47.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.r),
                                      color: AppColors.navyBlue),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        AppImages.reward,
                                        // ignore: deprecated_member_use
                                        color: AppColors.white,
                                        height: 16.h,
                                        width: 16.w,
                                      ),
                                      verticalSpace(5.h),
                                      Text(
                                        player.rank.toString().padLeft(2, '0'),
                                        style: globalTextStyle(
                                          color: AppColors.white,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                verticalSpace(2.h),
                                Container(
                                  alignment: Alignment.center,
                                  height: 33.h,
                                  width: 47.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.r),
                                    color: AppColors.primary,
                                  ),
                                  child: Text(
                                    player.fantasyPoint!.toStringAsFixed(
                                        1), // Limit to 2 decimal places
                                    style: globalTextStyle(
                                      color: AppColors.white,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              ],
                            ),
                            horizontalSpace(5.w),
                            Container(
                              height: 90.h,
                              width: 101.w,
                              decoration: BoxDecoration(
                                color:
                                    AppColors.white, // Change color if needed
                                borderRadius: BorderRadius.circular(5.r),
                              ),
                              child: Stack(
                                  alignment: Alignment.topLeft,
                                  clipBehavior: Clip.none,
                                  children: [
                                    controller.sportName == 'FB'
                                        ? Positioned(
                                            top: -10,
                                            left: 0,
                                            right: 0,
                                            bottom: 0,
                                            child: Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                player.jerseyImage != null
                                                    ? player.jerseyImage!
                                                            .endsWith('.svg')
                                                        ? SvgPicture.network(
                                                            player.jerseyImage!)
                                                        : Image.network(
                                                            player.jerseyImage!)
                                                    : Image.asset(
                                                        AppImages
                                                            .userPlaceHolder,
                                                      ),
                                                Align(
                                                  alignment:
                                                      Alignment.topCenter,
                                                  heightFactor: 4,
                                                  child: Container(
                                                    height: 15.h,
                                                    width: 40.h,
                                                    padding: EdgeInsets.only(
                                                      left: 2.w,
                                                      right: 2.w,
                                                      top: 1.h,
                                                      bottom: 1.h,
                                                    ),
                                                    alignment: Alignment.center,
                                                    decoration: BoxDecoration(
                                                        color: AppColors.white
                                                            .withValues(
                                                                alpha: 0.9),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(2.r)),
                                                    child: Text(
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        player.jerseyName ==
                                                                null
                                                            ? player.name!
                                                                .split(' ')
                                                                .last
                                                            : player.jerseyName
                                                                .toString()
                                                                .padLeft(
                                                                    2, '0'),
                                                        style: globalTextStyle2(
                                                            fontSize: 10.sp,
                                                            color: AppColors
                                                                .dark)),
                                                  ),
                                                ),
                                                // Positioned(
                                                //   top: 15.h,
                                                //   child: Container(
                                                //     padding: EdgeInsets.only(
                                                //       left: 2.w,
                                                //       right: 2.w,
                                                //       top: 1.h,
                                                //       bottom: 1.h,
                                                //     ),
                                                //     alignment: Alignment.center,
                                                //     decoration: BoxDecoration(
                                                //         color: AppColors.white
                                                //             .withValues(alpha:0.9),
                                                //         borderRadius:
                                                //             BorderRadius
                                                //                 .circular(2.r)),
                                                //     child: Text(
                                                //       textAlign:
                                                //           TextAlign.center,
                                                //       player.jerseyName ??
                                                //           '-'.split(' ').last,
                                                //       style: globalTextStyle(
                                                //           fontSize: 8.sp,
                                                //           color:
                                                //               AppColors.dark),
                                                //     ),
                                                //   ),
                                                // ),
                                                player.jerseyNumber == null
                                                    ? const SizedBox()
                                                    : Align(
                                                        alignment:
                                                            Alignment.center,
                                                        child: Container(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  5.r),
                                                          decoration:
                                                              const BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            color:
                                                                AppColors.white,
                                                          ),
                                                          child: Text(
                                                            player.jerseyNumber ==
                                                                    null
                                                                ? ''
                                                                : player
                                                                    .jerseyNumber
                                                                    .toString()
                                                                    .padLeft(
                                                                        2, '0'),
                                                            style: globalTextStyle2(
                                                                fontSize: 8.sp,
                                                                color: AppColors
                                                                    .dark),
                                                            textAlign: TextAlign
                                                                .center,
                                                          ),
                                                        ),
                                                      )
                                              ],
                                            ))
                                        : Positioned(
                                            top: -10,
                                            left: 0,
                                            right: 0,
                                            bottom: 0,
                                            child: player.picture != null
                                                ? player.picture!
                                                        .endsWith('.svg')
                                                    ? SvgPicture.network(
                                                        player.picture!)
                                                    : Image.network(
                                                        player.picture!)
                                                : Image.asset(
                                                    AppImages.userPlaceHolder,
                                                  ),
                                          ),
                                  ]),
                            ),
                          ],
                        ),
                        verticalSpace(5.h),
                        SizedBox(
                          width: Get.width * 0.2,
                          child: Text(
                            player.name!,
                            style: globalTextStyle(
                                fontSize: 12.sp, fontWeight: FontWeight.w600),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              );
            },
            options: CarouselOptions(
                height: 150.h,
                aspectRatio: 0.9,
                viewportFraction: 0.5,
                scrollDirection: Axis.horizontal,
                enableInfiniteScroll: false,
                padEnds: false,
                onPageChanged: (index, reason) {
                  controller.topPlayerCrouselIndex.value = index;
                }),
          ),
        ],
      );
    });
  }
}
