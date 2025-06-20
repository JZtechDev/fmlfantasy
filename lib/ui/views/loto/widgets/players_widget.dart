import 'package:fmlfantasy/app/app_sizings.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/model/select_player_model.dart';
import 'package:fmlfantasy/ui/helpers/replace_svg_with_png.dart';
import 'package:fmlfantasy/ui/views/loto/loto_controller/loto_controller.dart';
import 'package:fmlfantasy/ui/views/loto/widgets/loto_select_player_view.dart';
import 'package:flutter_svg/svg.dart';

class PlayersWidget extends GetView<LotoController> {
  final String sportName;
  final RxInt drawId;
  final dynamic players;
  final int drawIndex;
  final int index;
  final SelectTeam teams;

  const PlayersWidget(
      {super.key,
      required this.sportName,
      required this.drawId,
      required this.players,
      required this.drawIndex,
      required this.index,
      required this.teams});

  @override
  Widget build(BuildContext context) {
    Get.put(LotoController());
    return GestureDetector(
      onTap: () {
        drawId.value == 0
            ? null
            : drawId.value == 0
                ? controller.sportName == 'FB'
                    ? players.fullName == '' && players.jerseyImageUrl == ''
                        ? null
                        : Get.to(() => LotoSelectPlayerView(
                              playerIndex: index,
                              selectplayer: teams,
                              drawIndex: drawIndex,
                            ))
                    : players.fullName == '' && players.imageUrl == ''
                        ? null
                        : Get.to(() => LotoSelectPlayerView(
                              playerIndex: index,
                              selectplayer: teams,
                              drawIndex: drawIndex,
                            ))
                : null;
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: AppSizing.isMobile(context) ? 120.h : 110.h,
            width: AppSizing.isMobile(context)
                ? Get.width * 0.42
                : Get.width * 0.28,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.primaryLight,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5.r),
                  topRight: Radius.circular(5.r),
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    bottom: 10.h,
                    left: 20.w,
                    child: Container(
                      constraints: BoxConstraints(
                        maxHeight: AppSizing.isMobile(context) ? 90.h : 90.h,
                        maxWidth: AppSizing.isMobile(context) ? 90.w : 90.w,
                      ),
                      child: controller.sportName == 'FB'
                          ? players.imageUrl == null
                              ? Stack(
                                  clipBehavior: Clip.hardEdge,
                                  alignment: Alignment.center,
                                  children: [
                                    players.jerseyImageUrl == null ||
                                            players.jerseyImageUrl!.isEmpty
                                        ? Image.asset(
                                            'assets/new_images/placeholder.png')
                                        : players.jerseyImageUrl == ''
                                            ? Image.asset(
                                                'assets/new_images/placeholder.png')
                                            : players.jerseyImageUrl!
                                                    .endsWith('.svg')
                                                ? SvgPicture.network(
                                                    players.jerseyImageUrl ??
                                                        '',
                                                  )
                                                : Image.network(
                                                    players.jerseyImageUrl ??
                                                        '',
                                                  ),
                                    players.jerseyImageUrl == null ||
                                            players.jerseyImageUrl!.isEmpty
                                        ? const SizedBox()
                                        : Align(
                                            heightFactor: 0.85,
                                            alignment: Alignment.bottomCenter,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                players.fullName == null ||
                                                        players
                                                            .fullName!.isEmpty
                                                    ? const SizedBox()
                                                    : Container(
                                                        width: 50.w,
                                                        padding:
                                                            EdgeInsets.only(
                                                          left: 2.w,
                                                          right: 2.w,
                                                          top: 1.h,
                                                          bottom: 1.h,
                                                        ),
                                                        alignment:
                                                            Alignment.center,
                                                        decoration: BoxDecoration(
                                                            color: AppColors
                                                                .white
                                                                .withValues(
                                                                    alpha: 0.9),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        2.r)),
                                                        child: Text(
                                                          textAlign:
                                                              TextAlign.center,
                                                          players.fullName!
                                                              .split(' ')
                                                              .last,
                                                          style: globalTextStyle(
                                                              fontSize: 8.sp,
                                                              color: AppColors
                                                                  .dark),
                                                        ),
                                                      ),
                                                verticalSpace(10.h),
                                                Container(
                                                  padding:
                                                      const EdgeInsets.all(5),
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: AppColors.white
                                                        .withValues(alpha: 0.9),
                                                  ),
                                                  child: Text(
                                                    players.jerseyNumber ?? '',
                                                    style: globalTextStyle2(
                                                        fontSize: 8.sp,
                                                        color: AppColors.dark),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                  ],
                                )
                              : players.imageUrl == null ||
                                      players.imageUrl!.isEmpty
                                  ? Image.asset(
                                      'assets/new_images/placeholder.png')
                                  : players.imageUrl == ''
                                      ? Image.asset(
                                          'assets/new_images/placeholder.png')
                                      : players.imageUrl!.endsWith('.svg')
                                          ? SvgPicture.network(
                                              players.imageUrl ?? '',
                                            )
                                          : Image.network(
                                              players.imageUrl ?? '',
                                            )
                          : players.imageUrl == null ||
                                  players.imageUrl!.isEmpty
                              ? Image.asset('assets/new_images/placeholder.png')
                              : players.imageUrl == ''
                                  ? Image.asset(
                                      'assets/new_images/placeholder.png')
                                  : players.imageUrl!.endsWith('.svg')
                                      ? controller.sportName == 'CR'
                                          ? Image.network(
                                              replaceSvgWithPng(
                                                  players.imageUrl!),
                                            )
                                          : SvgPicture.network(
                                              players.imageUrl ?? '',
                                            )
                                      : Image.network(
                                          players.imageUrl ?? '',
                                        ),
                    ),
                  ),
                  Positioned(
                      right: 5.w,
                      top: 5.h,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: AppColors.lightGreen,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(5.r),
                            )),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/new_images/trophy.png',
                              // ignore: deprecated_member_use
                              color: AppColors.white,
                              height: 15.h,
                              width: 15.w,
                            ),
                            verticalSpace(5.h),
                            Text(
                              "${index + 1}".toString().padLeft(2, '0'),
                              style: globalTextStyle(
                                  fontSize: AppSizing.isMobile(context)
                                      ? 12.sp
                                      : 10.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.white),
                            ),
                          ],
                        ),
                      ))
                ],
              ),
            ),
          ),
          players.fullName == null
              ? GestureDetector(
                  onTap: () {
                    Get.to(() => LotoSelectPlayerView(
                          playerIndex: index,
                          selectplayer: teams,
                          drawIndex: drawIndex,
                        ));
                  },
                  child: Container(
                    width: AppSizing.isMobile(context)
                        ? Get.width * 0.42
                        : Get.width * 0.28,
                    height: AppSizing.isMobile(context) ? 20.h : 15.h,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: AppColors.secondary,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(5.r),
                          bottomRight: Radius.circular(5.r),
                        )),
                    child: Text(
                      'selectPlayer'.tr,
                      style: globalTextStyle(
                          fontSize: AppSizing.isMobile(context) ? 12.sp : 8.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.backgroud),
                    ),
                  ),
                )
              // PrimaryButton(
              //     iconPath: AppImages.addIcon,
              //     padding: 0,
              //     buttonWidth: AppSizing.isMobile(context)
              //         ? Get.width * 0.42
              //         : Get.width * 0.28,
              //     buttonText: 'select'.tr,
              //     onPressed: () {
              //       Get.to(() => LotoSelectPlayerView(
              //             playerIndex: index,
              //             selectplayer: teams,
              //             drawIndex: drawIndex,
              //           ));
              //     },
              //     isEnabled: true)
              : GestureDetector(
                  onTap: () {
                    controller.removePlayer(index, drawIndex);
                  },
                  child: Container(
                    width: AppSizing.isMobile(context)
                        ? Get.width * 0.42
                        : Get.width * 0.28,
                    height: AppSizing.isMobile(context) ? 20.h : 15.h,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: AppColors.errorRed,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(5.r),
                          bottomRight: Radius.circular(5.r),
                        )),
                    child: Text(
                      'remove'.tr,
                      style: globalTextStyle(
                          fontSize: AppSizing.isMobile(context) ? 12.sp : 8.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.white),
                    ),
                  ),
                )
          // Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     mainAxisAlignment: MainAxisAlignment.start,
          //     children: [
          //       SizedBox(
          //         width: AppSizing.isMobile(context)
          //             ? Get.width * 0.4
          //             : Get.width * 0.28,
          //         child: Text(
          //           textAlign: TextAlign.center,
          //           maxLines: 1,
          //           overflow: TextOverflow.ellipsis,
          //           players.fullName ?? '-',
          //           style: globalTextStyle(
          //               fontSize:
          //                   AppSizing.isMobile(context) ? 12.sp : 8.sp,
          //               color: AppColors.dark),
          //         ),
          //       ),
          //       verticalSpace(2.h),
          //       SizedBox(
          //         width: AppSizing.isMobile(context)
          //             ? Get.width * 0.4
          //             : Get.width * 0.28,
          //         child: Text(
          //           maxLines: 1,
          //           overflow: TextOverflow.ellipsis,
          //           players.teamName ?? '-',
          //           style: globalTextStyle(
          //               fontSize:
          //                   AppSizing.isMobile(context) ? 12.sp : 8.sp,
          //               color: AppColors.textGray),
          //           textAlign: TextAlign.center,
          //         ),
          //       ),
          //],
          //),
        ],
      ),
    );
  }
}
