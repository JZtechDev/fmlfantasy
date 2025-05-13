import 'package:fmlfantasy/app/app_images/app_images.dart';
import 'package:fmlfantasy/app/app_sizings.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/model/select_player_model.dart';
import 'package:fmlfantasy/ui/helpers/replace_svg_with_png.dart';
import 'package:fmlfantasy/ui/views/loto/loto_controller/loto_controller.dart';
import 'package:fmlfantasy/ui/views/loto/widgets/loto_select_player_view.dart';
import 'package:fmlfantasy/ui/widgets/primary_button.dart';
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    constraints: BoxConstraints(maxHeight: 150.h),
                    decoration: BoxDecoration(
                      color: AppColors.grey,
                      borderRadius: BorderRadius.circular(2.5.r),
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
                                          'assets/images/userplaceholdertwo.png')
                                      : players.jerseyImageUrl == ''
                                          ? Image.asset(
                                              'assets/images/userplaceholdertwo.png')
                                          : players.jerseyImageUrl!
                                                  .endsWith('.svg')
                                              ? SvgPicture.network(
                                                  players.jerseyImageUrl ?? '',
                                                )
                                              : Image.network(
                                                  players.jerseyImageUrl ?? '',
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
                                                      players.fullName!.isEmpty
                                                  ? const SizedBox()
                                                  : Container(
                                                      width: 50.w,
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
                                                        players.fullName!
                                                            .split(' ')
                                                            .last,
                                                        style: globalTextStyle(
                                                            fontSize: 8.sp,
                                                            color:
                                                                AppColors.dark),
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
                                    'assets/images/userplaceholdertwo.png')
                                : players.imageUrl == ''
                                    ? Image.asset(
                                        'assets/images/userplaceholdertwo.png')
                                    : players.imageUrl!.endsWith('.svg')
                                        ? SvgPicture.network(
                                            players.imageUrl ?? '',
                                          )
                                        : Image.network(
                                            players.imageUrl ?? '',
                                          )
                        : players.imageUrl == null || players.imageUrl!.isEmpty
                            ? Image.asset(
                                'assets/images/userplaceholdertwo.png')
                            : players.imageUrl == ''
                                ? Image.asset(
                                    'assets/images/userplaceholdertwo.png')
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
                horizontalSpace(5.w),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(
                      horizontal: AppSizing.isMobile(context) ? 10.w : 7.w),
                  height: AppSizing.isMobile(context) ? 100.h : 100.h,
                  decoration: BoxDecoration(
                    color: AppColors.navyBlue,
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/publictournament.svg',
                        // ignore: deprecated_member_use
                        color: AppColors.white,
                        height: 15.h,
                        width: 15.w,
                      ),
                      verticalSpace(5.h),
                      Text(
                        "${index + 1}".toString().padLeft(2, '0'),
                        style: globalTextStyle(
                            fontSize:
                                AppSizing.isMobile(context) ? 12.sp : 10.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.white),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          players.fullName == null
              ? PrimaryButton(
                  iconPath: AppImages.addIcon,
                  padding: 0,
                  buttonWidth: AppSizing.isMobile(context)
                      ? Get.width * 0.42
                      : Get.width * 0.28,
                  buttonText: 'select'.tr,
                  onPressed: () {
                    Get.to(() => LotoSelectPlayerView(
                          playerIndex: index,
                          selectplayer: teams,
                          drawIndex: drawIndex,
                        ));
                  },
                  isEnabled: true)
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: AppSizing.isMobile(context)
                          ? Get.width * 0.4
                          : Get.width * 0.28,
                      child: Text(
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        players.fullName ?? '-',
                        style: globalTextStyle(
                            fontSize:
                                AppSizing.isMobile(context) ? 12.sp : 8.sp,
                            color: AppColors.dark),
                      ),
                    ),
                    verticalSpace(2.h),
                    SizedBox(
                      width: AppSizing.isMobile(context)
                          ? Get.width * 0.4
                          : Get.width * 0.28,
                      child: Text(
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        players.teamName ?? '-',
                        style: globalTextStyle(
                            fontSize:
                                AppSizing.isMobile(context) ? 12.sp : 8.sp,
                            color: AppColors.textGray),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
