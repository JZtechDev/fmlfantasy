import 'package:fmlfantasy/app/app_colors/app_colors.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/model/match_center_model.dart';
import 'package:fmlfantasy/ui/helpers/commons.dart';
import 'package:fmlfantasy/ui/helpers/replace_svg_with_png.dart';
import 'package:fmlfantasy/ui/views/match_center/controller/match_center_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class MatchCenterTiles extends GetView<MatchCenterController> {
  final MatchCenterModel data;
  const MatchCenterTiles({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    Get.put(MatchCenterController());
    return LayoutBuilder(builder: (context, constraints) {
      double maxWidth = constraints.maxWidth;
      return Column(
        children: [
          Container(
            width: Get.width,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(5.r),
            ),
            child: Padding(
              padding: EdgeInsets.only(top: 5.h, left: 5.w, right: 5.w),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.grey,
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: 5.h, left: 5.w, right: 5.w, bottom: 5.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                  padding: EdgeInsets.all(10.w),
                                  height: maxWidth > 600 ? 55.h : 60.h,
                                  width: maxWidth > 600 ? 55.w : 60.w,
                                  decoration: BoxDecoration(
                                      color: AppColors.white,
                                      borderRadius:
                                          BorderRadius.circular(8.33.r)),
                                  child: data.teams?.isNotEmpty == true &&
                                          data.teams?[0].imageUrl != null
                                      ? data.teams![0].imageUrl!.endsWith('svg')
                                          ? controller.selectedSport.value ==
                                                  'CR'
                                              ? Image.network(replaceSvgWithPng(
                                                  data.teams![0].imageUrl!))
                                              : SvgPicture.network(
                                                  data.teams![0].imageUrl!,
                                                  height: maxWidth > 600
                                                      ? 40.h
                                                      : 36.28.h,
                                                  width: maxWidth > 600
                                                      ? 50.w
                                                      : 47.72.w,
                                                  fit: BoxFit.contain,
                                                )
                                          : Image.network(
                                              data.teams![0].imageUrl!,
                                            )
                                      : Container()),
                              horizontalSpace(10.w),
                              Text(
                                data.teams?.isNotEmpty == true &&
                                        data.teams?[0].name != null
                                    ? data.teams![0].name!.split(' ').join('\n')
                                    : '',
                                style: globalTextStyle2(
                                    fontSize: maxWidth > 600 ? 10.sp : 12.sp,
                                    color: AppColors.dark,
                                    fontWeight: FontWeight.w500),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                          Row(children: [
                            Text(
                              textAlign: TextAlign.end,
                              data.teams?.length == 2 &&
                                      data.teams?[1].name != null
                                  ? data.teams![1].name!.split(' ').join('\n')
                                  : '',
                              style: globalTextStyle2(
                                  fontSize: maxWidth > 600 ? 10.sp : 12.sp,
                                  color: AppColors.dark,
                                  fontWeight: FontWeight.w500),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            horizontalSpace(10.w),
                            Container(
                                padding: EdgeInsets.all(10.w),
                                height: maxWidth > 600 ? 55.h : 60.h,
                                width: maxWidth > 600 ? 55.w : 60.w,
                                decoration: BoxDecoration(
                                    color: AppColors.white,
                                    borderRadius:
                                        BorderRadius.circular(8.33.r)),
                                child: data.teams?.length == 2 &&
                                        data.teams?[1].imageUrl != null
                                    ? data.teams![1].imageUrl!.endsWith('svg')
                                        ? controller.selectedSport.value == 'CR'
                                            ? Image.network(
                                                replaceSvgWithPng(
                                                    data.teams![1].imageUrl!),
                                                height: maxWidth > 600
                                                    ? 40.h
                                                    : 36.28.h,
                                                width: maxWidth > 600
                                                    ? 50.w
                                                    : 47.72.w,
                                                fit: BoxFit.contain,
                                              )
                                            : SvgPicture.network(
                                                data.teams![1].imageUrl!,
                                              )
                                        : Image.network(
                                            data.teams![1].imageUrl!,
                                          )
                                    : Container()),
                          ])
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: 5.h, left: 5.w, right: 5.w, bottom: 5.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(data.competitionName ?? '',
                            style: globalTextStyle2(
                                fontSize: maxWidth > 600 ? 8.sp : 10.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.textGray),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis),
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/icons/clock.svg',
                              // ignore: deprecated_member_use
                              color: Colors.red,
                              height: 16.h,
                              width: 16.w,
                            ),
                            horizontalSpace(5.w),
                            Text(
                                data.validAt != null
                                    ? DateFormat('d MMM hh:mm a').format(
                                        DateTime.parse(data.start!).toLocal())
                                    : '',
                                style: globalTextStyle2(
                                    fontSize: maxWidth > 600 ? 8.sp : 10.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.red),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          verticalSpace(5.h),
        ],
      );
    });
  }
}
