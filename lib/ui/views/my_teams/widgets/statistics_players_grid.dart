import 'package:fmlfantasy/app/app_colors/app_colors.dart';
import 'package:fmlfantasy/app/app_images/app_images.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/model/my_teams_players_model.dart';
import 'package:fmlfantasy/ui/helpers/commons.dart';
import 'package:fmlfantasy/ui/views/my_teams/controller/my_teams_controller.dart';
import 'package:fmlfantasy/ui/views/my_teams/skeleton/skeleton_statistics_player_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class PlayerGridView extends GetView<MyTeamsController> {
  const PlayerGridView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyTeamsController());
    return Obx(
      () => controller.isLoadingMyTeamPlayer.value
          ? const SkeletonStatisticsPlayerGrid()
          : GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: controller.myTeamPlayers.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, mainAxisSpacing: 25, mainAxisExtent: 155.w
                  //crossAxisSpacing: 2,
                  // childAspectRatio: 1,
                  ),
              itemBuilder: (context, index) {
                MyTeamPlayersModel player = controller.myTeamPlayers[index];
                return Column(
                  children: [
                    Container(
                      height: 80.h,
                      width: 103.w,
                      decoration: BoxDecoration(
                        color: AppColors.grey, // Change color if needed
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Stack(
                        alignment: Alignment.topLeft,
                        clipBehavior: Clip.none,
                        fit: StackFit.passthrough,
                        children: [
                          Positioned(
                            top: -10,
                            left: 0,
                            right: 0,
                            bottom: 0,
                            child: controller.selectedSport.value == 'FB'
                                ? player.imageUrl == null
                                    ? Stack(
                                        clipBehavior: Clip.hardEdge,
                                        alignment: Alignment.center,
                                        children: [
                                          player.jerseyImageUrl == null
                                              ? Image.asset(
                                                  excludeFromSemantics: true,
                                                  isAntiAlias: true,
                                                  AppImages.userPlaceHolder,
                                                )
                                              : player.jerseyImageUrl!
                                                      .endsWith('svg')
                                                  ? SvgPicture.network(
                                                      player.jerseyImageUrl!,
                                                    )
                                                  : Image.network(
                                                      player.jerseyImageUrl!,
                                                    ),
                                          player.jerseyImageUrl == null
                                              ? const SizedBox()
                                              : Positioned(
                                                  top: 15.h,
                                                  child: Container(
                                                    padding: EdgeInsets.only(
                                                      left: 2.w,
                                                      right: 2.w,
                                                      top: 1.h,
                                                      bottom: 1.h,
                                                    ),
                                                    alignment: Alignment.center,
                                                    decoration: BoxDecoration(
                                                        color: AppColors.white
                                                            .withOpacity(0.9),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(2.r)),
                                                    child: Text(
                                                      textAlign:
                                                          TextAlign.center,
                                                      player.name!
                                                          .split(' ')
                                                          .last,
                                                      style: globalTextStyle(
                                                          fontSize: 8.sp,
                                                          color:
                                                              AppColors.dark),
                                                    ),
                                                  ),
                                                ),
                                          player.jerseyImageUrl == null
                                              ? const SizedBox()
                                              : Align(
                                                  alignment: Alignment.center,
                                                  child: Container(
                                                    height: 28.h,
                                                    width: 28.w,
                                                    padding:
                                                        const EdgeInsets.only(
                                                      top: 5,
                                                      right: 5,
                                                      left: 5,
                                                      bottom: 5,
                                                    ),
                                                    alignment: Alignment.center,
                                                    decoration: BoxDecoration(
                                                        color: AppColors.white
                                                            .withOpacity(0.9),
                                                        shape: BoxShape.circle),
                                                    child: Text(
                                                      textAlign:
                                                          TextAlign.center,
                                                      player.jerseyNumber ??
                                                          'null',
                                                      style: globalTextStyle(
                                                          fontSize: 10.sp,
                                                          color:
                                                              AppColors.dark),
                                                    ),
                                                  ),
                                                ),
                                        ],
                                      )
                                    : player.jerseyImageUrl == null
                                        ? Image.asset(
                                            excludeFromSemantics: true,
                                            isAntiAlias: true,
                                            AppImages.userPlaceHolder,
                                          )
                                        : player.imageUrl!.endsWith('svg')
                                            ? SvgPicture.network(
                                                player.imageUrl!,
                                              )
                                            : Image.network(
                                                player.imageUrl!,
                                              )
                                : player.imageUrl == null
                                    ? Image.asset(
                                        excludeFromSemantics: true,
                                        isAntiAlias: true,
                                        AppImages.userPlaceHolder,
                                      )
                                    : player.imageUrl!.endsWith('svg')
                                        ? SvgPicture.network(
                                            player.imageUrl!,
                                          )
                                        : Image.network(
                                            player.imageUrl!,
                                          ),

                            // child: player.imageUrl == null
                            //     ? Image.asset(
                            //         AppImages.userPlaceHolder,
                            //       )
                            //     : Image.network(
                            //         replaceSvgWithPng(player.imageUrl!),
                            //       ),
                          ),
                        ],
                      ),
                    ),
                    verticalSpace(5.h),
                    Container(
                      alignment: Alignment.center,
                      //height: 5.h,
                      width: 103.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: player.isCaptain == true
                            ? AppColors.errorRed
                            : AppColors.grey,
                      ),

                      child: Padding(
                        padding: EdgeInsets.only(left: 10.w),
                        child: FittedBox(
                          child: Row(
                            mainAxisAlignment: player.isCaptain == true
                                ? MainAxisAlignment.start
                                : MainAxisAlignment.center,
                            children: [
                              player.isCaptain == true
                                  ? SvgPicture.asset(
                                      AppImages.star,
                                      height: 10.h,
                                      width: 10.w,
                                      // ignore: deprecated_member_use
                                      color: AppColors.white,
                                    )
                                  : const SizedBox(),
                              player.isCaptain == true
                                  ? horizontalSpace(10.w)
                                  : const SizedBox(),
                              Text(
                                '\$${player.investment!.toStringAsFixed(0)},000',
                                style: globalTextStyle2(
                                  color: player.isCaptain == true
                                      ? AppColors.white
                                      : AppColors.dark,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              horizontalSpace(1.w),
                              Text(
                                'salary'.tr,
                                style: globalTextStyle2(
                                  color: player.isCaptain == true
                                      ? AppColors.white
                                      : AppColors.dark,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    // verticalSpace(5.h),
                    SizedBox(
                      width: 103.w,
                      child: Text(
                        player.name ?? 'N/A',
                        style: globalTextStyle2(
                          fontSize: 12.sp,
                          color: AppColors.dark,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    // verticalSpace(2.h),
                    SizedBox(
                      width: 103.w,
                      child: Text(
                        player.team ?? 'N/A',
                        style: globalTextStyle2(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.textGray),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                );
              },
            ),
    );
  }
}
