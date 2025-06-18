import 'package:fmlfantasy/app/app_colors/app_colors.dart';
import 'package:fmlfantasy/app/app_sizings.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/ui/helpers/commons.dart';
import 'package:fmlfantasy/ui/helpers/replace_svg_with_png.dart';
import 'package:fmlfantasy/ui/views/home/controller/home_controller.dart';
import 'package:fmlfantasy/ui/views/match_fixtures/controller/match_fixtures_controller.dart';
import 'package:flutter/material.dart';
import 'package:fmlfantasy/model/tournament_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class FixturesCard extends GetView<MatchFixturesController> {
  final Tournaments tournament;
  const FixturesCard({super.key, required this.tournament});

  String formatEndDateTime(DateTime endDate) {
    final DateTime now = DateTime.now();
    if (endDate.isBefore(now)) {
      return 'Ended';
    }
    return DateFormat('dd MMM yyyy, hh:mm a').format(endDate.toLocal());
  }

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    final DateTime endDate = DateTime.parse(tournament.startDate.toString());
    final String formattedDateTime = formatEndDateTime(endDate);
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          clipBehavior: Clip.hardEdge,
          margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(
                    top: 10.h, left: 10.w, right: 10.w, bottom: 10.h),
                decoration: BoxDecoration(
                  color: AppColors.primaryVeryDark,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5.r),
                    topRight: Radius.circular(5.r),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      color: AppColors.secondary,
                      'assets/new_images/calender.png',
                      height: 24.h,
                      width: 24.w,
                    ),
                    horizontalSpace(10.w),
                    Text(
                      formattedDateTime,
                      style: globalTextStyle(
                          fontSize: AppSizing.isMobile(context) ? 14.sp : 12.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.secondary),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: 10, right: 10, bottom: 20.h, top: 20.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Container(
                          constraints: BoxConstraints(
                            maxHeight: 27.h,
                            minHeight: 27.h,
                            maxWidth: 35.w,
                            minWidth: 35.w,
                          ),
                          child: tournament.matches![0].homeImageUrl!
                                  .endsWith('svg')
                              ? controller.selectedSport.value == 'CR' ||
                                      controller.selectedSport.value == 'FB'
                                  ? Image.network(
                                      replaceSvgWithPng(tournament
                                          .matches![0].homeImageUrl
                                          .toString()),
                                      fit: BoxFit.fill,
                                    )
                                  : SvgPicture.network(
                                      tournament.matches![0].homeImageUrl
                                          .toString(),
                                      fit: BoxFit.fill,
                                    )
                              : Image.network(
                                  tournament.matches![0].homeImageUrl
                                      .toString(),
                                  fit: BoxFit.fill,
                                ),
                        ),
                        verticalSpace(10.h),
                        Text(
                          textAlign: TextAlign.start,
                          tournament.matches![0].home.toString(),
                          style: globalTextStyle(
                              color: AppColors.secondary,
                              fontSize:
                                  AppSizing.isMobile(context) ? 14.sp : 12.sp,
                              fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10.h),
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                          color: AppColors.backgroud, shape: BoxShape.circle),
                      child: Text(
                        'vs',
                        style: globalTextStyle2(
                            fontWeight: FontWeight.w700,
                            fontSize: 12.sp,
                            color: AppColors.secondary),
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                            constraints: BoxConstraints(
                              maxHeight: 27.h,
                              minHeight: 27.h,
                              maxWidth: 35.w,
                              minWidth: 35.w,
                            ),
                            child: tournament.matches![0].awayImageUrl!
                                    .endsWith('svg')
                                ? controller.selectedSport.value == 'CR' ||
                                        controller.selectedSport.value == 'FB'
                                    ? Image.network(
                                        replaceSvgWithPng(tournament
                                            .matches![0].awayImageUrl
                                            .toString()),
                                        fit: BoxFit.fill,
                                      )
                                    : SvgPicture.network(
                                        tournament.matches![0].awayImageUrl!,
                                        fit: BoxFit.fill,
                                      )
                                : Image.network(
                                    tournament.matches![0].awayImageUrl!,
                                    fit: BoxFit.fill,
                                  )),
                        verticalSpace(10.h),
                        Text(
                          textAlign: TextAlign.start,
                          tournament.matches![0].away.toString(),
                          style: globalTextStyle(
                              color: AppColors.secondary,
                              fontSize:
                                  AppSizing.isMobile(context) ? 14.sp : 12.sp,
                              fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                  ],
                ),
              )
              // Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              //   Container(
              //     constraints: BoxConstraints(
              //       maxHeight: 27.h,
              //       minHeight: 27.h,
              //       maxWidth: 35.w,
              //       minWidth: 35.w,
              //     ),
              //     child: tournament.matches![0].homeImageUrl!.endsWith('svg')
              //         ? controller.selectedSport.value == 'CR' ||
              //                 controller.selectedSport.value == 'FB'
              //             ? Image.network(
              //                 replaceSvgWithPng(tournament
              //                     .matches![0].homeImageUrl
              //                     .toString()),
              //                 fit: BoxFit.fill,
              //               )
              //             : SvgPicture.network(
              //                 tournament.matches![0].homeImageUrl.toString(),
              //                 fit: BoxFit.fill,
              //               )
              //         : Image.network(
              //             tournament.matches![0].homeImageUrl.toString(),
              //             fit: BoxFit.fill,
              //           ),
              //   ),
              //   horizontalSpace(10.w),
              //   Container(
              //       constraints: BoxConstraints(
              //         maxHeight: 27.h,
              //         minHeight: 27.h,
              //         maxWidth: 35.w,
              //         minWidth: 35.w,
              //       ),
              //       child: tournament.matches![0].awayImageUrl!.endsWith('svg')
              //           ? controller.selectedSport.value == 'CR' ||
              //                   controller.selectedSport.value == 'FB'
              //               ? Image.network(
              //                   replaceSvgWithPng(tournament
              //                       .matches![0].awayImageUrl
              //                       .toString()),
              //                   fit: BoxFit.fill,
              //                 )
              //               : SvgPicture.network(
              //                   tournament.matches![0].awayImageUrl!,
              //                   fit: BoxFit.fill,
              //                 )
              //           : Image.network(
              //               tournament.matches![0].awayImageUrl!,
              //               fit: BoxFit.fill,
              //             )),
              // ]),
              // verticalSpace(30.h),
              // Text(
              //   textAlign: TextAlign.start,
              //   tournament.name.toString().split('vs ').join('\n'),
              //   style: globalTextStyle(
              //       fontSize: width > 500 ? 10.sp : 14.sp,
              //       fontWeight: FontWeight.w600),
              // ),
            ],
          ),
        );
      },
    );
  }
}
