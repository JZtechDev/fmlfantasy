import 'package:fmlfantasy/app/app_images/app_images.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/ui/components/skeleton.dart';
import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter_svg/svg.dart';

class InnerMatchCenterSkeleton extends StatelessWidget {
  const InnerMatchCenterSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      final maxWidth = constraints.maxWidth;
      return Skeleton(
        child: SingleChildScrollView(
          child: Column(children: [
            Container(
              color: Colors.transparent,
              child: Padding(
                padding: EdgeInsets.only(
                    left: 15.w, right: 15.w, top: 20.h, bottom: 10.h),
                child: Column(
                  children: [
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
                              width: Get.width * 0.35,
                              decoration: BoxDecoration(
                                color: AppColors.grey,
                                borderRadius: BorderRadius.circular(5.r),
                              ),
                            ),
                            verticalSpace(5.h),
                            Container(
                              height: 50,
                              width: 50,
                              color: AppColors.grey,
                            ),
                            verticalSpace(5.h),
                            Text('Home Team',
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
                              width: Get.width * 0.35,
                              decoration: BoxDecoration(
                                color: AppColors.grey,
                                borderRadius: BorderRadius.circular(5.r),
                              ),
                            ),
                            verticalSpace(5.h),
                            Container(
                              height: 50,
                              width: 50,
                              color: AppColors.grey,
                            ),
                            verticalSpace(5.h),
                            Text('Away Team',
                                style: globalTextStyle(
                                    fontSize: maxWidth > 600 ? 12.sp : 14.sp)),
                          ],
                        ),
                      ],
                    ),
                    verticalSpace(10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: List.generate(5, (index) {
                              return Padding(
                                padding: EdgeInsets.only(left: 2.w, right: 2.w),
                                child: Container(
                                  height: 32.h,
                                  width: 25.w,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: AppColors.grey,
                                    borderRadius: BorderRadius.circular(5.r),
                                  ),
                                ),
                              );
                            })),
                        horizontalSpace(10.w),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: List.generate(5, (index) {
                              return Padding(
                                padding: EdgeInsets.only(left: 2.w, right: 2.w),
                                child: Container(
                                  height: 32.h,
                                  width: 25.w,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: AppColors.grey,
                                    borderRadius: BorderRadius.circular(5.r),
                                  ),
                                ),
                              );
                            })),
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
                              color: AppColors.borderColor, width: 1.w)),
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
                                  style: globalTextStyle(fontSize: 12.sp)),
                              Text('ABC',
                                  style: globalTextStyle2(fontSize: 12.sp)),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'topPlayers'.tr,
                    style: globalTextStyle(
                        fontSize: maxWidth > 600 ? 14.sp : 26.sp,
                        fontWeight: FontWeight.w600),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Row(
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
                            GestureDetector(
                              //onTap: onNext,
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
                          ],
                        ),
                      ],
                    ),
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
