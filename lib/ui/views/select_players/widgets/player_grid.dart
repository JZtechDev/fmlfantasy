import 'package:fmlfantasy/app/app_images/app_images.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/model/select_player_model.dart';
import 'package:fmlfantasy/ui/helpers/get_initials.dart';
import 'package:fmlfantasy/ui/helpers/picture_shimmer.dart';
import 'package:fmlfantasy/ui/helpers/replace_svg_with_png.dart';
import 'package:fmlfantasy/ui/views/select_players/controller/select_player_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
            childAspectRatio: 1.1,
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
                  //padding: EdgeInsets.only(left: 10.w, top: 5.h),
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: isSelected
                          ? AppColors.secondary
                          : AppColors.backgroud,
                      width: 1,
                    ),
                    gradient: LinearGradient(
                      colors: [
                        isSelected
                            ? const Color.fromRGBO(51, 163, 147, 1)
                            : const Color.fromRGBO(31, 54, 22, 1),
                        // 30% of this color
                        isSelected
                            ? const Color.fromRGBO(51, 163, 147, 1)
                            : const Color.fromRGBO(31, 54, 22, 1),
                      ],
                      stops: const [0.6, 0.6],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5.r),
                      topRight: Radius.circular(5.r),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 30,
                        left: 0,
                        right: 0,
                        child: Stack(
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              padding: const EdgeInsets.only(left: 10, top: 10),
                              width: Get.width,
                              height: 80,
                              color: const Color.fromRGBO(18, 96, 85, 1),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "\$${player.assetIndexPrice!.toStringAsFixed(0)},000",
                                    style: globalTextStyle(
                                      fontSize: width > 600 ? 16.sp : 18.sp,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.secondary,
                                    ),
                                  ),
                                  Text(
                                    'SALARY'.tr,
                                    style: globalTextStyle(
                                        fontSize: width > 600 ? 8.sp : 11.sp,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.white),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              right: -20,
                              bottom: 0,
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: SizedBox(
                                  width: width > 600
                                      ? 80
                                      : 110, // Reduced from 150 to 130 and 120 to 100
                                  height: width > 600
                                      ? 130
                                      : 80, // Reduced from 150 to 130 and 120 to 100
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
                                                          excludeFromSemantics:
                                                              true,
                                                          isAntiAlias: true,
                                                          AppImages
                                                              .userPlaceHolder,
                                                          width: width > 600
                                                              ? Get.width * 0.28
                                                              : Get.width *
                                                                  0.32, // Slightly reduced
                                                        )
                                                      : player.jerseyImageUrl!
                                                              .endsWith('svg')
                                                          ? SvgPicture.network(
                                                              player
                                                                  .jerseyImageUrl!,
                                                              width: width > 600
                                                                  ? 130
                                                                  : 120, // Reduced
                                                            )
                                                          : Image.network(
                                                              player
                                                                  .jerseyImageUrl!,
                                                              width: width > 600
                                                                  ? 130
                                                                  : 120, // Reduced
                                                            ),
                                                  player.jerseyImageUrl == null
                                                      ? const SizedBox()
                                                      : Positioned(
                                                          top: 14
                                                              .h, // Adjusted slightly for smaller size
                                                          child: Container(
                                                            padding:
                                                                EdgeInsets.only(
                                                              left: 2.w,
                                                              right: 2.w,
                                                              top: 1.h,
                                                              bottom: 1.h,
                                                            ),
                                                            alignment: Alignment
                                                                .center,
                                                            decoration: BoxDecoration(
                                                                color: AppColors
                                                                    .white
                                                                    .withValues(
                                                                        alpha:
                                                                            0.9),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            2.r)),
                                                            child: Text(
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              player.fullName!
                                                                  .split(' ')
                                                                  .last,
                                                              style: globalTextStyle(
                                                                  fontSize:
                                                                      8.sp,
                                                                  color:
                                                                      AppColors
                                                                          .dark),
                                                            ),
                                                          ),
                                                        ),
                                                  player.jerseyImageUrl == null
                                                      ? const SizedBox()
                                                      : Align(
                                                          alignment:
                                                              Alignment.center,
                                                          child: Container(
                                                            height: 22
                                                                .h, // Reduced slightly
                                                            width: 22
                                                                .w, // Reduced slightly
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                              top: 5,
                                                              right: 5,
                                                              left: 5,
                                                              bottom: 5,
                                                            ),
                                                            alignment: Alignment
                                                                .center,
                                                            decoration: BoxDecoration(
                                                                color: AppColors
                                                                    .white
                                                                    .withValues(
                                                                        alpha:
                                                                            0.9),
                                                                shape: BoxShape
                                                                    .circle),
                                                            child: Text(
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              player.jerseyNumber ??
                                                                  'N/A',
                                                              style: globalTextStyle(
                                                                  fontSize:
                                                                      10.sp,
                                                                  color:
                                                                      AppColors
                                                                          .dark),
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
                                                        ? Get.width * 0.28
                                                        : Get.width *
                                                            0.32, // Reduced
                                                  )
                                                : player.imageUrl!
                                                        .endsWith('svg')
                                                    ? SvgPicture.network(
                                                        player.imageUrl!,
                                                        width: width > 600
                                                            ? 130
                                                            : 120, // Reduced
                                                        placeholderBuilder:
                                                            (context) =>
                                                                SizedBox(
                                                          width: width > 600
                                                              ? 130
                                                              : 120, // Reduced
                                                          height: width > 600
                                                              ? 130
                                                              : 120, // Reduced
                                                          child:
                                                              const PictureShimmer(),
                                                        ),
                                                        fit: BoxFit.fill,
                                                      )
                                                    : FadeInImage.assetNetwork(
                                                        placeholder: AppImages
                                                            .userPlaceHolder,
                                                        image: player.imageUrl!,
                                                        width: width > 600
                                                            ? 130
                                                            : 120, // Reduced
                                                        fadeInDuration:
                                                            const Duration(
                                                                milliseconds:
                                                                    300),
                                                        imageErrorBuilder:
                                                            (context, error,
                                                                stackTrace) {
                                                          return Image.asset(
                                                            AppImages
                                                                .userPlaceHolder,
                                                            width: width > 600
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
                                                width: width > 600
                                                    ? Get.width * 0.28
                                                    : Get.width *
                                                        0.32, // Reduced
                                              )
                                            : player.imageUrl!.endsWith('svg')
                                                ? controller.sportName == 'CR'
                                                    ? Container(
                                                        constraints:
                                                            BoxConstraints(
                                                          maxWidth: width > 600
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
                                                            (context) =>
                                                                SizedBox(
                                                          width: width > 600
                                                              ? 130
                                                              : 120, // Reduced
                                                          height: width > 600
                                                              ? 130
                                                              : 120, // Reduced
                                                          child:
                                                              const PictureShimmer(),
                                                        ),
                                                        fit: BoxFit.fill,
                                                        width: width > 600
                                                            ? 130
                                                            : 120, // Reduced
                                                      )
                                                : FadeInImage.assetNetwork(
                                                    placeholder: AppImages
                                                        .userPlaceHolder,
                                                    image: player.imageUrl!,
                                                    width: width > 600
                                                        ? 130
                                                        : controller.sportName ==
                                                                'FB'
                                                            ? 50
                                                            : 120, // Reduced
                                                    fadeInDuration:
                                                        const Duration(
                                                            milliseconds: 300),
                                                    imageErrorBuilder: (context,
                                                        error, stackTrace) {
                                                      return Image.asset(
                                                        AppImages
                                                            .userPlaceHolder,
                                                        width: width > 600
                                                            ? 130
                                                            : 120, // Reduced
                                                      );
                                                    },
                                                  ),
                                  ),
                                ),
                              ),
                            ),
                          ],
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
                                    teamName,
                                    style: globalTextStyle(
                                        fontSize: width > 600 ? 8.sp : 12.sp,
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
                                        fontSize: width > 600 ? 8.sp : 10.sp,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.white),
                                  ),
                                )
                              ],
                            ),
                          ),
                          verticalSpace(15),
                          Expanded(child: Container()),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10, bottom: 5, right: 10),
                            child: SizedBox(
                              width: Get.width * 0.5,
                              child: Text(
                                maxLines: 1,
                                player.fullName ?? '-',
                                // player.fullName!.split(' ').join('\n'),
                                style: globalTextStyle(
                                    fontSize: width > 600 ? 8.sp : 12.sp,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.secondary),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ],
                      ),
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
