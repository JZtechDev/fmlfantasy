import 'dart:math';
import 'package:fmlfantasy/app/app%20routes/app_routes.dart';
import 'package:fmlfantasy/app/app_colors/app_colors.dart';
import 'package:fmlfantasy/app/app_images/app_images.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/model/select_player_model.dart';
import 'package:fmlfantasy/ui/helpers/commons.dart';
import 'package:fmlfantasy/ui/helpers/get_initials.dart';
import 'package:fmlfantasy/ui/helpers/picture_shimmer.dart';
import 'package:fmlfantasy/ui/helpers/replace_svg_with_png.dart';
import 'package:fmlfantasy/ui/views/select_players/controller/select_player_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class PlayersGrid extends GetView<SelectPlayerController> {
  final String homeTeam;
  final String awayTeam;
  const PlayersGrid(this.homeTeam, this.awayTeam, {super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SelectPlayerController());
    WidgetsBinding.instance.addPostFrameCallback((_) {
      for (var entry in controller.combinedPlayers) {
        Players player = entry[0];
        final teamName = entry[1];
        bool isInArguments = controller.players
                ?.any((argPlayer) => argPlayer.assetCode == player.assetCode) ??
            false;

        if (isInArguments) {
          controller.toggleSelection(player, homeTeam, awayTeam, teamName);
        }
      }
    });

    return LayoutBuilder(builder: (context, constraints) {
      double width = constraints.maxWidth;
      double bullPlayerPositionContainerWidth =
          constraints.maxWidth > 600 ? 35.w : 43.21.w;
      double secondLineHeight = constraints.maxWidth > 600 ? 245 : 135;
      double secondLineWidth = constraints.maxWidth > 600 ? 42 : 42;

      return Obx(() {
        final query = controller.searchQuery.value.toLowerCase();
        final filteredList = controller.combinedPlayers.where((item) {
          final player = item[0];
          final teamName = item[1].toString().toLowerCase();
          return player.fullName!.toLowerCase().contains(query) ||
              teamName.contains(query);
        }).toList();

        return GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: constraints.maxWidth > 600 ? 3 : 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 0.85,
          ),
          itemCount: filteredList.length,
          padding: const EdgeInsets.only(left: 10, right: 10),
          shrinkWrap: true,
          itemBuilder: ((context, index) {
            Players player = filteredList[index][0];
            final teamName = filteredList[index][1];

            return Obx(() {
              bool isSelected = controller.selectedPlayers.any(
                  (selectedPlayer) =>
                      selectedPlayer.assetCode == player.assetCode);

              return GestureDetector(
                onTap: () {
                  controller.toggleSelection(
                      player, homeTeam, awayTeam, teamName);
                },
                child: Container(
                  padding: EdgeInsets.only(left: 10.w, top: 10.h),
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.borderColor, width: 1),
                    color: isSelected ? AppColors.primary : AppColors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.bottomRight,
                        child: SizedBox(
                          width: width > 600 ? 150 : 120,
                          height: width > 600 ? 150 : 120,
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
                                                  width: width > 600
                                                      ? Get.width * 0.3
                                                      : Get.width * 0.32,
                                                )
                                              : player.jerseyImageUrl!
                                                      .endsWith('svg')
                                                  ? SvgPicture.network(
                                                      player.jerseyImageUrl!,
                                                      width: width > 600
                                                          ? 150
                                                          : 120,
                                                    )
                                                  : Image.network(
                                                      player.jerseyImageUrl!,
                                                      width: width > 600
                                                          ? 150
                                                          : 120,
                                                    ),
                                          player.jerseyImageUrl == null
                                              ? const SizedBox()
                                              : Positioned(
                                                  top: 16.h,
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
                                                            .withValues(
                                                                alpha: 0.9),
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
                                                            .withValues(
                                                                alpha: 0.9),
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
                                            width: width > 600
                                                ? Get.width * 0.3
                                                : Get.width * 0.32,
                                          )
                                        : player.imageUrl!.endsWith('svg')
                                            ? SvgPicture.network(
                                                player.imageUrl!,
                                                width: width > 600 ? 150 : 10,
                                                placeholderBuilder: (context) =>
                                                    SizedBox(
                                                  width:
                                                      width > 600 ? 150 : 120,
                                                  height:
                                                      width > 600 ? 150 : 120,
                                                  child: const PictureShimmer(),
                                                ),
                                                fit: BoxFit.fill,
                                              )
                                            : FadeInImage.assetNetwork(
                                                placeholder:
                                                    AppImages.userPlaceHolder,
                                                image: player.imageUrl!,
                                                width: width > 600 ? 150 : 120,
                                                fadeInDuration: const Duration(
                                                    milliseconds: 300),
                                                imageErrorBuilder: (context,
                                                    error, stackTrace) {
                                                  return Image.asset(
                                                    AppImages.userPlaceHolder,
                                                    width: width > 600
                                                        ? 150
                                                        : controller.sportName ==
                                                                'FB'
                                                            ? 60
                                                            : 100,
                                                  );
                                                },
                                              )
                                : player.imageUrl == null
                                    ? Image.asset(
                                        excludeFromSemantics: true,
                                        isAntiAlias: true,
                                        AppImages.userPlaceHolder,
                                        width: width > 600
                                            ? Get.width * 0.3
                                            : Get.width * 0.32,
                                      )
                                    : player.imageUrl!.endsWith('svg')
                                        ? controller.sportName == 'CR'
                                            ? Container(
                                                constraints: BoxConstraints(
                                                  maxWidth:
                                                      width > 600 ? 150 : 150,
                                                ),
                                                child: Image.network(
                                                  replaceSvgWithPng(
                                                      player.imageUrl!),
                                                ),
                                              )
                                            : SvgPicture.network(
                                                player.imageUrl!,
                                                placeholderBuilder: (context) =>
                                                    SizedBox(
                                                  width:
                                                      width > 600 ? 150 : 120,
                                                  height:
                                                      width > 600 ? 150 : 120,
                                                  child: const PictureShimmer(),
                                                ),
                                                fit: BoxFit.fill,
                                                width: width > 600 ? 150 : 120,
                                              )
                                        : FadeInImage.assetNetwork(
                                            placeholder:
                                                AppImages.userPlaceHolder,
                                            image: player.imageUrl!,
                                            width: width > 600
                                                ? 150
                                                : controller.sportName == 'FB'
                                                    ? 60
                                                    : 120,
                                            fadeInDuration: const Duration(
                                                milliseconds: 300),
                                            imageErrorBuilder:
                                                (context, error, stackTrace) {
                                              return Image.asset(
                                                AppImages.userPlaceHolder,
                                                width: width > 600 ? 150 : 120,
                                              );
                                            },
                                          ),
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            teamName.split(' ').join('\n'),
                            style: globalTextStyle(
                              fontSize: width > 600 ? 8.sp : 12.sp,
                              fontWeight: FontWeight.w500,
                              color: isSelected
                                  ? AppColors.white
                                  : AppColors.textGray,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          verticalSpace(20.h),
                          Text(
                            "\$${player.assetIndexPrice!.toStringAsFixed(0)},000",
                            style: globalTextStyle(
                              fontSize: width > 600 ? 16.sp : 15.sp,
                              fontWeight: FontWeight.w600,
                              color:
                                  isSelected ? AppColors.white : AppColors.dark,
                            ),
                          ),
                          Text(
                            'salary'.tr,
                            style: globalTextStyle(
                              fontSize: width > 600 ? 8.sp : 10.sp,
                              fontWeight: FontWeight.w500,
                              color: isSelected
                                  ? AppColors.white
                                  : AppColors.textGray,
                            ),
                          ),
                          verticalSpace(20.h),
                          SizedBox(
                            width: 80,
                            child: Text(
                              maxLines: 2,
                              player.fullName!.split(' ').join('\n'),
                              style: globalTextStyle(
                                fontSize: width > 600 ? 8.sp : 14.sp,
                                fontWeight: FontWeight.w700,
                                color: isSelected
                                    ? AppColors.white
                                    : AppColors.dark,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Transform.rotate(
                          origin: const Offset(30, -30),
                          angle: pi / 4.5,
                          child: Container(
                            height: secondLineHeight,
                            width: secondLineWidth,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              gradient: LinearGradient(
                                colors: [
                                  AppColors.grey.withValues(alpha: 0.35),
                                  AppColors.grey
                                      .withValues(alpha: 0.35)
                                      .withValues(alpha: 0.0),
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                            ),
                          ),
                        ),
                      ),
                      player.position!.isEmpty
                          ? const SizedBox()
                          : Positioned(
                              right: 20,
                              top: 40,
                              child: Container(
                                  alignment: Alignment.center,
                                  width: bullPlayerPositionContainerWidth,
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.r),
                                    color: AppColors.navyBlue,
                                  ),
                                  child: Text(
                                    getInitials(player.position!),
                                    style: globalTextStyle(
                                      fontSize: width > 600 ? 8.sp : 12.sp,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.white,
                                    ),
                                  )),
                            ),
                      Positioned(
                          right: 20,
                          child: GestureDetector(
                            onTap: () {
                              print(player.assetCode);
                              Get.toNamed(
                                AppRoutes.playersStatsView,
                                arguments: {
                                  'assetCode': player.assetCode,
                                },
                              );
                            },
                            child: Icon(
                              CupertinoIcons.info_circle,
                              color:
                                  isSelected ? AppColors.white : AppColors.dark,
                            ),
                          ))
                    ],
                  ),
                ),
              );
            });
          }),
        );
      });
    });
  }
}
