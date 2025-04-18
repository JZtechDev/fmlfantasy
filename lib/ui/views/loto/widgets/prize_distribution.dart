import 'package:fmlfantasy/app/app_images/app_images.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/ui/components/inner_appbar.dart';
import 'package:flutter_svg/svg.dart';

class PrizeDistribution extends StatelessWidget {
  const PrizeDistribution({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey,
      appBar: const AppBarInner(title: 'Prize Distribution'),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 15.w, right: 15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(15.h),
              Text(
                'prizeDistributionRule'.tr,
                style: globalTextStyle(
                    fontSize: 23.sp, fontWeight: FontWeight.w600),
              ),
              verticalSpace(10.h),
              Container(
                padding: EdgeInsets.only(
                    left: 15.w, right: 15.w, top: 10.h, bottom: 10.h),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(5.r),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'perDraw'.tr,
                      style: globalTextStyle(fontSize: 14.sp),
                    ),
                    ListTile(
                      dense: true,
                      contentPadding: const EdgeInsets.all(0),
                      titleAlignment: ListTileTitleAlignment.titleHeight,
                      minLeadingWidth: 0,
                      leading: const Icon(
                        Icons.circle,
                        color: AppColors.textGray,
                        size: 6,
                      ),
                      title: Transform.translate(
                        offset: const Offset(-8.5, 1),
                        child: Text(
                          'correctpredictionofmatchoutcome'.tr,
                          style: globalTextStyle2(
                              fontSize: 12.sp,
                              color: AppColors.textGray,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    ListTile(
                      dense: true,
                      contentPadding: const EdgeInsets.all(0),
                      titleAlignment: ListTileTitleAlignment.titleHeight,
                      minLeadingWidth: 0,
                      leading: const Icon(
                        Icons.circle,
                        color: AppColors.textGray,
                        size: 6,
                      ),
                      title: Transform.translate(
                        offset: const Offset(-8.5, 1),
                        child: Text(
                          'foreachpredictedcorrectrankof'.tr,
                          style: globalTextStyle2(
                              fontSize: 12.sp,
                              color: AppColors.textGray,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              verticalSpace(10.h),
              Container(
                padding: EdgeInsets.only(
                    left: 5.w, right: 5.w, top: 5.h, bottom: 5.h),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.r),
                    color: AppColors.white),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(
                              left: 10.w,
                              top: 20.h,
                              bottom: 20.h,
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.r),
                                color: AppColors.grey),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  AppImages.jackpotAward,
                                  height: 36.h,
                                  width: 36.w,
                                ),
                                horizontalSpace(10.w),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'jackpot'.tr,
                                      style: globalTextStyle2(
                                          fontSize: 14.sp,
                                          color: AppColors.textGray),
                                    ),
                                    Text(
                                      '100Points'.tr,
                                      style: globalTextStyle(fontSize: 16),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        horizontalSpace(5.w),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(
                              left: 10.w,
                              top: 20.h,
                              bottom: 10.h,
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.r),
                                color: AppColors.grey),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'prizeMoney'.tr,
                                  style: globalTextStyle2(
                                      fontSize: 14.sp,
                                      color: AppColors.textGray),
                                ),
                                Text(
                                  '100%',
                                  style: globalTextStyle(fontSize: 24),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    verticalSpace(5.h),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.r),
                        color: AppColors.grey,
                      ),
                      child: Text(
                        'ifyouhavegotalltheplayersright'.tr,
                        style: globalTextStyle2(
                            fontSize: 12.sp, color: AppColors.textGray),
                      ),
                    ),
                    verticalSpace(10.h),
                    Padding(
                      padding: EdgeInsets.only(left: 20.w, right: 20.w),
                      child: Text(
                        'ifjackpotishitThenthefull'.tr,
                        style: globalTextStyle(
                            fontSize: 12.sp,
                            color: AppColors.textGray,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
              verticalSpace(10.h),
              Container(
                padding: EdgeInsets.only(
                    left: 5.w, right: 5.w, top: 5.h, bottom: 5.h),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.r),
                    color: AppColors.white),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(
                              left: 10.w,
                              top: 20.h,
                              bottom: 20.h,
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.r),
                                color: AppColors.grey),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  AppImages.goldAward,
                                  height: 36.h,
                                  width: 36.w,
                                ),
                                horizontalSpace(10.w),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'gold'.tr,
                                      style: globalTextStyle2(
                                          fontSize: 12.sp,
                                          color: AppColors.textGray),
                                    ),
                                    Text(
                                      '90Points'.tr,
                                      style: globalTextStyle(fontSize: 16),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        horizontalSpace(5.w),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(
                              left: 10.w,
                              top: 20.h,
                              bottom: 10.h,
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.r),
                                color: AppColors.grey),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'prizeMoney'.tr,
                                  style: globalTextStyle2(
                                      fontSize: 14.sp,
                                      color: AppColors.textGray),
                                ),
                                Text(
                                  '70%',
                                  style: globalTextStyle(fontSize: 24),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    verticalSpace(5.h),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.r),
                        color: AppColors.grey,
                      ),
                      child: Text(
                        'Ifyourscoreis90DMPpointsorabove'.tr,
                        style: globalTextStyle2(
                            fontSize: 12.sp, color: AppColors.textGray),
                      ),
                    ),
                  ],
                ),
              ),
              verticalSpace(10.h),
              Container(
                padding: EdgeInsets.only(
                    left: 5.w, right: 5.w, top: 5.h, bottom: 5.h),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.r),
                    color: AppColors.white),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(
                              left: 10.w,
                              top: 20.h,
                              bottom: 20.h,
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.r),
                                color: AppColors.grey),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  AppImages.silverAward,
                                  height: 36.h,
                                  width: 36.w,
                                ),
                                horizontalSpace(10.w),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Silver'.tr,
                                      style: globalTextStyle2(
                                          fontSize: 12.sp,
                                          color: AppColors.textGray),
                                    ),
                                    Text(
                                      '80Points'.tr,
                                      style: globalTextStyle(fontSize: 16),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        horizontalSpace(5.w),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(
                              left: 10.w,
                              top: 20.h,
                              bottom: 10.h,
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.r),
                                color: AppColors.grey),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'prizeMoney'.tr,
                                  style: globalTextStyle2(
                                      fontSize: 14.sp,
                                      color: AppColors.textGray),
                                ),
                                Text(
                                  '20%',
                                  style: globalTextStyle(fontSize: 24),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    verticalSpace(5.h),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.r),
                        color: AppColors.grey,
                      ),
                      child: Text(
                        'Ifyourscoreis80DMPpointsorabove'.tr,
                        style: globalTextStyle2(
                            fontSize: 12.sp, color: AppColors.textGray),
                      ),
                    ),
                  ],
                ),
              ),
              verticalSpace(10.h),
              Container(
                padding: EdgeInsets.only(
                    left: 5.w, right: 5.w, top: 5.h, bottom: 5.h),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.r),
                    color: AppColors.white),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(
                              left: 10.w,
                              top: 20.h,
                              bottom: 20.h,
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.r),
                                color: AppColors.grey),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  AppImages.bronzeAward,
                                  height: 36.h,
                                  width: 36.w,
                                ),
                                horizontalSpace(10.w),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'bronze'.tr,
                                      style: globalTextStyle2(
                                          fontSize: 12.sp,
                                          color: AppColors.textGray),
                                    ),
                                    Text(
                                      '70Points'.tr,
                                      style: globalTextStyle(fontSize: 16),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        horizontalSpace(5.w),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(
                              left: 10.w,
                              top: 20.h,
                              bottom: 10.h,
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.r),
                                color: AppColors.grey),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'prizeMoney'.tr,
                                  style: globalTextStyle2(
                                      fontSize: 14.sp,
                                      color: AppColors.textGray),
                                ),
                                Text(
                                  '10%',
                                  style: globalTextStyle(fontSize: 24),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    verticalSpace(5.h),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.r),
                        color: AppColors.grey,
                      ),
                      child: Text(
                        'ifyourscoreis70DMPpoints'.tr,
                        style: globalTextStyle2(
                            fontSize: 12.sp, color: AppColors.textGray),
                      ),
                    ),
                  ],
                ),
              ),
              verticalSpace(10.h),
              Padding(
                padding: EdgeInsets.only(left: 20.w, right: 20.w),
                child: Text(
                  'ifmorethanoneuserwinstheJackpot'.tr,
                  style: globalTextStyle2(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textGray),
                ),
              ),
              verticalSpace(20.h),
            ],
          ),
        ),
      ),
    );
  }
}
