import 'package:fmlfantasy/app/app_colors/app_colors.dart';
import 'package:fmlfantasy/app/app_images/app_images.dart';
import 'package:fmlfantasy/app/app_sizings.dart';
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
              double bullPlayerCardImageRight =
                  constraints.maxWidth > 600 ? 10.w : 20.w;
              return Container(
                width: Get.width,
                height: Get.height * 0.2,
                decoration: BoxDecoration(
                    color: AppColors.secondary,
                    borderRadius: BorderRadius.circular(5)),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        verticalSpace(5.h),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, top: 10),
                          child: Text(
                            player.teamName ?? '',
                            style: globalTextStyle2(
                                fontSize: maxWidth > 600 ? 10.sp : 12.sp,
                                fontWeight: FontWeight.w700,
                                color: AppColors.darkGreen),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        verticalSpace(30.h),
                        Container(
                          width: Get.width * 0.35,
                          decoration: BoxDecoration(
                              color: AppColors.backgroud,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10.r),
                                  bottomRight: Radius.circular(10.r))),
                          child: Padding(
                            padding: const EdgeInsets.all(7),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset(AppImages.star,
                                    height: 20, width: 20),
                                horizontalSpace(5.w),
                                Text(
                                  'Star Player',
                                  style: globalTextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      bottom: 10.h,
                      right: bullPlayerCardImageRight,
                      child: Container(
                        constraints: BoxConstraints(
                          maxHeight: 120.h,
                          maxWidth: 120.w,
                        ),
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
                    ),
                    Positioned(
                        right: 10.w,
                        top: 10.h,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 5),
                          decoration: BoxDecoration(
                              color: AppColors.backgroud,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(5.r),
                              )),
                          child: Text(
                            getInitials(player.position!),
                            style: globalTextStyle(
                                fontSize:
                                    AppSizing.isTablet(context) ? 8.sp : 10.sp,
                                fontWeight: FontWeight.w700,
                                color: AppColors.white),
                          ),
                        )),
                    Positioned(
                        bottom: 2,
                        right: 2,
                        left: 2,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 3, horizontal: 5),
                          decoration: const BoxDecoration(
                            color: Color.fromRGBO(18, 96, 85, 1),
                          ),
                          child: Text(
                            player.fullName ?? '',
                            style: globalTextStyle(
                                fontSize:
                                    AppSizing.isTablet(context) ? 8.sp : 14.sp,
                                fontWeight: FontWeight.w700,
                                color: AppColors.secondary),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        )),
                  ],
                ),
              );
            });
          }).toList(),
        ));
  }
}
