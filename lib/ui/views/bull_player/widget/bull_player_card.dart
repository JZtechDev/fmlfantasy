import 'package:fmlfantasy/app/app_colors/app_colors.dart';
import 'package:fmlfantasy/app/app_images/app_images.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/ui/helpers/commons.dart';
import 'package:fmlfantasy/ui/helpers/get_initials.dart';
import 'package:fmlfantasy/ui/helpers/replace_svg_with_png.dart';
import 'package:fmlfantasy/ui/views/bull_player/controller/bull_player_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class BullPlayerCard extends GetView<BullPlayerController> {
  const BullPlayerCard({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(BullPlayerController());

    return Obx(() => Column(
          children: controller.bullPlayer.map((player) {
            return LayoutBuilder(builder: (context, constraints) {
              double maxWidth = constraints.maxWidth;
              double bullPlayerCardPositionContainerWidth =
                  constraints.maxWidth > 600 ? 38.w : 43.21.w;
              double bullPlayerCardImageTop =
                  constraints.maxWidth > 600 ? 35.h : 40.h;
              double bullPlayerCardImageRight =
                  constraints.maxWidth > 600 ? 10.w : 20.w;
              double bullPlayerCardStarHeight =
                  constraints.maxWidth > 600 ? 12.h : 10.h;
              double bullPlayerCardStarWidth =
                  constraints.maxWidth > 600 ? 12.h : 10.h;
              return Container(
                padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 5.w),
                width: Get.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        verticalSpace(5.h),
                        Text(
                          player.teamName!.split(' ').join('\n'),
                          style: globalTextStyle2(
                              fontSize: maxWidth > 600 ? 10.sp : 12.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.textGray),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        verticalSpace(20.h),
                        Container(
                          height: 24.h,
                          width: 91.w,
                          decoration: BoxDecoration(
                              color: AppColors.errorRed.withOpacity(0.8),
                              borderRadius: BorderRadius.circular(19.r)),
                          child: Padding(
                            padding: EdgeInsets.only(left: 7.w, right: 7.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SvgPicture.asset(AppImages.star,
                                    height: bullPlayerCardStarHeight,
                                    width: bullPlayerCardStarWidth),
                                Text(
                                  'Bull Player',
                                  style: globalTextStyle2(
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                        verticalSpace(20.h),
                        Text(
                          player.fullName!.split(' ').join('\n'),
                          style: globalTextStyle(
                              fontSize: maxWidth > 600 ? 16.sp : 22.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.dark),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    Positioned(
                      bottom: 0.h,
                      right: bullPlayerCardImageRight,
                      top: bullPlayerCardImageTop,
                      child: controller.sportName == 'FB'
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
                                        : player.jerseyImageUrl!.endsWith('svg')
                                            ? SvgPicture.network(
                                                player.jerseyImageUrl!,
                                              )
                                            : Image.network(
                                                player.jerseyImageUrl!,
                                              ),
                                    player.jerseyImageUrl == null
                                        ? const SizedBox()
                                        : Positioned(
                                            top: 22.h,
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
                                                      BorderRadius.circular(
                                                          2.r)),
                                              child: Text(
                                                textAlign: TextAlign.center,
                                                player.fullName!
                                                    .split(' ')
                                                    .last,
                                                style: globalTextStyle(
                                                    fontSize: 10.sp,
                                                    color: AppColors.dark),
                                              ),
                                            ),
                                          ),
                                    player.jerseyImageUrl == null
                                        ? const SizedBox()
                                        : Align(
                                            alignment: Alignment.center,
                                            child: Container(
                                              height: 25.h,
                                              width: 25.w,
                                              padding: const EdgeInsets.only(
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
                                                textAlign: TextAlign.center,
                                                player.jerseyNumber ?? 'N/A',
                                                style: globalTextStyle(
                                                    fontSize: 12.sp,
                                                    color: AppColors.dark),
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
                                  ? controller.sportName == 'CR'
                                      ? Image.network(
                                          replaceSvgWithPng(player.imageUrl!),
                                          height: 100,
                                          width: 100,
                                        )
                                      : SvgPicture.network(
                                          player.imageUrl!,
                                        )
                                  : Image.network(
                                      player.imageUrl!,
                                    ),
                    ),
                    Positioned(
                      right: 10.w,
                      top: 10.h,
                      child: Container(
                        alignment: Alignment.center,
                        height: 22.11.h,
                        width: bullPlayerCardPositionContainerWidth,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.black,
                        ),
                        child: Text(
                          getInitials(player.position ?? ''),
                          style: globalTextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            });
          }).toList(),
        ));
  }
}
