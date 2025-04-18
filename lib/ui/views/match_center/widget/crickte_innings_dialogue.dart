import 'package:fmlfantasy/app/app_images/app_images.dart';
import 'package:fmlfantasy/app/app_sizings.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/ui/helpers/replace_svg_with_png.dart';
import 'package:fmlfantasy/ui/views/match_center/controller/match_center_inner_controller.dart';
import 'package:fmlfantasy/ui/widgets/primary_button.dart';
import 'package:flutter_svg/svg.dart';

class InningsDialog extends GetView<MatchCenterInner> {
  final String homeTeamName;
  final String awayTeamName;
  final String homeTeamImage;
  final String awayTeamImage;
  final String? homeTeamTopBatsman1;
  final String? homeTeamTopBatsman2;
  final String? homeTeamTopBowler1;
  final String? homeTeamTopBowler2;
  final String? awayTeamTopBatsman1;
  final String? awayTeamTopBatsman2;
  final String? awayTeamTopBowler1;
  final String? awayTeamTopBowler2;
  final String? homeTeamTopBatsman1Stats;
  final String? homeTeamTopBatsman2Stats;
  final String? homeTeamTopBowler1Stats;
  final String? homeTeamTopBowler2Stats;
  final String? awayTeamTopBatsman1Stats;
  final String? awayTeamTopBatsman2Stats;
  final String? awayTeamTopBowler1Stats;
  final String? awayTeamTopBowler2Stats;

  const InningsDialog({
    super.key,
    required this.homeTeamName,
    required this.awayTeamName,
    required this.homeTeamImage,
    required this.awayTeamImage,
    this.homeTeamTopBatsman1,
    this.homeTeamTopBatsman2,
    this.homeTeamTopBowler1,
    this.homeTeamTopBowler2,
    this.awayTeamTopBatsman1,
    this.awayTeamTopBatsman2,
    this.awayTeamTopBowler1,
    this.awayTeamTopBowler2,
    this.homeTeamTopBatsman1Stats,
    this.homeTeamTopBatsman2Stats,
    this.homeTeamTopBowler1Stats,
    this.homeTeamTopBowler2Stats,
    this.awayTeamTopBatsman1Stats,
    this.awayTeamTopBatsman2Stats,
    this.awayTeamTopBowler1Stats,
    this.awayTeamTopBowler2Stats,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.white,
      surfaceTintColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0.r),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: Get.width,
              padding: EdgeInsets.only(top: 5.h, bottom: 5.h),
              decoration: BoxDecoration(
                color: AppColors.grey,
                borderRadius: BorderRadius.circular(5.r),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      homeTeamImage == ''
                          ? const SizedBox(
                              height: 25,
                              width: 100,
                            )
                          : homeTeamImage.endsWith('.png')
                              ? Image.network(
                                  homeTeamImage,
                                  height: 25.h,
                                  width: 25.w,
                                )
                              : controller.sportsCode == 'CR'
                                  ? Image.network(
                                      replaceSvgWithPng(homeTeamImage),
                                      height: 25.h,
                                      width: 25.w,
                                    )
                                  : SvgPicture.network(
                                      homeTeamImage,
                                      height: 25.h,
                                      width: 25.w,
                                    ),
                      horizontalSpace(10.w),
                      SizedBox(
                        width: Get.width * 0.5,
                        child: Text(
                          "$homeTeamName's Inning",
                          style: globalTextStyle(
                              fontSize:
                                  AppSizing.isMobile(context) ? 14.sp : 11.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.navyBlue),
                        ),
                      ),
                    ],
                  ),
                  verticalSpace(10.h),
                  Container(
                    width: Get.width,
                    margin: EdgeInsets.only(left: 5.w, right: 5.w),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(2.5.r),
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: Get.width * 0.34,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                    margin: EdgeInsets.only(
                                        left: 5.w,
                                        right: 5.w,
                                        top: 5.h,
                                        bottom: 5.h),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: AppColors.grey,
                                      borderRadius: BorderRadius.circular(5.r),
                                    ),
                                    child: Image.asset(
                                      AppImages.topBatsmen,
                                      height: 30.h,
                                      width: 30.w,
                                      color: AppColors.primary,
                                    )),
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: Get.width * 0.22,
                                        child: Text(
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          homeTeamTopBatsman1 ?? '-',
                                          style: globalTextStyle(
                                              fontSize:
                                                  AppSizing.isMobile(context)
                                                      ? 12.sp
                                                      : 10.sp,
                                              color: AppColors.navyBlue),
                                        ),
                                      ),
                                      Text(
                                        homeTeamTopBatsman1Stats ?? '-',
                                        style: globalTextStyle(
                                            fontSize:
                                                AppSizing.isMobile(context)
                                                    ? 14.sp
                                                    : 12.sp,
                                            color: AppColors.navyBlue),
                                      )
                                    ]),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: Get.width * 0.35,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                    margin: EdgeInsets.only(
                                        left: 5.w,
                                        right: 5.w,
                                        top: 5.h,
                                        bottom: 5.h),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: AppColors.grey,
                                      borderRadius: BorderRadius.circular(5.r),
                                    ),
                                    child: Image.asset(
                                      AppImages.topBowlers,
                                      height: 30.h,
                                      width: 30.w,
                                      color: AppColors.primary,
                                    )),
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: Get.width * 0.22,
                                        child: Text(
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          awayTeamTopBowler1 ?? '-',
                                          style: globalTextStyle(
                                              fontSize:
                                                  AppSizing.isMobile(context)
                                                      ? 12.sp
                                                      : 10.sp,
                                              color: AppColors.navyBlue),
                                        ),
                                      ),
                                      Text(
                                        awayTeamTopBowler1Stats ?? '-',
                                        style: globalTextStyle(
                                            fontSize:
                                                AppSizing.isMobile(context)
                                                    ? 14.sp
                                                    : 12.sp,
                                            color: AppColors.navyBlue),
                                      )
                                    ]),
                              ],
                            ),
                          )
                        ]),
                  ),
                  verticalSpace(5.h),
                  Container(
                    width: Get.width,
                    margin: EdgeInsets.only(left: 5.w, right: 5.w),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: Get.width * 0.34,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                    margin: EdgeInsets.only(
                                        left: 5.w,
                                        right: 5.w,
                                        top: 5.h,
                                        bottom: 5.h),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: AppColors.grey,
                                      borderRadius: BorderRadius.circular(5.r),
                                    ),
                                    child: Image.asset(
                                      AppImages.topBatsmen,
                                      height: 30.h,
                                      width: 30.w,
                                      color: AppColors.primary,
                                    )),
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: Get.width * 0.22,
                                        child: Text(
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          homeTeamTopBatsman2 ?? '-',
                                          style: globalTextStyle(
                                              fontSize:
                                                  AppSizing.isMobile(context)
                                                      ? 12.sp
                                                      : 10.sp,
                                              color: AppColors.navyBlue),
                                        ),
                                      ),
                                      Text(
                                        homeTeamTopBatsman2Stats ?? '-',
                                        style: globalTextStyle(
                                            fontSize:
                                                AppSizing.isMobile(context)
                                                    ? 14.sp
                                                    : 12.sp,
                                            color: AppColors.navyBlue),
                                      )
                                    ]),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: Get.width * 0.35,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                    margin: EdgeInsets.only(
                                        left: 5.w,
                                        right: 5.w,
                                        top: 5.h,
                                        bottom: 5.h),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: AppColors.grey,
                                      borderRadius: BorderRadius.circular(5.r),
                                    ),
                                    child: Image.asset(
                                      AppImages.topBowlers,
                                      height: 30.h,
                                      width: 30.w,
                                      color: AppColors.primary,
                                    )),
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: Get.width * 0.22,
                                        child: Text(
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          awayTeamTopBowler2 ?? '-',
                                          style: globalTextStyle(
                                              fontSize:
                                                  AppSizing.isMobile(context)
                                                      ? 12.sp
                                                      : 10.sp,
                                              color: AppColors.navyBlue),
                                        ),
                                      ),
                                      Text(
                                        awayTeamTopBowler2Stats ?? '-',
                                        style: globalTextStyle(
                                            fontSize:
                                                AppSizing.isMobile(context)
                                                    ? 14.sp
                                                    : 12.sp,
                                            color: AppColors.navyBlue),
                                      )
                                    ]),
                              ],
                            ),
                          )
                        ]),
                  ),
                ],
              ),
            ),
            verticalSpace(10.h),
            Container(
              padding: EdgeInsets.only(top: 5.h, bottom: 5.h),
              width: Get.width,
              decoration: BoxDecoration(
                color: AppColors.grey,
                borderRadius: BorderRadius.circular(5.r),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      awayTeamImage == ''
                          ? const SizedBox(
                              height: 25,
                              width: 30,
                            )
                          : awayTeamImage.endsWith('.png')
                              ? Image.network(
                                  awayTeamImage,
                                  height: 25.h,
                                  width: 25.w,
                                )
                              : controller.sportsCode == 'CR'
                                  ? Image.network(
                                      replaceSvgWithPng(awayTeamImage),
                                      height: 25.h,
                                      width: 25.w,
                                    )
                                  : SvgPicture.network(
                                      awayTeamImage,
                                      height: 20.h,
                                      width: 20.w,
                                    ),
                      horizontalSpace(5.w),
                      SizedBox(
                        width: Get.width * 0.5,
                        child: Text(
                          "$awayTeamName's Inning",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: globalTextStyle(
                              fontSize:
                                  AppSizing.isMobile(context) ? 14.sp : 12.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.navyBlue),
                        ),
                      ),
                    ],
                  ),
                  verticalSpace(10.h),
                  Container(
                    width: Get.width,
                    margin: EdgeInsets.only(left: 5.w, right: 5.w),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: Get.width * 0.34,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                    margin: EdgeInsets.only(
                                        left: 5.w,
                                        right: 5.w,
                                        top: 5.h,
                                        bottom: 5.h),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: AppColors.grey,
                                      borderRadius: BorderRadius.circular(5.r),
                                    ),
                                    child: Image.asset(
                                      AppImages.topBatsmen,
                                      height: 30.h,
                                      width: 30.w,
                                      color: AppColors.primary,
                                    )),
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: Get.width * 0.22,
                                        child: Text(
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          awayTeamTopBatsman1 ?? '-',
                                          style: globalTextStyle(
                                              fontSize:
                                                  AppSizing.isMobile(context)
                                                      ? 12.sp
                                                      : 10.sp,
                                              color: AppColors.navyBlue),
                                        ),
                                      ),
                                      Text(
                                        awayTeamTopBatsman1Stats ?? '-',
                                        style: globalTextStyle(
                                            fontSize:
                                                AppSizing.isMobile(context)
                                                    ? 14.sp
                                                    : 12.sp,
                                            color: AppColors.navyBlue),
                                      )
                                    ]),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: Get.width * 0.35,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                    margin: EdgeInsets.only(
                                        left: 5.w,
                                        right: 5.w,
                                        top: 5.h,
                                        bottom: 5.h),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: AppColors.grey,
                                      borderRadius: BorderRadius.circular(5.r),
                                    ),
                                    child: Image.asset(
                                      AppImages.topBowlers,
                                      height: 30.h,
                                      width: 30.w,
                                      color: AppColors.primary,
                                    )),
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: Get.width * 0.22,
                                        child: Text(
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          homeTeamTopBowler1 ?? '-',
                                          style: globalTextStyle(
                                              fontSize:
                                                  AppSizing.isMobile(context)
                                                      ? 12.sp
                                                      : 10.sp,
                                              color: AppColors.navyBlue),
                                        ),
                                      ),
                                      Text(
                                        homeTeamTopBowler1Stats ?? '-',
                                        style: globalTextStyle(
                                            fontSize:
                                                AppSizing.isMobile(context)
                                                    ? 14.sp
                                                    : 12.sp,
                                            color: AppColors.navyBlue),
                                      )
                                    ]),
                              ],
                            ),
                          )
                        ]),
                  ),
                  verticalSpace(5.h),
                  Container(
                    width: Get.width,
                    margin: EdgeInsets.only(left: 5.w, right: 5.w),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: Get.width * 0.34,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                    margin: EdgeInsets.only(
                                        left: 5.w,
                                        right: 5.w,
                                        top: 5.h,
                                        bottom: 5.h),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: AppColors.grey,
                                      borderRadius: BorderRadius.circular(5.r),
                                    ),
                                    child: Image.asset(
                                      AppImages.topBatsmen,
                                      height: 30.h,
                                      width: 30.w,
                                      color: AppColors.primary,
                                    )),
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: Get.width * 0.22,
                                        child: Text(
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          awayTeamTopBatsman2 ?? '-',
                                          style: globalTextStyle(
                                              fontSize:
                                                  AppSizing.isMobile(context)
                                                      ? 12.sp
                                                      : 10.sp,
                                              color: AppColors.navyBlue),
                                        ),
                                      ),
                                      Text(
                                        awayTeamTopBatsman2Stats ?? '-',
                                        style: globalTextStyle(
                                            fontSize:
                                                AppSizing.isMobile(context)
                                                    ? 14.sp
                                                    : 12.sp,
                                            color: AppColors.navyBlue),
                                      )
                                    ]),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: Get.width * 0.35,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                    margin: EdgeInsets.only(
                                        left: 5.w,
                                        right: 5.w,
                                        top: 5.h,
                                        bottom: 5.h),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: AppColors.grey,
                                      borderRadius: BorderRadius.circular(5.r),
                                    ),
                                    child: Image.asset(
                                      AppImages.topBowlers,
                                      height: 30.h,
                                      width: 30.w,
                                      color: AppColors.primary,
                                    )),
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: Get.width * 0.22,
                                        child: Text(
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          homeTeamTopBowler2 ?? '-',
                                          style: globalTextStyle(
                                              fontSize:
                                                  AppSizing.isMobile(context)
                                                      ? 12.sp
                                                      : 10.sp,
                                              color: AppColors.navyBlue),
                                        ),
                                      ),
                                      Text(
                                        homeTeamTopBowler2Stats ?? '-',
                                        style: globalTextStyle(
                                            fontSize:
                                                AppSizing.isMobile(context)
                                                    ? 14.sp
                                                    : 12.sp,
                                            color: AppColors.navyBlue),
                                      )
                                    ]),
                              ],
                            ),
                          )
                        ]),
                  ),
                ],
              ),
            ),
            verticalSpace(10.h),
            PrimaryButton(
              buttonText: 'Close',
              onPressed: () {
                Get.back();
              },
              isEnabled: true,
              padding: 0,
            )
          ],
        ),
      ),
    );
  }
}
