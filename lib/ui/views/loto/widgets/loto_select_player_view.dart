import 'package:flutter/cupertino.dart';
import 'package:fmlfantasy/app/app_images/app_images.dart';
import 'package:fmlfantasy/app/app_sizings.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/model/select_player_model.dart';
import 'package:fmlfantasy/ui/components/home_appbar.dart';
import 'package:fmlfantasy/ui/helpers/get_initials.dart';
import 'package:fmlfantasy/ui/helpers/replace_svg_with_png.dart';
import 'package:fmlfantasy/ui/views/loto/loto_controller/loto_controller.dart';
import 'package:flutter_svg/svg.dart';

class LotoSelectPlayerView extends GetView<LotoController> {
  final SelectTeam selectplayer;
  final int playerIndex;
  final int drawIndex;

  const LotoSelectPlayerView(
      {super.key,
      required this.selectplayer,
      required this.playerIndex,
      required this.drawIndex});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(title: 'Home'),
      body: LayoutBuilder(builder: (context, constraints) {
        final width = constraints.maxWidth;
        return CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 60.h,
              collapsedHeight: 60.h,
              automaticallyImplyLeading: false,
              pinned: true,
              backgroundColor: Colors.transparent,
              elevation: 0,
              flexibleSpace: Padding(
                padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 5.h),
                child: Container(
                  margin: EdgeInsets.only(bottom: 5.h),
                  padding: EdgeInsets.only(
                      bottom: 5.h, top: 5.h, left: 5.w, right: 5.w),
                  decoration: BoxDecoration(
                    color: AppColors.backgroud,
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Obx(
                          () => GestureDetector(
                            onTap: () {
                              controller.isloadingSelectPlayer.value = true;
                            },
                            child: Container(
                              padding: EdgeInsets.only(
                                  left: 10.w,
                                  right: 10.w,
                                  top: 5.h,
                                  bottom: 5.h),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.r),
                                color: controller.isloadingSelectPlayer.value
                                    ? AppColors.grey
                                    : Colors.transparent,
                              ),
                              child: Row(
                                children: [
                                  selectplayer.homeTeam!.imageUrl == null
                                      ? Container()
                                      : controller.sportName == 'CR'
                                          ? Image.network(replaceSvgWithPng(
                                              selectplayer.homeTeam!.imageUrl!))
                                          : SvgPicture.network(
                                              selectplayer.homeTeam!.imageUrl ??
                                                  '',
                                              height: 22.h,
                                              width: 22.w,
                                            ),
                                  horizontalSpace(5.w),
                                  SizedBox(
                                    width: width * 0.26,
                                    child: Text(
                                      selectplayer.homeTeam!.name ??
                                          'Home Team',
                                      style: globalTextStyle(
                                          fontSize: AppSizing.isMobile(context)
                                              ? 12.sp
                                              : 10.sp,
                                          fontWeight: FontWeight.w500),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Obx(
                          () => GestureDetector(
                            onTap: () {
                              controller.isloadingSelectPlayer.value = false;
                            },
                            child: Container(
                              padding: EdgeInsets.only(
                                  left: 10.w,
                                  right: 10.w,
                                  top: 5.h,
                                  bottom: 5.h),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.r),
                                color: !controller.isloadingSelectPlayer.value
                                    ? AppColors.grey
                                    : Colors.transparent,
                              ),
                              child: Row(
                                children: [
                                  selectplayer.awayTeam!.imageUrl == null
                                      ? Container()
                                      : controller.sportName == 'CR'
                                          ? Image.network(
                                              replaceSvgWithPng(
                                                selectplayer
                                                    .awayTeam!.imageUrl!,
                                              ),
                                            )
                                          : SvgPicture.network(
                                              selectplayer.awayTeam!.imageUrl ??
                                                  '',
                                              height:
                                                  AppSizing.isMobile(context)
                                                      ? 22.h
                                                      : 40.h,
                                              width: 22.w,
                                            ),
                                  horizontalSpace(5.w),
                                  SizedBox(
                                    width: width * 0.26,
                                    child: Text(
                                      selectplayer.awayTeam!.name ??
                                          'Away Team',
                                      style: globalTextStyle(
                                          fontSize: AppSizing.isMobile(context)
                                              ? 12.sp
                                              : 10.sp,
                                          fontWeight: FontWeight.w500),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
                child: Padding(
                    padding: EdgeInsets.only(
                        left: 10.w, right: 10.w, top: 20.h, bottom: 20.h),
                    child: Obx(
                      () => GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: constraints.maxWidth > 600 ? 3 : 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          childAspectRatio: 1.1,
                        ),
                        itemCount: controller.isloadingSelectPlayer.value
                            ? selectplayer.homeTeam!.players!.length
                            : selectplayer.awayTeam!.players!.length,
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          Players player =
                              controller.isloadingSelectPlayer.value
                                  ? selectplayer.homeTeam!.players![index]
                                  : selectplayer.awayTeam!.players![index];
                          bool isSelected = controller
                              .drawsList[drawIndex].players
                              .contains(player);
                          String teamName =
                              controller.isloadingSelectPlayer.value
                                  ? selectplayer.homeTeam!.name!
                                  : selectplayer.awayTeam!.name!;
                          String teamKey =
                              controller.isloadingSelectPlayer.value
                                  ? selectplayer.homeTeam!.assetCode!
                                  : selectplayer.awayTeam!.assetCode!;

                          return GestureDetector(
                            onTap: () {
                              controller.toggleSelection(player, playerIndex,
                                  drawIndex, teamName, teamKey);
                            },
                            child: Container(
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: AppColors.borderColor, width: 1),
                                color: isSelected
                                    ? AppColors.dark
                                    : AppColors.primaryLight,
                                borderRadius: BorderRadius.circular(5.r),
                              ),
                              child: Stack(
                                children: [
                                  Positioned(
                                      bottom: 10,
                                      right: 10,
                                      child: controller.sportName == 'FB'
                                          ? player.imageUrl == null
                                              ? Stack(
                                                  clipBehavior: Clip.hardEdge,
                                                  alignment: Alignment.center,
                                                  children: [
                                                    player.jerseyImageUrl ==
                                                            null
                                                        ? Image.asset(
                                                            excludeFromSemantics:
                                                                true,
                                                            isAntiAlias: true,
                                                            AppImages
                                                                .userPlaceHolder,
                                                            width: width > 600
                                                                ? Get.width *
                                                                    0.3
                                                                : Get.width *
                                                                    0.25,
                                                          )
                                                        : player.jerseyImageUrl!
                                                                .endsWith('svg')
                                                            ? SvgPicture
                                                                .network(
                                                                player
                                                                    .jerseyImageUrl!,
                                                                width:
                                                                    width > 600
                                                                        ? 150
                                                                        : 100,
                                                              )
                                                            : Image.network(
                                                                player
                                                                    .jerseyImageUrl!,
                                                                width:
                                                                    width > 600
                                                                        ? 150
                                                                        : 100,
                                                              ),
                                                    player.jerseyImageUrl ==
                                                            null
                                                        ? const SizedBox()
                                                        : Positioned(
                                                            top: 15.h,
                                                            child: Container(
                                                              padding:
                                                                  EdgeInsets
                                                                      .only(
                                                                left: 2.w,
                                                                right: 2.w,
                                                                top: 1.h,
                                                                bottom: 1.h,
                                                              ),
                                                              alignment:
                                                                  Alignment
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
                                                                    color: AppColors
                                                                        .dark),
                                                              ),
                                                            ),
                                                          ),
                                                    player.jerseyImageUrl ==
                                                            null
                                                        ? const SizedBox()
                                                        : Align(
                                                            alignment: Alignment
                                                                .center,
                                                            child: Container(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                top: 5,
                                                                right: 5,
                                                                left: 5,
                                                                bottom: 5,
                                                              ),
                                                              alignment:
                                                                  Alignment
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
                                                                        8.sp,
                                                                    color: AppColors
                                                                        .dark),
                                                              ),
                                                            ),
                                                          ),
                                                  ],
                                                )
                                              : player.jerseyImageUrl == null
                                                  ? Image.asset(
                                                      excludeFromSemantics:
                                                          true,
                                                      isAntiAlias: true,
                                                      AppImages.userPlaceHolder,
                                                      width: width > 600
                                                          ? Get.width * 0.3
                                                          : Get.width * 0.25,
                                                    )
                                                  : player.imageUrl!
                                                          .endsWith('svg')
                                                      ? SvgPicture.network(
                                                          player.imageUrl!,
                                                          width: width > 600
                                                              ? 150
                                                              : 100,
                                                        )
                                                      : Image.network(
                                                          player.imageUrl!,
                                                          width: width > 600
                                                              ? 150
                                                              : controller.sportName ==
                                                                      'FB'
                                                                  ? 60
                                                                  : 100,
                                                        )
                                          : player.imageUrl == null
                                              ? Image.asset(
                                                  excludeFromSemantics: true,
                                                  isAntiAlias: true,
                                                  AppImages.userPlaceHolder,
                                                  width: width > 600
                                                      ? Get.width * 0.3
                                                      : Get.width * 0.25,
                                                )
                                              : player.imageUrl!.endsWith('svg')
                                                  ? controller.sportName == 'CR'
                                                      ? Image.network(
                                                          replaceSvgWithPng(
                                                              player.imageUrl!),
                                                          width: 100,
                                                        )
                                                      : SvgPicture.network(
                                                          player.imageUrl!,
                                                          width: width > 600
                                                              ? 150
                                                              : 100,
                                                        )
                                                  : Image.network(
                                                      player.imageUrl!,
                                                      width: width > 600
                                                          ? 150
                                                          : controller.sportName ==
                                                                  'FB'
                                                              ? 60
                                                              : 100,
                                                    )),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: 10.w,
                                      top: 5.h,
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: 70.w,
                                              child: Text(
                                                teamName,
                                                style: globalTextStyle(
                                                    fontSize: width > 600
                                                        ? 8.sp
                                                        : 12.sp,
                                                    fontWeight: FontWeight.w500,
                                                    color: AppColors.secondary),
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  margin: const EdgeInsets.only(
                                                      right: 5),
                                                  padding:
                                                      const EdgeInsets.all(5),
                                                  decoration: BoxDecoration(
                                                      color:
                                                          AppColors.backgroud,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topRight: Radius
                                                                  .circular(
                                                                      5.r))),
                                                  child: const Icon(
                                                    CupertinoIcons
                                                        .exclamationmark,
                                                    color: AppColors.white,
                                                    size: 18,
                                                  ),
                                                ),
                                                verticalSpace(5.h),
                                                Container(
                                                  margin: const EdgeInsets.only(
                                                      right: 5),
                                                  padding:
                                                      const EdgeInsets.all(5),
                                                  decoration: BoxDecoration(
                                                      color:
                                                          AppColors.backgroud,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topRight: Radius
                                                                  .circular(
                                                                      5.r))),
                                                  child: Text(
                                                    getInitials(
                                                        player.position!),
                                                    style: globalTextStyle(
                                                        fontSize: width > 600
                                                            ? 8.sp
                                                            : 12.sp,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: AppColors
                                                            .secondary),
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                              ],
                                            )
                                            // Padding(
                                            //   padding:
                                            //       EdgeInsets.only(right: 5.h),
                                            //   child: SvgPicture.asset(
                                            //     AppImages.howItWork,
                                            //     // ignore: deprecated_member_use
                                            //     color: AppColors.textGray,
                                            //   ),
                                            // ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0.h,
                                    left: 0,
                                    right: 0,
                                    child: Container(
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.only(
                                          top: 1.h, bottom: 1.h),
                                      decoration: BoxDecoration(
                                        color: Color.fromRGBO(18, 96, 85, 1),
                                      ),
                                      child: Text(
                                        player.fullName ?? '',
                                        style: globalTextStyle(
                                            fontSize:
                                                width > 600 ? 8.sp : 12.sp,
                                            fontWeight: FontWeight.w700,
                                            color: AppColors.secondary),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ))),
          ],
        );
      }),
    );
  }
}
