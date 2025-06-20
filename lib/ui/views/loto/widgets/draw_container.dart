import 'package:fmlfantasy/app/app_colors/app_colors.dart';
import 'package:fmlfantasy/app/app_sizings.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/model/select_player_model.dart';
import 'package:fmlfantasy/ui/helpers/commons.dart';
import 'package:fmlfantasy/ui/helpers/replace_svg_with_png.dart';
import 'package:fmlfantasy/ui/views/loto/loto_controller/loto_controller.dart';
import 'package:fmlfantasy/ui/views/loto/widgets/players_widget.dart';
import 'package:fmlfantasy/ui/views/loto/widgets/winner_modal.dart';
import 'package:fmlfantasy/ui/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class DrawContainer extends GetView<LotoController> {
  final int drawIndex;
  final dynamic draw;
  final dynamic winner;
  final RxInt drawId;
  final SelectTeam teams;
  const DrawContainer({
    super.key,
    required this.drawIndex,
    required this.draw,
    required this.winner,
    required this.drawId,
    required this.teams,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(LotoController());
    return Obx(
      () => Container(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
        decoration: BoxDecoration(
          color: AppColors.backgroud,
          border: const Border(
            bottom: BorderSide(
              color: AppColors.borderColor,
              width: 1,
            ),
          ),
          borderRadius: BorderRadius.circular(5.r),
        ),
        child: Column(
          children: [
            Container(
              width: Get.width,
              padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(101, 184, 172, 1),
                  borderRadius: BorderRadius.circular(5.r)),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: Get.width * 0.25),
                width: Get.width * 0.3,
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(5.r),
                ),
                child: SizedBox(
                  width: Get.width * 0.3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'draws'.tr,
                        style: globalTextStyle2(
                            fontSize:
                                AppSizing.isMobile(context) ? 14.sp : 10.sp,
                            color: AppColors.white,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        // ignore: unrelated_type_equality_checks
                        drawId == 0 ? '' : "#${drawId.value.toString()}",
                        style: globalTextStyle2(
                            fontSize: 12.sp,
                            color: AppColors.white,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            verticalSpace(10.h),
            Wrap(
              spacing: 10.w,
              runSpacing: 10.h,
              children: [
                ...draw.asMap().entries.map((entry) {
                  int index = entry.key;
                  var players = entry.value;
                  return PlayersWidget(
                      sportName: controller.sportName,
                      drawId: drawId,
                      players: players,
                      drawIndex: drawIndex,
                      index: index,
                      teams: teams);
                }),
                Column(
                  children: [
                    Container(
                        padding: EdgeInsets.only(
                            left: 10.h, right: 10.h, top: 10.h, bottom: 10.h),
                        width: AppSizing.isMobile(context)
                            ? Get.width * 0.42
                            : Get.width * 0.28,
                        decoration: BoxDecoration(
                            color: AppColors.primaryLight,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5.r),
                              topRight: Radius.circular(5.r),
                            )),
                        child: winner.id == 3
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  teams.homeTeam!.imageUrl == null
                                      ? Container()
                                      : SizedBox(
                                          width: 45.w,
                                          child: teams.homeTeam!.imageUrl!
                                                  .endsWith('svg')
                                              ? controller.sportName == 'CR'
                                                  ? Image.network(
                                                      replaceSvgWithPng(teams
                                                          .homeTeam!.imageUrl!))
                                                  : SvgPicture.network(
                                                      teams.homeTeam!.imageUrl!,
                                                      height: 50.h,
                                                      width: 50.w,
                                                    )
                                              : Image.network(
                                                  teams.homeTeam!.imageUrl!,
                                                  height: 50.h,
                                                  width: 50.w,
                                                ),
                                        ),
                                  horizontalSpace(10.w),
                                  teams.awayTeam!.imageUrl == null
                                      ? Container()
                                      : SizedBox(
                                          width: 45.h,
                                          child: teams.awayTeam!.imageUrl!
                                                  .endsWith('svg')
                                              ? controller.sportName == 'CR'
                                                  ? Image.network(
                                                      replaceSvgWithPng(teams
                                                          .awayTeam!.imageUrl!),
                                                      height: 50.h,
                                                      width: 50.w,
                                                    )
                                                  : SvgPicture.network(
                                                      teams.awayTeam!.imageUrl!,
                                                      height: 50.h,
                                                      width: 50.w,
                                                    )
                                              : Image.network(
                                                  teams.awayTeam!.imageUrl!,
                                                  height: 50.h,
                                                  width: 50.w,
                                                ),
                                        )
                                ],
                              )
                            : winner.imageUrl == ''
                                ? Image.asset(
                                    'assets/new_images/placeholder.png',
                                    height: 90.h,
                                  )
                                : winner.imageUrl.endsWith('svg')
                                    ? controller.sportName == 'CR'
                                        ? Image.network(
                                            replaceSvgWithPng(winner.imageUrl),
                                            height: 60.h)
                                        : SvgPicture.network(winner.imageUrl,
                                            height: 60.h)
                                    : Image.network(
                                        winner.imageUrl,
                                        height: 60.h,
                                      )),
                    // verticalSpace(2.h),
                    // Container(
                    //   width: AppSizing.isMobile(context)
                    //       ? Get.width * 0.42
                    //       : Get.width * 0.28,
                    //   alignment: Alignment.center,
                    //   padding:
                    //       EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                    //   decoration: BoxDecoration(
                    //     color: AppColors.navyBlue,
                    //     borderRadius: BorderRadius.circular(5.r),
                    //   ),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     children: [
                    //       SvgPicture.asset(
                    //         AppImages.reward,
                    //         // ignore: deprecated_member_use
                    //         color: AppColors.white,
                    //         height: 15.h,
                    //         width: 15.w,
                    //       ),
                    //       horizontalSpace(5.w),
                    //       Text(
                    //         winner.id == 3 ? 'draws'.tr : 'winner'.tr,
                    //         style: globalTextStyle(
                    //             fontSize:
                    //                 AppSizing.isMobile(context) ? 12.sp : 10.sp,
                    //             fontWeight: FontWeight.w600,
                    //             color: AppColors.white),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    drawId.value == 0
                        ? GestureDetector(
                            onTap: () {
                              if (controller.drawsList[drawIndex].players
                                      .where(
                                          (element) => element.assetCode != '')
                                      .length ==
                                  5) {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return WinnerModal(
                                        teams: teams,
                                        drawIndex: drawIndex,
                                      );
                                    });
                              } else {
                                Get.snackbar(
                                  'error'.tr,
                                  'First Select the Players'.tr,
                                  snackPosition: SnackPosition.BOTTOM,
                                  backgroundColor: AppColors.errorRed,
                                  colorText: AppColors.white,
                                );
                              }
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
                                'Select Winner'.tr,
                                style: globalTextStyle(
                                    fontSize: AppSizing.isMobile(context)
                                        ? 12.sp
                                        : 8.sp,
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
                        //       showDialog(
                        //           context: context,
                        //           builder: (BuildContext context) {
                        //             return WinnerModal(
                        //               teams: teams,
                        //               drawIndex: drawIndex,
                        //             );
                        //           });
                        //     },
                        //     isEnabled: controller.drawsList[drawIndex].players
                        //                 .where((element) =>
                        //                     element.assetCode != '')
                        //                 .length ==
                        //             5
                        //         ? true
                        //         : false,
                        //   )
                        : Container(
                            width: Get.width * 0.42,
                          )
                  ],
                ),
                verticalSpace(10.h),
                PrimaryButton(
                  borderColor: AppColors.errorRed,
                  padding: 0,
                  buttonText: 'remove'.tr,
                  onPressed: () {
                    drawId.value == 0
                        ? controller.removeDraw(drawIndex)
                        : controller.deleteDraw(
                            drawId.value.toString(), drawIndex);
                  },
                  isEnabled: true,
                  backgroundColor: AppColors.errorRed,
                  textColor: AppColors.white,
                )
              ],
            ),
            verticalSpace(10.h),
          ],
        ),
      ),
    );
  }
}
