import 'dart:math';
import 'package:fmlfantasy/app/app_colors/app_colors.dart';
import 'package:fmlfantasy/app/app_sizings.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/ui/helpers/commons.dart';
import 'package:fmlfantasy/ui/helpers/replace_svg_with_png.dart';
import 'package:fmlfantasy/ui/views/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:fmlfantasy/model/tournament_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TournamentCardSlider extends GetView<HomeController> {
  final Tournaments tournament;

  const TournamentCardSlider({super.key, required this.tournament});

  String formatEndDateTime(DateTime endDate) {
    final DateTime now = DateTime.now().toLocal();
    if (endDate.isBefore(now)) {
      return 'Ended';
    }
    return DateFormat('dd MMM yyyy, hh:mm a').format(endDate);
  }

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    final DateTime endDate = DateTime.parse(tournament.startDate.toString());
    final String formattedDifference = formatEndDateTime(endDate.toLocal());
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        return Stack(
          children: [
            Container(
              clipBehavior: Clip.hardEdge,
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              padding: EdgeInsets.only(
                  top: 10.h, left: 10.w, right: 10.w, bottom: 20.h),
              decoration: BoxDecoration(
                color: AppColors.white,
                border: Border.all(color: AppColors.borderColor, width: 1.0),
                borderRadius: BorderRadius.circular(5.r),
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Transform.rotate(
                      origin: const Offset(50, 30),
                      angle: pi / 4.5,
                      child: Container(
                        height: 140.0,
                        width: 60.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          gradient: const LinearGradient(
                            colors: [
                              Color.fromRGBO(219, 231, 255, 1),
                              Color.fromRGBO(219, 231, 255, 0),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/icons/clock.svg',
                                height: 15.h,
                              ),
                              horizontalSpace(5.w),
                              Text(
                                formattedDifference,
                                style: globalTextStyle(
                                    fontSize: width > 500 ? 8.sp : 12.sp,
                                    color: AppColors.primary),
                              ),
                            ],
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  constraints: BoxConstraints(
                                    maxHeight: 27.h,
                                    minHeight: 27.h,
                                    maxWidth: 30.w,
                                    minWidth: 30.w,
                                  ),
                                  child: tournament.matches![0].homeImageUrl ==
                                          null
                                      ? Container()
                                      : tournament.matches![0].homeImageUrl!
                                              .endsWith('.svg.png')
                                          ? Container()
                                          : tournament.matches![0].homeImageUrl!
                                                  .endsWith('svg')
                                              ? controller.selectedSport
                                                              .value ==
                                                          'CR' ||
                                                      controller.selectedSport
                                                              .value ==
                                                          'FB'
                                                  ? Image.network(
                                                      replaceSvgWithPng(
                                                          tournament.matches![0]
                                                              .homeImageUrl
                                                              .toString()),
                                                      fit: BoxFit.fill,
                                                    )
                                                  : SvgPicture.network(
                                                      tournament.matches![0]
                                                          .homeImageUrl
                                                          .toString(),
                                                      fit: BoxFit.fill,
                                                    )
                                              : Image.network(
                                                  tournament
                                                      .matches![0].homeImageUrl
                                                      .toString(),
                                                  fit: BoxFit.fill,
                                                ),
                                ),
                                horizontalSpace(10.w),
                                Container(
                                    constraints: BoxConstraints(
                                      maxHeight: 27.h,
                                      minHeight: 27.h,
                                      maxWidth: 30.w,
                                      minWidth: 30.w,
                                    ),
                                    child: tournament
                                                .matches![0].awayImageUrl ==
                                            null
                                        ? Container()
                                        : tournament.matches![0].awayImageUrl!
                                                .endsWith('.svg.png')
                                            ? Container()
                                            : tournament
                                                    .matches![0].awayImageUrl!
                                                    .endsWith('svg')
                                                ? controller.selectedSport
                                                                .value ==
                                                            'CR' ||
                                                        controller.selectedSport
                                                                .value ==
                                                            'FB'
                                                    ? Image.network(
                                                        replaceSvgWithPng(
                                                            tournament
                                                                .matches![0]
                                                                .awayImageUrl
                                                                .toString()),
                                                        fit: BoxFit.fill,
                                                      )
                                                    : SvgPicture.network(
                                                        tournament.matches![0]
                                                            .awayImageUrl!,
                                                        fit: BoxFit.fill,
                                                      )
                                                : Image.network(
                                                    tournament.matches![0]
                                                        .awayImageUrl!,
                                                    fit: BoxFit.fill,
                                                  )),
                              ]),
                        ],
                      ),
                      verticalSpace(10.h),
                      Text(
                        textAlign: TextAlign.start,
                        tournament.name.toString().split('vs ').join('\n'),
                        style: globalTextStyle(
                            fontSize: width > 500 ? 10.sp : 14.sp,
                            fontWeight: FontWeight.w600),
                      ),
                      verticalSpace(10.h),
                      SizedBox(
                          width: Get.width * 0.4,
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'assets/icons/publictournament.svg',
                                height: 28,
                                width: 28,
                              ),
                              horizontalSpace(10.w),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'prizePool'.tr,
                                    style: globalTextStyle2(
                                        fontSize: width > 500 ? 8.sp : 10.sp,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  verticalSpace(2.h),
                                  Text(
                                    tournament.prize == 0
                                        ? 'Free Entry'
                                        : '\$${tournament.prize}',
                                    textAlign: TextAlign.left,
                                    style: globalTextStyle(
                                        fontSize: width > 500 ? 12.sp : 14.sp,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ],
                          ))
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 10,
              left: 20.w,
              right: 20.w,
              child: Row(
                children: [
                  Text(
                    'joinfor'.tr,
                    style: globalTextStyle(
                        fontSize: AppSizing.isMobile(context) ? 10.sp : 8.sp,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    '\$${tournament.entryFee}',
                    style: globalTextStyle(
                        fontSize: AppSizing.isMobile(context) ? 10.sp : 8.sp,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            Positioned(
                bottom: 10.h,
                right: 15.w,
                child: SvgPicture.asset(
                  'assets/icons/cardright.svg',
                  height: 20.h,
                  width: 20.w,
                )),
          ],
        );
      },
    );
  }
}
