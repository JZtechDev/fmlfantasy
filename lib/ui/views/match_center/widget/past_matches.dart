import 'dart:math';

import 'package:fmlfantasy/app/app_sizings.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/model/match_center_model.dart';
import 'package:fmlfantasy/ui/helpers/commons.dart';
import 'package:fmlfantasy/ui/helpers/replace_svg_with_png.dart';
import 'package:fmlfantasy/ui/views/match_center/controller/match_center_inner_controller.dart';
import 'package:carousel_slider_plus/carousel_options.dart';
import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class PastMatchesSlider extends StatelessWidget {
  const PastMatchesSlider({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MatchCenterInner());
    return GetBuilder<MatchCenterInner>(builder: (controller) {
      return CarouselSlider.builder(
        itemCount: controller.pastMatches.length,
        // controller: controller.myTeamCrouselController,
        itemBuilder: (BuildContext context, int index, int realIndex) {
          PastMatches matches = controller.pastMatches[index];
          bool isSelected =
              controller.selectedMatch.matchKey == matches.matchKey;
          return GestureDetector(
              onTap: () {
                controller.selectMatch(matches);
              },
              child: Container(
                  clipBehavior: Clip.hardEdge,
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: isSelected
                            ? AppColors.primary
                            : AppColors.borderColor),
                    borderRadius: BorderRadius.circular(10.r),
                    color: AppColors.white,
                  ),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Transform.rotate(
                          origin: const Offset(30, -10),
                          angle: pi / 4.5,
                          child: Container(
                            height: AppSizing.isMobile(context) ? 150.0 : 280,
                            width: 60.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              gradient: const LinearGradient(
                                colors: [
                                  Color.fromRGBO(219, 231, 255, 1),
                                  Color.fromRGBO(219, 231, 255, 0)
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomRight,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Transform.rotate(
                          origin: const Offset(20, 50),
                          angle: pi / 4.5,
                          child: Container(
                            height: AppSizing.isMobile(context) ? 100.0 : 150.0,
                            width: 80.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              gradient: const LinearGradient(
                                colors: [
                                  Color.fromRGBO(219, 231, 255, 1),
                                  Color.fromRGBO(219, 231, 255, 0)
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomRight,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              matches.competitionName ?? '',
                              style: globalTextStyle(
                                  fontSize: AppSizing.isMobile(context)
                                      ? 12.sp
                                      : 8.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.textGray),
                            ),
                            verticalSpace(5),
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
                                    matches.start != null
                                        ? DateFormat('d MMM hh:mm a').format(
                                            DateTime.parse(matches.start ?? '')
                                                .toLocal())
                                        : '',
                                    style: globalTextStyle2(
                                        fontSize: AppSizing.isTablet(context)
                                            ? 8.sp
                                            : 10.sp,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.navyBlue),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis),
                              ],
                            ),
                            verticalSpace(10.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    matches.homeImageUrl == null ||
                                            matches.homeImageUrl!.isEmpty
                                        ? Container()
                                        : controller.sportsCode == 'CR'
                                            ? Image.network(
                                                replaceSvgWithPng(
                                                    matches.homeImageUrl!),
                                                height: 35.h,
                                                width: 35.w,
                                              )
                                            : matches.homeImageUrl!
                                                    .endsWith('.svg')
                                                ? SvgPicture.network(
                                                    matches.homeImageUrl!,
                                                    height: 35.h,
                                                    width: 35.w,
                                                  )
                                                : Image.network(
                                                    matches.homeImageUrl!,
                                                    height: 35.h,
                                                    width: 35.w,
                                                  ),
                                    verticalSpace(10.h),
                                    SizedBox(
                                      width: Get.width * 0.25,
                                      child: Text(
                                        textAlign: TextAlign.center,
                                        matches.home ?? '',
                                        style: globalTextStyle2(
                                          fontSize: AppSizing.isMobile(context)
                                              ? 12.sp
                                              : 10.sp,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Text(
                                  'vs',
                                  style: globalTextStyle2(
                                      fontSize: 12.sp,
                                      color: AppColors.textGray),
                                ),
                                Column(
                                  children: [
                                    matches.awayImageUrl == null ||
                                            matches.awayImageUrl!.isEmpty
                                        ? Container()
                                        : controller.sportsCode == 'CR'
                                            ? Image.network(
                                                replaceSvgWithPng(
                                                    matches.awayImageUrl!),
                                                height: 35.h,
                                                width: 35.w,
                                              )
                                            : matches.awayImageUrl!
                                                    .endsWith('.svg')
                                                ? SvgPicture.network(
                                                    matches.awayImageUrl!,
                                                    height: 35.h,
                                                    width: 35.w,
                                                  )
                                                : Image.network(
                                                    matches.awayImageUrl!,
                                                    height: 35.h,
                                                    width: 35.w,
                                                  ),
                                    verticalSpace(10.h),
                                    SizedBox(
                                      width: Get.width * 0.25,
                                      child: Text(
                                        textAlign: TextAlign.center,
                                        matches.away ?? '',
                                        style: globalTextStyle2(
                                          fontSize: AppSizing.isMobile(context)
                                              ? 12.sp
                                              : 10.sp,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            )
                          ]),
                    ],
                  )));
        },
        options: CarouselOptions(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          aspectRatio: AppSizing.isMobile(context) ? 25 / 13 : 25 / 8,
          viewportFraction: AppSizing.isMobile(context) ? 0.7 : 0.6,
          padEnds: false,
          initialPage: 0,
          disableCenter: true,
          enableInfiniteScroll: false,
          reverse: false,
          autoPlay: false,
          enlargeCenterPage: false,
          scrollDirection: Axis.horizontal,
          onPageChanged: (index, reason) {},
        ),
      );
    });
  }
}
