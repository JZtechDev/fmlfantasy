import 'package:fmlfantasy/app/app_colors/app_colors.dart';
import 'package:fmlfantasy/app/app_images/app_images.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/model/select_player_model.dart';
import 'package:fmlfantasy/ui/helpers/commons.dart';
import 'package:fmlfantasy/ui/helpers/get_initials.dart';
import 'package:fmlfantasy/ui/helpers/picture_shimmer.dart';
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
      return GridView.builder(
          physics: const ScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: constraints.maxWidth > 600 ? 3 : 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 1.3,
          ),
          itemCount: controller.selectedPlayers.length,
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
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: player.isBull.value
                          ? AppColors.secondary
                          : AppColors.backgroud,
                      width: 1,
                    ),
                    color: const Color.fromRGBO(51, 163, 147, 1),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5.r),
                      topRight: Radius.circular(5.r),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        right: -20,
                        bottom: 10,
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: SizedBox(
                            width: maxWidth > 600
                                ? 80
                                : 110, // Reduced from 150 to 130 and 120 to 100
                            height: maxWidth > 600
                                ? 130
                                : 85, // Reduced from 150 to 130 and 120 to 100
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
                                                        ? Get.width * 0.28
                                                        : Get.width *
                                                            0.32, // Slightly reduced
                                                  )
                                                : player.jerseyImageUrl!
                                                        .endsWith('svg')
                                                    ? SvgPicture.network(
                                                        player.jerseyImageUrl!,
                                                        width: maxWidth > 600
                                                            ? 130
                                                            : 120, // Reduced
                                                      )
                                                    : Image.network(
                                                        player.jerseyImageUrl!,
                                                        width: maxWidth > 600
                                                            ? 130
                                                            : 120, // Reduced
                                                      ),
                                            player.jerseyImageUrl == null
                                                ? const SizedBox()
                                                : Positioned(
                                                    top: 14
                                                        .h, // Adjusted slightly for smaller size
                                                    child: Container(
                                                      padding: EdgeInsets.only(
                                                        left: 2.w,
                                                        right: 2.w,
                                                        top: 1.h,
                                                        bottom: 1.h,
                                                      ),
                                                      alignment:
                                                          Alignment.center,
                                                      decoration: BoxDecoration(
                                                          color: AppColors.white
                                                              .withValues(
                                                                  alpha: 0.9),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      2.r)),
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
                                                      height: 22
                                                          .h, // Reduced slightly
                                                      width: 22
                                                          .w, // Reduced slightly
                                                      padding:
                                                          const EdgeInsets.only(
                                                        top: 5,
                                                        right: 5,
                                                        left: 5,
                                                        bottom: 5,
                                                      ),
                                                      alignment:
                                                          Alignment.center,
                                                      decoration: BoxDecoration(
                                                          color: AppColors.white
                                                              .withValues(
                                                                  alpha: 0.9),
                                                          shape:
                                                              BoxShape.circle),
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
                                                  ? Get.width * 0.28
                                                  : Get.width * 0.32, // Reduced
                                            )
                                          : player.imageUrl!.endsWith('svg')
                                              ? SvgPicture.network(
                                                  player.imageUrl!,
                                                  width: maxWidth > 600
                                                      ? 130
                                                      : 120, // Reduced
                                                  placeholderBuilder:
                                                      (context) => SizedBox(
                                                    width: maxWidth > 600
                                                        ? 130
                                                        : 120, // Reduced
                                                    height: maxWidth > 600
                                                        ? 130
                                                        : 120, // Reduced
                                                    child:
                                                        const PictureShimmer(),
                                                  ),
                                                  fit: BoxFit.fill,
                                                )
                                              : FadeInImage.assetNetwork(
                                                  placeholder:
                                                      AppImages.userPlaceHolder,
                                                  image: player.imageUrl!,
                                                  width: maxWidth > 600
                                                      ? 130
                                                      : 120, // Reduced
                                                  fadeInDuration:
                                                      const Duration(
                                                          milliseconds: 300),
                                                  imageErrorBuilder: (context,
                                                      error, stackTrace) {
                                                    return Image.asset(
                                                      AppImages.userPlaceHolder,
                                                      width: maxWidth > 600
                                                          ? 130
                                                          : controller.sportName ==
                                                                  'FB'
                                                              ? 50
                                                              : 120, // Reduced
                                                    );
                                                  },
                                                )
                                  : player.imageUrl == null
                                      ? Image.asset(
                                          excludeFromSemantics: true,
                                          isAntiAlias: true,
                                          AppImages.userPlaceHolder,
                                          width: maxWidth > 600
                                              ? Get.width * 0.28
                                              : Get.width * 0.32, // Reduced
                                        )
                                      : player.imageUrl!.endsWith('svg')
                                          ? controller.sportName == 'CR'
                                              ? Container(
                                                  constraints: BoxConstraints(
                                                    maxWidth: maxWidth > 600
                                                        ? 130
                                                        : 150, // Reduced
                                                  ),
                                                  child: Image.network(
                                                    replaceSvgWithPng(
                                                        player.imageUrl!),
                                                  ),
                                                )
                                              : SvgPicture.network(
                                                  player.imageUrl!,
                                                  placeholderBuilder:
                                                      (context) => SizedBox(
                                                    width: maxWidth > 600
                                                        ? 130
                                                        : 120, // Reduced
                                                    height: maxWidth > 600
                                                        ? 130
                                                        : 120, // Reduced
                                                    child:
                                                        const PictureShimmer(),
                                                  ),
                                                  fit: BoxFit.fill,
                                                  width: maxWidth > 600
                                                      ? 130
                                                      : 120, // Reduced
                                                )
                                          : FadeInImage.assetNetwork(
                                              placeholder:
                                                  AppImages.userPlaceHolder,
                                              image: player.imageUrl!,
                                              width: maxWidth > 600
                                                  ? 130
                                                  : controller.sportName == 'FB'
                                                      ? 50
                                                      : 120, // Reduced
                                              fadeInDuration: const Duration(
                                                  milliseconds: 300),
                                              imageErrorBuilder:
                                                  (context, error, stackTrace) {
                                                return Image.asset(
                                                  AppImages.userPlaceHolder,
                                                  width: maxWidth > 600
                                                      ? 130
                                                      : 120, // Reduced
                                                );
                                              },
                                            ),
                            ),
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 10, left: 10, top: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: Get.width * 0.25,
                                  child: Text(
                                    player.teamName ?? '-',
                                    style: globalTextStyle(
                                        fontSize: maxWidth > 600 ? 8.sp : 12.sp,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.white),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Container(
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
                                        fontSize: maxWidth > 600 ? 8.sp : 10.sp,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.white),
                                  ),
                                )
                              ],
                            ),
                          ),
                          verticalSpace(15),
                          Padding(
                            padding: EdgeInsets.only(left: 10.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "\$${player.assetIndexPrice!.toStringAsFixed(0)},000",
                                  style: globalTextStyle(
                                    fontSize: maxWidth > 600 ? 16.sp : 18.sp,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.secondary,
                                  ),
                                ),
                                Text(
                                  'SALARY'.tr,
                                  style: globalTextStyle(
                                      fontSize: maxWidth > 600 ? 8.sp : 11.sp,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.white),
                                ),
                              ],
                            ),
                          ),
                          Expanded(child: Container()),
                          Container(
                            padding: const EdgeInsets.only(right: 10, left: 10),
                            alignment: Alignment.centerLeft,
                            decoration: const BoxDecoration(
                                color: Color.fromRGBO(18, 96, 85, 1)),
                            child: Text(
                              maxLines: 1,
                              player.fullName ?? '-',
                              // player.fullName!.split(' ').join('\n'),
                              style: globalTextStyle(
                                  fontSize: maxWidth > 600 ? 8.sp : 12.sp,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.secondary),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
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
