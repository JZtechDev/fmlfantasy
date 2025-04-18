import 'package:fmlfantasy/app/app_images/app_images.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/ui/components/skeleton.dart';
import 'package:fmlfantasy/ui/widgets/primary_button.dart';
import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter_svg/svg.dart';

class MatchInnerCRSkeleton extends StatelessWidget {
  const MatchInnerCRSkeleton({super.key});

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
              padding: EdgeInsets.only(
                left: 10.w,
                right: 10.w,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(color: AppColors.borderColor, width: 1.w),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 10.w,
                    right: 10.w,
                    top: 10.h,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              width: Get.width * 0.4,
                              child: Text(
                                'League',
                                style: globalTextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600),
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
                      verticalSpace(20.h),
                      SizedBox(
                        height: Get.height * 0.2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: Get.width * 0.43,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  verticalSpace(5.h),
                                  Text('homeName',
                                      style: globalTextStyle(
                                          fontSize:
                                              maxWidth > 600 ? 12.sp : 14.sp)),
                                  verticalSpace(10.h),
                                  Text('score',
                                      style: globalTextStyle(
                                          fontSize:
                                              maxWidth > 600 ? 12.sp : 20.sp)),
                                  Text('overs',
                                      style: globalTextStyle(
                                          fontSize:
                                              maxWidth > 600 ? 12.sp : 12.sp)),
                                ],
                              ),
                            ),
                            const VerticalDivider(
                              color: AppColors.borderColor,
                              width: 2,
                              indent: 0,
                              endIndent: 10,
                            ),
                            SizedBox(
                              width: Get.width * 0.43,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  verticalSpace(5.h),
                                  Text('awayName',
                                      textAlign: TextAlign.center,
                                      style: globalTextStyle(
                                          fontSize:
                                              maxWidth > 600 ? 12.sp : 14.sp)),
                                  verticalSpace(10.h),
                                  Text('Score',
                                      style: globalTextStyle(
                                          fontSize:
                                              maxWidth > 600 ? 12.sp : 20.sp)),
                                  Text('overs',
                                      style: globalTextStyle(
                                          fontSize:
                                              maxWidth > 600 ? 12.sp : 12.sp)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      verticalSpace(5.h),
                      Container(
                        padding: EdgeInsets.only(top: 5.h, bottom: 5.h),
                        alignment: Alignment.center,
                        width: Get.width,
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(5.r),
                            border: Border.all(
                                color: AppColors.borderColor, width: 1)),
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
                                Text('ABC',
                                    style: globalTextStyle2(
                                        fontSize: maxWidth > 600 ? 8.sp : 10.sp,
                                        color: AppColors.navyBlue)),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.h),
                        child: PrimaryButton(
                          buttonText: 'viewInnings'.tr,
                          onPressed: () {},
                          isEnabled: true,
                          padding: 0,
                          backgroundColor: Colors.transparent,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
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
                    'ttopPlayers'.tr,
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
