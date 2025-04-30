import 'dart:math';

import 'package:fmlfantasy/app/app_colors/app_colors.dart';
import 'package:fmlfantasy/app/app_images/app_images.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/model/select_player_model.dart';
import 'package:fmlfantasy/ui/helpers/commons.dart';
import 'package:fmlfantasy/ui/helpers/get_initials.dart';
import 'package:fmlfantasy/ui/helpers/replace_svg_with_png.dart';
import 'package:fmlfantasy/ui/views/bull_player/controller/bull_player_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class Playergrid extends GetView<BullPlayerController> {
  const Playergrid({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(BullPlayerController());
    return LayoutBuilder(builder: (context, constraints) {
      double maxWidth = constraints.maxWidth;
      constraints.maxWidth > 600 ? 80 : 45.h;
      double bullPlayerPositionContainerWidth =
          constraints.maxWidth > 600 ? 32.w : 43.21.w;
      return GridView.builder(
          physics: const ScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: constraints.maxWidth > 600 ? 3 : 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 0.95,
          ),
          itemCount: controller.selectedPlayers.length,
          padding: const EdgeInsets.only(left: 10, right: 10),
          shrinkWrap: true,
          itemBuilder: ((context, index) {
            Players player = controller.selectedPlayers[index];

            return GestureDetector(
              onTap: () {
                controller.selectBullPlayer(player);
                for (var p in controller.selectedPlayers) {
                  p.isBull.value = false;
                }
                player.isBull.value = true;
              },
              child: Obx(
                () => Container(
                  padding: EdgeInsets.only(left: 10.w, top: 10.h),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: player.isBull.value
                          ? AppColors.secondary
                          : AppColors.backgroud,
                      width: 1,
                    ),
                    gradient: LinearGradient(
                      colors: [
                        player.isBull.value
                            ? const Color.fromRGBO(51, 163, 147, 1)
                            : const Color.fromRGBO(31, 54, 22, 1),
                        // 30% of this color
                        const Color.fromRGBO(
                            18, 96, 85, 1), // 70% of this color
                      ],
                      stops: const [0.6, 0.6],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Stack(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            player.teamName == null
                                ? '-'
                                : player.teamName!.split(' ').join('\n'),
                            style: globalTextStyle(
                                fontSize: maxWidth > 600 ? 8.sp : 12.sp,
                                fontWeight: FontWeight.w700,
                                color: AppColors.white),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          verticalSpace(10.h),
                          Text(
                            "${player.assetIndexPrice!.toStringAsFixed(0)},000\$",
                            style: globalTextStyle(
                                fontSize: maxWidth > 600 ? 16.sp : 16.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColors.secondary),
                          ),
                          Text(
                            'SALARY'.tr,
                            style: globalTextStyle2(
                                fontSize: maxWidth > 600 ? 10.sp : 11.sp,
                                fontWeight: FontWeight.w700,
                                color: AppColors.white),
                          ),
                          Expanded(child: Container()),
                          SizedBox(
                            width: 73.w,
                            child: Text(
                              player.fullName!.split(' ').join('\n'),
                              style: globalTextStyle(
                                  fontSize: maxWidth > 600 ? 8.sp : 12.sp,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.secondary),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          ),
                          verticalSpace(20)
                        ],
                      ),
                      Positioned(
                          right: 20,
                          child: Container(
                              alignment: Alignment.center,
                              width: bullPlayerPositionContainerWidth,
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: AppColors.backgroud,
                              ),
                              child: Text(
                                getInitials(player.position ?? ''),
                                style: globalTextStyle2(
                                  fontSize: maxWidth > 600 ? 8.sp : 12.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.white,
                                ),
                              ))),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: SizedBox(
                          width: maxWidth > 600 ? 150 : 120,
                          height: maxWidth > 600 ? 150 : 120,
                          child: AspectRatio(
                            aspectRatio: 1,
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
                                                  width: maxWidth > 600
                                                      ? Get.width * 0.3
                                                      : Get.width * 0.32,
                                                )
                                              : player.jerseyImageUrl!
                                                      .endsWith('svg')
                                                  ? SvgPicture.network(
                                                      player.jerseyImageUrl!,
                                                      width: maxWidth > 600
                                                          ? 150
                                                          : 120,
                                                    )
                                                  : Image.network(
                                                      player.jerseyImageUrl!,
                                                      width: maxWidth > 600
                                                          ? 150
                                                          : 120,
                                                    ),
                                          player.jerseyImageUrl == null
                                              ? const SizedBox()
                                              : Positioned(
                                                  top: 18.h,
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
                                                      player.fullName!
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
                                                    height: 25.h,
                                                    width: 25.w,
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
                                                          'N/A',
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
                                            width: maxWidth > 600
                                                ? Get.width * 0.3
                                                : Get.width * 0.32,
                                          )
                                        : player.imageUrl!.endsWith('svg')
                                            ? SvgPicture.network(
                                                player.imageUrl!,
                                                width:
                                                    maxWidth > 600 ? 150 : 120,
                                              )
                                            : Image.network(
                                                player.imageUrl!,
                                                width: maxWidth > 600
                                                    ? 150
                                                    : controller.sportName ==
                                                            'FB'
                                                        ? 60
                                                        : 120,
                                              )
                                : player.imageUrl == null
                                    ? Image.asset(
                                        excludeFromSemantics: true,
                                        isAntiAlias: true,
                                        AppImages.userPlaceHolder,
                                        width: maxWidth > 600
                                            ? Get.width * 0.3
                                            : Get.width * 0.32,
                                      )
                                    : player.imageUrl!.endsWith('svg')
                                        ? controller.sportName == 'CR'
                                            ? Image.network(
                                                replaceSvgWithPng(
                                                    player.imageUrl!),
                                                height: 50,
                                                width: 50,
                                              )
                                            : SvgPicture.network(
                                                player.imageUrl!,
                                                width:
                                                    maxWidth > 600 ? 150 : 100,
                                              )
                                        : Image.network(
                                            player.imageUrl!,
                                            width: maxWidth > 600
                                                ? 150
                                                : controller.sportName == 'FB'
                                                    ? 60
                                                    : 100,
                                          ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }));
    });
  }
}
