import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fmlfantasy/app/app_sizings.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/config/global_instances.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/new_model/match_center_inner_new.dart';
import 'package:fmlfantasy/ui/helpers/replace_svg_with_png.dart';

class AmericanFootballPreview extends StatelessWidget {
  final MatchCenterInnerNew data;
  const AmericanFootballPreview({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      //   double maxWidth = constraints.maxWidth;
      return Container(
        decoration: const BoxDecoration(
          color: Color.fromRGBO(18, 96, 85, 1),
        ),
        child: Padding(
          padding:
              EdgeInsets.only(left: 10.w, right: 10.w, top: 10.h, bottom: 10.h),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      width: Get.width * 0.7,
                      child: Row(
                        children: [
                          SizedBox(
                            width: Get.width * 0.7,
                            child: Text(
                              maxLines: 1,
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.ellipsis,
                              data.competitionName,
                              style: globalTextStyle(
                                  fontSize: AppSizing.isMobile(context)
                                      ? 12.sp
                                      : 10.sp,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      )),
                  // Row(
                  //   children: [
                  //     Image.asset('assets/new_images/calender.png',
                  //         height: 15.h, width: 15.w),
                  //     horizontalSpace(10.w),
                  //     Text(
                  //         time != null
                  //             ? DateFormat('d MMM hh:mm a')
                  //                 .format(DateTime.parse(time!).toLocal())
                  //             : '',
                  //         style: globalTextStyle2(
                  //             fontSize: maxWidth > 600 ? 8.sp : 12.sp,
                  //             fontWeight: FontWeight.w600,
                  //             color: AppColors.white),
                  //         maxLines: 2,
                  //         overflow: TextOverflow.ellipsis),
                  //   ],
                  // )
                ],
              ),
              verticalSpace(20.h),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.customWhite,
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top: 10, bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                data.homeTeamImageUrl == null
                                    ? const SizedBox(
                                        height: 50,
                                        width: 100,
                                      )
                                    : data.homeTeamImageUrl.endsWith('.png')
                                        ? Image.network(
                                            data.homeTeamImageUrl,
                                            height: 45.h,
                                            width: 45.w,
                                          )
                                        : selectedSPort.value == 'CR'
                                            ? Image.network(
                                                replaceSvgWithPng(
                                                    data.homeTeamImageUrl),
                                                height: 45.h,
                                                width: 45.w,
                                              )
                                            : SvgPicture.network(
                                                data.homeTeamImageUrl,
                                                height: 30.h,
                                                width: 30.w,
                                              ),
                                horizontalSpace(10.w),
                                Container(
                                  width: Get.width * 0.22,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 12),
                                  decoration: BoxDecoration(
                                    color: AppColors.secondary,
                                    borderRadius: BorderRadius.circular(5.r),
                                  ),
                                  child: Column(
                                    children: [
                                      Text(data.homeScore.toString(),
                                          style: globalTextStyle(
                                              color: AppColors.darkGreen,
                                              fontWeight: FontWeight.w700,
                                              fontSize:
                                                  AppSizing.isMobile(context)
                                                      ? 14.sp
                                                      : 10.sp)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 15),
                            decoration: BoxDecoration(
                                color: AppColors.backgroud,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(5.w),
                                  bottomRight: Radius.circular(5.w),
                                )),
                            child: Text(data.homeTeamName.toString(),
                                style: globalTextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: AppSizing.isMobile(context)
                                        ? 10.sp
                                        : 8.sp)),
                          )
                        ],
                      ),
                    ),
                  ),
                  horizontalSpace(5.w),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.customWhite,
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top: 10, bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                data.awayTeamImageUrl == null
                                    ? const SizedBox(
                                        height: 50,
                                        width: 100,
                                      )
                                    : data.awayTeamImageUrl.endsWith('.png')
                                        ? Image.network(
                                            data.awayTeamImageUrl,
                                            height: 45.h,
                                            width: 45.w,
                                          )
                                        : selectedSPort.value == 'CR'
                                            ? Image.network(
                                                replaceSvgWithPng(
                                                    data.awayTeamImageUrl),
                                                height: 45.h,
                                                width: 45.w,
                                              )
                                            : SvgPicture.network(
                                                data.awayTeamImageUrl,
                                                height: 30.h,
                                                width: 30.w,
                                              ),
                                horizontalSpace(10.w),
                                Container(
                                  width: Get.width * 0.22,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 12),
                                  decoration: BoxDecoration(
                                    color: AppColors.secondary,
                                    borderRadius: BorderRadius.circular(5.r),
                                  ),
                                  child: Column(
                                    children: [
                                      Text(data.awayScore.toString(),
                                          style: globalTextStyle(
                                              color: AppColors.darkGreen,
                                              fontWeight: FontWeight.w700,
                                              fontSize:
                                                  AppSizing.isMobile(context)
                                                      ? 14.sp
                                                      : 10.sp)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 15),
                            decoration: BoxDecoration(
                                color: AppColors.backgroud,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(5.w),
                                  bottomRight: Radius.circular(5.w),
                                )),
                            child: Text(data.awayTeamName,
                                style: globalTextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: AppSizing.isMobile(context)
                                        ? 10.sp
                                        : 8.sp)),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
