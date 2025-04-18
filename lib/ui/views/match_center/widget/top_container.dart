import 'package:fmlfantasy/app/app_colors/app_colors.dart';
import 'package:fmlfantasy/app/app_images/app_images.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/model/match_center_inner_model.dart';
import 'package:fmlfantasy/ui/helpers/commons.dart';
import 'package:fmlfantasy/ui/helpers/replace_svg_with_png.dart';
import 'package:fmlfantasy/ui/views/match_center/controller/match_center_inner_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class GeneralTopContainer extends GetView<MatchCenterInner> {
  final String? homename;
  final String? awayname;
  final String? homeimageurl;
  final String? awayimageurl;
  final String? homeScore;
  final String? awayScore;
  final String? playerOfTheMatch;
  final List<PeriodScore>? periodScore;
  final String? league;
  final String? time;
  const GeneralTopContainer(
    this.homename,
    this.awayname,
    this.homeimageurl,
    this.awayimageurl,
    this.homeScore,
    this.awayScore,
    this.playerOfTheMatch,
    this.periodScore,
    this.league,
    this.time, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      double maxWidth = constraints.maxWidth;
      return Container(
        color: AppColors.white,
        child: Padding(
          padding:
              EdgeInsets.only(left: 5.w, right: 5.w, top: 10.h, bottom: 10.h),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      width: Get.width * 0.4,
                      child: Text(
                        maxLines: 2,
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                        league.toString(),
                        style: globalTextStyle(
                            fontSize: 12.sp, fontWeight: FontWeight.w600),
                      )),
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/clock.svg',
                        // ignore: deprecated_member_use
                        color: AppColors.navyBlue,
                        height: 16.h,
                        width: 16.w,
                      ),
                      horizontalSpace(5.w),
                      Text(
                          time != null
                              ? DateFormat('d MMM hh:mm a')
                                  .format(DateTime.parse(time!).toLocal())
                              : '',
                          style: globalTextStyle2(
                              fontSize: maxWidth > 600 ? 8.sp : 10.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.navyBlue),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis),
                    ],
                  )
                ],
              ),
              verticalSpace(10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 30.h,
                        width: Get.width * 0.4,
                        decoration: BoxDecoration(
                          color: AppColors.grey,
                          borderRadius: BorderRadius.circular(5.r),
                        ),
                        child: Text(homeScore.toString(),
                            style: globalTextStyle(
                                fontSize: maxWidth > 600 ? 12.sp : 18.sp,
                                color: AppColors.navyBlue)),
                      ),
                      verticalSpace(5.h),
                      homeimageurl == null
                          ? const SizedBox(
                              height: 50,
                              width: 100,
                            )
                          : homeimageurl!.endsWith('.png')
                              ? Image.network(
                                  homeimageurl!,
                                  height: 45.h,
                                  width: 45.w,
                                )
                              : controller.sportsCode == 'CR'
                                  ? Image.network(
                                      replaceSvgWithPng(homeimageurl!),
                                      height: 45.h,
                                      width: 45.w,
                                    )
                                  : SvgPicture.network(
                                      homeimageurl!,
                                      height: 30.h,
                                      width: 30.w,
                                    ),
                      verticalSpace(5.h),
                      Text(homename == null ? '-' : homename!,
                          style: globalTextStyle(
                              fontSize: maxWidth > 600 ? 12.sp : 14.sp)),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 30.h,
                        width: Get.width * 0.4,
                        decoration: BoxDecoration(
                          color: AppColors.grey,
                          borderRadius: BorderRadius.circular(5.r),
                        ),
                        child: Text(awayScore.toString(),
                            style: globalTextStyle(
                                fontSize: maxWidth > 600 ? 12.sp : 18.sp,
                                color: AppColors.navyBlue)),
                      ),
                      verticalSpace(5.h),
                      awayimageurl == null
                          ? const SizedBox(
                              height: 50,
                              width: 100,
                            )
                          : awayimageurl!.endsWith('.png')
                              ? Image.network(
                                  awayimageurl!,
                                  height: 30.h,
                                  width: 30.w,
                                )
                              : controller.sportsCode == 'CR'
                                  ? Image.network(
                                      replaceSvgWithPng(awayimageurl!),
                                      height: 30.h,
                                      width: 30.w,
                                    )
                                  : SvgPicture.network(
                                      awayimageurl!,
                                      height: 30.h,
                                      width: 30.w,
                                    ),
                      verticalSpace(5.h),
                      Text(awayname == null ? '-' : awayname!,
                          style: globalTextStyle(
                              fontSize: maxWidth > 600 ? 12.sp : 14.sp)),
                    ],
                  ),
                ],
              ),
              verticalSpace(5.h),
              periodScore == null
                  ? Container()
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: Get.width * 0.45,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: periodScore!.map((q) {
                                return Container(
                                  margin: EdgeInsets.only(left: 5.w),
                                  padding: EdgeInsets.only(
                                      left: 3.w,
                                      right: 3.w,
                                      top: 3.h,
                                      bottom: 3.h),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: AppColors.grey,
                                    borderRadius: BorderRadius.circular(5.r),
                                  ),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          " ${q.periodType![0]} ${q.periodOrder.toString()}",
                                          style: globalTextStyle(
                                              fontSize: maxWidth > 600
                                                  ? 10.sp
                                                  : 12.sp,
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.primary),
                                        ),
                                        Text(
                                          q.homeScore
                                              .toString()
                                              .padLeft(2, '0')
                                              .padLeft(2, '0'),
                                          style: globalTextStyle(
                                              fontSize:
                                                  maxWidth > 600 ? 8.sp : 10.sp,
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.navyBlue),
                                        ),
                                        horizontalSpace(5.w),
                                      ]),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: Get.width * 0.45,
                          child: SingleChildScrollView(
                            controller: controller.scrollController,
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: periodScore!.map((q) {
                                return Container(
                                  margin: EdgeInsets.only(left: 5.w),
                                  padding: EdgeInsets.only(
                                      left: 3.w,
                                      right: 3.w,
                                      top: 3.h,
                                      bottom: 3.h),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: AppColors.grey,
                                    borderRadius: BorderRadius.circular(5.r),
                                  ),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          " ${q.periodType![0]} ${q.periodOrder.toString()}",
                                          style: globalTextStyle(
                                              fontSize: maxWidth > 600
                                                  ? 10.sp
                                                  : 12.sp,
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.primary),
                                        ),
                                        Text(
                                          q.awayScore
                                              .toString()
                                              .padLeft(2, '0')
                                              .padLeft(2, '0'),
                                          style: globalTextStyle(
                                              fontSize:
                                                  maxWidth > 600 ? 8.sp : 10.sp,
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.navyBlue),
                                        ),
                                        horizontalSpace(5.w),
                                      ]),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ],
                    ),
              verticalSpace(10.h),
              Container(
                padding: EdgeInsets.only(top: 5.h, bottom: 5.h),
                alignment: Alignment.center,
                width: Get.width,
                decoration: BoxDecoration(
                  color: AppColors.grey,
                  border: const Border(
                    top: BorderSide(color: AppColors.borderColor2),
                  ),
                  borderRadius: BorderRadius.circular(5.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      AppImages.playerOfTheMatch,
                      height: 25.h,
                      width: 25.w,
                    ),
                    horizontalSpace(10.h),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("playerOfTheMatch".tr,
                            style: globalTextStyle(
                                fontSize: maxWidth > 600 ? 10.sp : 12.sp,
                                color: AppColors.navyBlue)),
                        Text(
                            playerOfTheMatch == null
                                ? "Null"
                                : playerOfTheMatch!,
                            style: globalTextStyle2(
                                fontSize: maxWidth > 600 ? 8.sp : 10.sp,
                                color: AppColors.navyBlue)),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
