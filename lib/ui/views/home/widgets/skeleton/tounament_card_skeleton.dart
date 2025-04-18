import 'package:fmlfantasy/app/app_colors/app_colors.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/ui/components/skeleton.dart';
import 'package:fmlfantasy/ui/helpers/commons.dart';
import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class TournamentCardSkeleton extends StatelessWidget {
  const TournamentCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      double maxWidth = constraints.maxWidth;
      return CarouselSlider.builder(
        itemCount: 3,
        itemBuilder: (context, index, realIndex) {
          return Skeleton(
            child: Stack(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  padding: EdgeInsets.only(
                      top: 10.h, left: 20.w, right: 20.w, bottom: 20.h),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.borderColor),
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: maxWidth > 600 ? 23.h : 25.h,
                            width: maxWidth > 600 ? 23.w : 25.w,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: maxWidth > 600
                                ? Get.width * 0.5
                                : Get.width * 0.6,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  height: maxWidth > 600 ? 23.h : 25.h,
                                  width: maxWidth > 600 ? 23.w : 25.w,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                  ),
                                ),
                                horizontalSpace(10.w),
                                Container(
                                  height: maxWidth > 600 ? 23.h : 25.h,
                                  width: maxWidth > 600 ? 23.w : 25.w,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      verticalSpace(10.h),
                      Text(
                        'home',
                        style: globalTextStyle(
                            fontSize: maxWidth > 600 ? 12.sp : 14.sp,
                            fontWeight: FontWeight.w600),
                      ),
                      verticalSpace(5.h),
                      Text(
                        'away',
                        style: globalTextStyle(
                            fontSize: maxWidth > 600 ? 12.sp : 14.sp,
                            fontWeight: FontWeight.w600),
                      ),
                      verticalSpace(10.h),
                      SizedBox(
                        width: Get.width * 0.4,
                        child: Row(
                          children: [
                            SvgPicture.asset(
                                'assets/icons/publictournament.svg'),
                            horizontalSpace(10.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Prize Pool',
                                  style: globalTextStyle(
                                      fontSize: maxWidth > 600 ? 10.sp : 12.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  '00',
                                  textAlign: TextAlign.left,
                                  style: globalTextStyle(
                                      fontSize: maxWidth > 600 ? 10.sp : 12.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // Align(
                //   alignment: Alignment.bottomRight,
                //   child: Image.asset('assets/images/home.png',
                //       height: maxWidth > 600 ? 98.h : 100.h),
                // ),
                // Positioned(
                //   bottom: 0,
                //   right: 70.w,
                //   child: Image.asset('assets/images/away.png',
                //       height: maxWidth > 600 ? 98.h : 100.h),
                // ),
              ],
            ),
          );
        },
        options: CarouselOptions(
          padEnds: false,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          aspectRatio: maxWidth > 600 ? 17 / 7 : 17 / 9,
          viewportFraction: maxWidth > 600 ? 0.7 : 0.9,
          initialPage: 0,
          disableCenter: true,
          enableInfiniteScroll: false,
          reverse: false,
          autoPlay: false,
          enlargeCenterPage: false,
          scrollDirection: Axis.horizontal,
        ),
      );
    });
  }
}
