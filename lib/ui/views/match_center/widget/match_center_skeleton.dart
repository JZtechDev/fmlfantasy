import 'package:fmlfantasy/app/app_colors/app_colors.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/ui/helpers/commons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class MatchCenterSkeleton extends StatelessWidget {
  const MatchCenterSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15.w, right: 15.w),
      child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: 10,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[200]!,
              child: Column(
                children: [
                  Container(
                    width: Get.width,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(5.r),
                      border:
                          Border.all(color: AppColors.borderColor, width: 1),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(top: 5.h, left: 5.w, right: 5.w),
                      child: Column(
                        children: [
                          Container(
                            height: 60.h,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(5.r),
                              border: Border.all(
                                  color: AppColors.borderColor, width: 1),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: 5.h, left: 5.w, right: 5.w, bottom: 5.h),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                          height: 60.h,
                                          width: 60.w,
                                          padding: const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      8.33.r)),
                                          child: Container(
                                            color: Colors.white,
                                            height: 30,
                                            width: 30,
                                          )),
                                      horizontalSpace(10.w),
                                      Text(
                                        'Home',
                                        style: globalTextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w500),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Away',
                                        style: globalTextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      horizontalSpace(10.w),
                                      Container(
                                          height: 60.h,
                                          width: 60.w,
                                          padding: const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            color: AppColors.textGray,
                                            borderRadius:
                                                BorderRadius.circular(8.33.r),
                                          ),
                                          child: Container(
                                            color: AppColors.textGray,
                                            height: 30,
                                            width: 30,
                                          )),
                                    ],
                                  ),
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
                                Text('MDA-LC-ABCD',
                                    style: globalTextStyle(
                                        fontSize: 10.sp,
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
                                    Text('0000-00-00',
                                        style: globalTextStyle(
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white),
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
              ),
            );
          }),
    );
  }
}
