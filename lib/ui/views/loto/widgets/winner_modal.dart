import 'package:fmlfantasy/app/app_images/app_images.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/model/select_player_model.dart';
import 'package:fmlfantasy/ui/helpers/replace_svg_with_png.dart';
import 'package:fmlfantasy/ui/views/loto/loto_controller/loto_controller.dart';
import 'package:flutter_svg/svg.dart';

class WinnerModal extends GetView<LotoController> {
  final SelectTeam teams;
  final int drawIndex;
  const WinnerModal({super.key, required this.teams, required this.drawIndex});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetAnimationCurve: Curves.easeInOutCubicEmphasized,
      insetAnimationDuration: const Duration(seconds: 3),
      backgroundColor: AppColors.white,
      surfaceTintColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0.r),
      ),
      child: Padding(
          padding: EdgeInsets.only(
            left: 10.w,
            right: 10.w,
            bottom: 10.h,
            top: 10.h,
          ),
          child: SizedBox(
            height: Get.height * 0.55,
            child: Stack(
              children: [
                Positioned(
                  top: 0.h,
                  right: 0.w,
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: AppColors.grey,
                      ),
                      child: Image.asset(
                        AppImages.crossIcon,
                        color: AppColors.dark,
                        height: 20.h,
                        width: 20.h,
                      ),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/publictournament.svg',
                      height: 60.h,
                      width: 60.h,
                    ),
                    verticalSpace(10.h),
                    Text(
                      'Select Match Outcome',
                      style: globalTextStyle(
                        fontSize: 14.sp,
                      ),
                    ),
                    verticalSpace(20.h),
                    Text(
                      'Select Winner',
                      style: globalTextStyle2(
                          fontSize: 8.sp, color: AppColors.textGray),
                    ),
                    verticalSpace(10.h),
                    Row(
                      children: [
                        Expanded(
                            child: GestureDetector(
                          onTap: () {
                            controller.drawIndexs.value = drawIndex;
                            controller.matchOutcome.value = 1;
                            controller.selectWinner(
                                teams.homeTeam!.assetCode!,
                                teams.homeTeam!.name!,
                                teams.homeTeam!.imageUrl!,
                                1);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: AppColors.grey,
                              borderRadius: BorderRadius.circular(5.r),
                              border: Border.all(
                                  color: AppColors.borderColor, width: 1),
                            ),
                            child: teams.homeTeam!.imageUrl == null
                                ? Container()
                                : teams.homeTeam!.imageUrl!.endsWith('.svg')
                                    ? controller.sportName == 'CR'
                                        ? Image.network(
                                            replaceSvgWithPng(
                                                teams.homeTeam!.imageUrl!),
                                            height: 50.h,
                                            width: 50.h,
                                          )
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
                        )),
                        horizontalSpace(10.w),
                        Expanded(
                            child: GestureDetector(
                          onTap: () {
                            controller.matchOutcome.value = 2;
                            controller.drawIndexs.value = drawIndex;
                            controller.selectWinner(
                                teams.awayTeam!.assetCode!,
                                teams.awayTeam!.name!,
                                teams.awayTeam!.imageUrl!,
                                2);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: AppColors.grey,
                              borderRadius: BorderRadius.circular(5.r),
                              border: Border.all(
                                  color: AppColors.borderColor, width: 1),
                            ),
                            child: teams.awayTeam!.imageUrl == null
                                ? Container()
                                : teams.awayTeam!.imageUrl!.endsWith('svg')
                                    ? controller.sportName == 'CR'
                                        ? Image.network(
                                            replaceSvgWithPng(
                                                teams.awayTeam!.imageUrl!),
                                            height: 50.h,
                                            width: 50.h,
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
                          ),
                        )),
                      ],
                    ),
                    verticalSpace(5.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Expanded(
                            child: Divider(
                          endIndent: 30,
                          color: AppColors.grey,
                          thickness: 1,
                        )),
                        horizontalSpace(5.w),
                        Text(
                          'OR',
                          style: globalTextStyle(
                              color: AppColors.textGray, fontSize: 10.sp),
                        ),
                        horizontalSpace(5.w),
                        const Expanded(
                            child: Divider(
                          indent: 30,
                          color: AppColors.grey,
                          thickness: 1,
                        )),
                      ],
                    ),
                    verticalSpace(5.h),
                    GestureDetector(
                      onTap: () {
                        controller.matchOutcome.value = 3;
                        controller.drawIndexs.value = drawIndex;
                        controller.selectWinner('', '', '', 3);
                      },
                      child: Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: AppColors.grey,
                            borderRadius: BorderRadius.circular(5.r),
                            border: Border.all(
                                color: AppColors.borderColor, width: 1),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  teams.homeTeam!.imageUrl == null
                                      ? Container()
                                      : controller.sportName == 'CR'
                                          ? Image.network(
                                              replaceSvgWithPng(
                                                  teams.homeTeam!.imageUrl!),
                                              height: 50.h,
                                              width: 50.h)
                                          : teams.homeTeam!.imageUrl!
                                                  .endsWith('svg')
                                              ? SvgPicture.network(
                                                  teams.homeTeam!.imageUrl!,
                                                  height: 50.h,
                                                  width: 50.w,
                                                )
                                              : Image.network(
                                                  teams.homeTeam!.imageUrl!,
                                                  height: 50.h,
                                                  width: 50.w,
                                                ),
                                  horizontalSpace(10.w),
                                  teams.awayTeam!.imageUrl == null
                                      ? Container()
                                      : controller.sportName == 'CR'
                                          ? Image.network(
                                              replaceSvgWithPng(
                                                  teams.awayTeam!.imageUrl!),
                                              height: 50.h,
                                              width: 50.h,
                                            )
                                          : teams.awayTeam!.imageUrl!
                                                  .endsWith('svg')
                                              ? SvgPicture.network(
                                                  teams.awayTeam!.imageUrl!,
                                                  height: 50.h,
                                                  width: 50.w,
                                                )
                                              : Image.network(
                                                  teams.awayTeam!.imageUrl!,
                                                  height: 50.h,
                                                  width: 50.w,
                                                ),
                                ],
                              ),
                              verticalSpace(10.h),
                              Text(
                                'Match Draw',
                                style: globalTextStyle(fontSize: 12.sp),
                              )
                            ],
                          )),
                    )
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
