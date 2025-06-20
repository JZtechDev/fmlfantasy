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
      backgroundColor: AppColors.primary,
      surfaceTintColor: AppColors.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0.r),
      ),
      child: SizedBox(
        height: Get.height * 0.55,
        child: Stack(
          children: [
            Positioned(
              top: 0.h,
              right: 0.w,
              left: 0.w,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 50,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(18, 96, 85, 1),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.r),
                          )),
                      child: Image.asset(
                        'assets/new_images/trophy.png',
                        height: 25,
                        width: 25,
                        color: AppColors.secondary,
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    padding: const EdgeInsets.all(10),
                    color: AppColors.primaryLight,
                    child: Text(
                      'Select Match Outcome',
                      style: globalTextStyle(
                          fontSize: 14.sp,
                          color: AppColors.secondary,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      height: 50,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(18, 96, 85, 1),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10.r),
                          )),
                      child: Image.asset(
                        AppImages.crossIcon,
                        color: AppColors.secondary,
                        height: 20.h,
                        width: 20.h,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.w, right: 10.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      controller.matchOutcome.value = 2;
                      controller.drawIndexs.value = drawIndex;
                      controller.selectWinner(teams.awayTeam!.assetCode!,
                          teams.awayTeam!.name!, teams.awayTeam!.imageUrl!, 2);
                    },
                    child: Container(
                        width: Get.width,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(44, 86, 80, 1),
                          borderRadius: BorderRadius.circular(5.r),
                        ),
                        child: Column(
                          children: [
                            teams.awayTeam!.imageUrl == null
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
                            verticalSpace(5.h),
                            Text(
                              "${teams.awayTeam!.name!} Winner ",
                              style: globalTextStyle(
                                  fontSize: 14.sp,
                                  color: AppColors.secondary,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        )),
                  ),
                  verticalSpace(5.h),
                  GestureDetector(
                    onTap: () {
                      controller.drawIndexs.value = drawIndex;
                      controller.matchOutcome.value = 1;
                      controller.selectWinner(teams.homeTeam!.assetCode!,
                          teams.homeTeam!.name!, teams.homeTeam!.imageUrl!, 1);
                    },
                    child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(44, 86, 80, 1),
                          borderRadius: BorderRadius.circular(5.r),
                        ),
                        child: Column(
                          children: [
                            teams.homeTeam!.imageUrl == null
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
                            verticalSpace(5.h),
                            Text(
                              "${teams.homeTeam!.name!} Winner ",
                              style: globalTextStyle(
                                  fontSize: 14.sp,
                                  color: AppColors.secondary,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        )),
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     const Expanded(
                  //         child: Divider(
                  //       endIndent: 30,
                  //       color: AppColors.grey,
                  //       thickness: 1,
                  //     )),
                  //     horizontalSpace(5.w),
                  //     Text(
                  //       'OR',
                  //       style: globalTextStyle(
                  //           color: AppColors.textGray, fontSize: 10.sp),
                  //     ),
                  //     horizontalSpace(5.w),
                  //     const Expanded(
                  //         child: Divider(
                  //       indent: 30,
                  //       color: AppColors.grey,
                  //       thickness: 1,
                  //     )),
                  //   ],
                  // ),
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
                          color: const Color.fromRGBO(44, 86, 80, 1),
                          borderRadius: BorderRadius.circular(5.r),
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
                              style: globalTextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.secondary),
                            )
                          ],
                        )),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
