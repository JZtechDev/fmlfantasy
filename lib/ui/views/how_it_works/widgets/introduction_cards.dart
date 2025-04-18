import 'package:fmlfantasy/app/app_colors/app_colors.dart';
import 'package:fmlfantasy/app/app_images/app_images.dart';
import 'package:fmlfantasy/app/app_sizings.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/ui/helpers/commons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class IntroductionCards extends StatelessWidget {
  const IntroductionCards({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      double maxWidth = constraints.maxWidth;
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 20.h),
            child: Text(
              'howItWorks'.tr,
              style: globalTextStyle(
                  fontSize: AppSizing.isMobile(context) ? 21.sp : 16.sp),
            ),
          ),
          verticalSpace(20.h),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      //padding:const EdgeInsets.all(5),
                      height: Get.width > 600
                          ? Get.height * 0.37
                          : Get.height * 0.3,
                      //width: maxWidth > 600 ? Get.width * 0.47 : Get.width * 0.44,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.r),
                        color: AppColors.white,
                        border:
                            Border.all(color: AppColors.borderColor, width: 1),
                      ),

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            AppImages.chooseSports,
                            fit: BoxFit.fill,
                            //colorBlendMode: BlendMode.exclusion,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  textAlign: TextAlign.start,
                                  'chooseYourSports'.tr,
                                  style: globalTextStyle(
                                      fontSize: maxWidth > 600 ? 10.sp : 12.sp),
                                ),
                                //horizontalSpace(10.w),
                                Text(
                                  '01',
                                  style: globalTextStyle(
                                      fontSize: 31.sp, color: AppColors.grey),
                                )
                              ],
                            ),
                          ),
                          verticalSpace(10),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Text(
                              textAlign: TextAlign.start,
                              'Paragraph1'.tr,
                              style: globalTextStyle2(
                                  fontSize: maxWidth > 600 ? 8.sp : 10.sp,
                                  color: AppColors.textGray),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  horizontalSpace(5.w),
                  Expanded(
                    child: Container(
                      //padding: EdgeInsets.all(5),
                      height: Get.width > 600
                          ? Get.height * 0.37
                          : Get.height * 0.3,
                      //width: maxWidth > 600 ? Get.width * 0.47 : Get.width * 0.44,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.r),
                          color: AppColors.white,
                          border: Border.all(
                              color: AppColors.borderColor, width: 1)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            AppImages.draft,
                            //colorBlendMode: BlendMode.exclusion,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  textAlign: TextAlign.start,
                                  'draftYourTeam'.tr,
                                  style: globalTextStyle(
                                    fontSize: maxWidth > 600 ? 10.sp : 12.sp,
                                  ),
                                ),
                                Text(
                                  '02',
                                  style: globalTextStyle(
                                      fontSize: 31.sp, color: AppColors.grey),
                                )
                              ],
                            ),
                          ),
                          verticalSpace(10),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Text(
                              textAlign: TextAlign.start,
                              'Paragraph2'.tr,
                              style: globalTextStyle2(
                                  fontSize: maxWidth > 600 ? 8.sp : 10.sp,
                                  color: AppColors.textGray),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ]),
          ),
          verticalSpace(10.h),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      //padding: EdgeInsets.all(5),
                      height: Get.width > 600
                          ? Get.height * 0.37
                          : Get.height * 0.3,
                      //width: maxWidth > 600 ? Get.width * 0.47 : Get.width * 0.44,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.r),
                          color: AppColors.white,
                          border: Border.all(
                              color: AppColors.borderColor, width: 1)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            AppImages.win,
                            //colorBlendMode: BlendMode.exclusion,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  textAlign: TextAlign.start,
                                  'playScoreWin'.tr,
                                  style: globalTextStyle(
                                    fontSize: maxWidth > 600 ? 10.sp : 12.sp,
                                  ),
                                ),
                                Text(
                                  '03',
                                  style: globalTextStyle(
                                      fontSize: 31.sp, color: AppColors.grey),
                                )
                              ],
                            ),
                          ),
                          verticalSpace(10),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Text(
                              textAlign: TextAlign.start,
                              'Paragraph3'.tr,
                              style: globalTextStyle2(
                                  fontSize: maxWidth > 600 ? 8.sp : 10.sp,
                                  color: AppColors.textGray),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  horizontalSpace(5.w),
                  Expanded(
                    child: Container(
                      //padding: EdgeInsets.all(5),
                      height: Get.width > 600
                          ? Get.height * 0.37
                          : Get.height * 0.3,
                      //width: maxWidth > 600 ? Get.width * 0.47 : Get.width * 0.44,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.r),
                        color: AppColors.white,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            AppImages.chooseSports,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  textAlign: TextAlign.start,
                                  'cashInYourPrize'.tr,
                                  style: globalTextStyle(
                                    fontSize: maxWidth > 600 ? 10.sp : 12.sp,
                                  ),
                                ),
                                Text(
                                  '04',
                                  style: globalTextStyle(
                                      fontSize: 31.sp, color: AppColors.grey),
                                )
                              ],
                            ),
                          ),
                          verticalSpace(10),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Text(
                              textAlign: TextAlign.start,
                              'Paragraph4'.tr,
                              style: globalTextStyle2(
                                  fontSize: maxWidth > 600 ? 8.sp : 10.sp,
                                  color: AppColors.textGray),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ]),
          ),
        ],
      );
    });
  }
}
