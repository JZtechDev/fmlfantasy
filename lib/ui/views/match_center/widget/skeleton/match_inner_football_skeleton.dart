import 'package:fmlfantasy/app/app_images/app_images.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/ui/components/skeleton.dart';
import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter_svg/svg.dart';

class MatchInnerFBSkeleton extends StatelessWidget {
  const MatchInnerFBSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      final maxWidth = constraints.maxWidth;
      return Skeleton(
        child: SingleChildScrollView(
          child: Column(children: [
            verticalSpace(10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(10.r),
                    border:
                        Border.all(color: AppColors.borderColor, width: 1.w),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 10.w, right: 10.w, top: 10.h, bottom: 10.h),
                    child: Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            maxLines: 2,
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                            'League',
                            style: globalTextStyle(
                                fontSize: 12.sp, fontWeight: FontWeight.w600),
                          ),
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
                              Text('00:00',
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
                      Text('Venue',
                          style: globalTextStyle2(
                              fontSize: maxWidth > 600 ? 8.sp : 12.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.navyBlue),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis),
                      verticalSpace(10.h),
                      Container(
                        padding: EdgeInsets.only(left: 15.w, right: 15.w),
                        height: 40.h,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(5.r),
                          border: Border.all(
                              color: AppColors.borderColor, width: 1.w),
                        ),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Score',
                                style: globalTextStyle2(
                                    fontSize: maxWidth > 600 ? 8.sp : 14.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.navyBlue),
                              ),
                              horizontalSpace(5.w),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 5.h,
                                    width: 5.w,
                                    decoration: BoxDecoration(
                                        color: AppColors.navyBlue,
                                        borderRadius:
                                            BorderRadius.circular(1.r)),
                                  ),
                                  verticalSpace(10.h),
                                  Container(
                                    height: 5.h,
                                    width: 5.w,
                                    decoration: BoxDecoration(
                                        color: AppColors.navyBlue,
                                        borderRadius:
                                            BorderRadius.circular(1.r)),
                                  ),
                                ],
                              ),
                              horizontalSpace(5.w),
                              Text(
                                'Score',
                                style: globalTextStyle2(
                                    fontSize: maxWidth > 600 ? 8.sp : 14.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.navyBlue),
                              ),
                            ]),
                      ),
                      verticalSpace(10.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.grey,
                                    borderRadius: BorderRadius.circular(5.r),
                                  ),
                                  height: 50.h,
                                  width: 54.w),
                              verticalSpace(5.h),
                              Text('Home Name',
                                  style: globalTextStyle(
                                      fontSize:
                                          maxWidth > 600 ? 10.sp : 12.sp)),
                            ],
                          ),
                          const VerticalDivider(
                            color: AppColors.borderColor,
                            width: 5,
                            indent: 0,
                            endIndent: 10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.grey,
                                    borderRadius: BorderRadius.circular(5.r),
                                  ),
                                  height: 50.h,
                                  width: 54.w),
                              verticalSpace(5.h),
                              Text('Away Name',
                                  style: globalTextStyle(
                                      fontSize:
                                          maxWidth > 600 ? 10.sp : 12.sp)),
                            ],
                          ),
                        ],
                      ),
                      verticalSpace(10.h),
                      Container(
                        padding: EdgeInsets.only(top: 5.h, bottom: 5.h),
                        alignment: Alignment.center,
                        width: Get.width,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(5.r),
                          border: Border.all(
                              color: AppColors.borderColor, width: 1.w),
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
                                        fontSize:
                                            maxWidth > 600 ? 10.sp : 12.sp,
                                        color: AppColors.navyBlue)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ]),
                  )),
            ),
            verticalSpace(10.h),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 15.w,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'topPlayers'.tr,
                    style: globalTextStyle(
                        fontSize: maxWidth > 350 ? 16.sp : 24.sp,
                        fontWeight: FontWeight.w600),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            //onTap: onPrevious,
                            child: Container(
                              height: 30.h,
                              width: 30.w,
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(5),
                              decoration: const BoxDecoration(
                                color: AppColors.white,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                          horizontalSpace(10.w),
                          Container(
                            height: 30.h,
                            width: 30.w,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(5),
                            decoration: const BoxDecoration(
                              color: AppColors.white,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            verticalSpace(20.h),
            CarouselSlider.builder(
              itemCount: 5,
              itemBuilder: (context, index, realIndex) {
                return Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                alignment: Alignment.center,
                                //  height: 55.h,
                                width: maxWidth > 600 ? 40.w : 60.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.r),
                                    color: AppColors.dark),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/publictournament.svg',
                                      // ignore: deprecated_member_use
                                      color: AppColors.white,
                                      height: 20.h,
                                      //width: 20.w,
                                    ),
                                    verticalSpace(5.h),
                                    Text(
                                      '00',
                                      style: globalTextStyle(
                                        color: AppColors.white,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              verticalSpace(2.h),
                              Container(
                                alignment: Alignment.center,
                                height: 30.h,
                                width: maxWidth > 600 ? 40.w : 60.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.r),
                                  color: AppColors.primary,
                                ),
                                child: Text(
                                  '00',
                                  style: globalTextStyle(
                                    color: AppColors.white,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              )
                            ],
                          ),
                          horizontalSpace(5.w),
                          Container(
                            height: 78.h,
                            width: maxWidth > 600 ? 120.w : 147.w,
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(5.r),
                            ),
                            child: Stack(
                                alignment: Alignment.topLeft,
                                clipBehavior: Clip.none,
                                fit: StackFit.passthrough,
                                children: [
                                  Positioned(
                                      top: -10,
                                      left: 0,
                                      right: 0,
                                      bottom: 0,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: AppColors.white,
                                          borderRadius:
                                              BorderRadius.circular(5.r),
                                        ),
                                      )),
                                ]),
                          ),
                        ],
                      ),
                      verticalSpace(5.h),
                      Text(
                        'playerName'.tr,
                        style: globalTextStyle(
                          fontSize: maxWidth > 350 ? 12.sp : 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'playerPosition'.tr,
                        style: globalTextStyle2(
                          fontSize: maxWidth > 350 ? 8.sp : 10.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textGray,
                        ),
                      ),
                      verticalSpace(15.h),
                      Container(
                        width: 209.w,
                        height: 40.h,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          border: Border.all(
                            color: AppColors.white,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(5.r),
                        ),
                      ),
                      verticalSpace(5.h),
                      SizedBox(
                        width: 250.w,
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          spacing: 5.w,
                          runSpacing: 5.h,
                          children: List.generate(
                              4,
                              (index) => Container(
                                    height: 67.h,
                                    width: maxWidth > 600 ? 80.w : 102.w,
                                    decoration: BoxDecoration(
                                        color: AppColors.white,
                                        borderRadius:
                                            BorderRadius.circular(2.5.r)),
                                  )),
                        ),
                      )
                    ],
                  ),
                );
              },
              options: CarouselOptions(
                aspectRatio: maxWidth > 600 ? 1.3 : 0.9,
                viewportFraction: maxWidth > 600 ? 0.5 : 0.65,
                scrollDirection: Axis.horizontal,
                enableInfiniteScroll: false,
                padEnds: false,
              ),
            )
          ]),
        ),
      );
    });
  }
}
