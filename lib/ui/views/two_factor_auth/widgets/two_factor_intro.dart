import 'package:fmlfantasy/app/app_images/app_images.dart';
import 'package:fmlfantasy/app/app_sizings.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/ui/views/two_factor_auth/controllers/two_factor_auth_controller.dart';
import 'package:fmlfantasy/ui/views/two_factor_auth/two_factor_auth.dart';
import 'package:fmlfantasy/ui/widgets/primary_button.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/imports/imports.dart';

class TwoFactorIntro extends StatelessWidget {
  const TwoFactorIntro({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TwoFactorAuthController());
    return Scaffold(
      backgroundColor: AppColors.grey,
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.only(top: 100.h, left: 20.w, right: 20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 10.h,
          children: [
            Text('Your privacy is important'.tr,
                style: globalTextStyle(
                    fontSize: AppSizing.isMobile(context) ? 28.sp : 18.sp)),
            Text(
              'At Fantasy Bulls, we value you are in control of your data.'.tr,
              style: globalTextStyle(
                  fontSize: AppSizing.isMobile(context) ? 12.sp : 10.sp,
                  color: AppColors.textGray,
                  fontWeight: FontWeight.w400),
            ),
            Text(
              'Please confirm that you have read and acknowledged the conditions and information.'
                  .tr,
              style: globalTextStyle(
                  fontSize: AppSizing.isMobile(context) ? 12.sp : 10.sp,
                  color: AppColors.textGray,
                  fontWeight: FontWeight.w400),
            ),
            verticalSpace(30.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  CupertinoIcons.link,
                  color: AppColors.primary,
                  size: 15,
                ),
                Text(
                  'Data Privacy Declaration'.tr,
                  style: globalTextStyle(
                      fontSize: AppSizing.isMobile(context) ? 12.sp : 8.sp,
                      color: AppColors.primary),
                )
              ],
            ),
            verticalSpace(10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  CupertinoIcons.link,
                  color: AppColors.primary,
                  size: 15,
                ),
                Text(
                  'General Terms and Conditions'.tr,
                  style: globalTextStyle(
                      fontSize: AppSizing.isMobile(context) ? 12.sp : 8.sp,
                      color: AppColors.primary),
                )
              ],
            ),
            verticalSpace(10.h),
            GetBuilder<TwoFactorAuthController>(builder: (controller) {
              return Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      controller.toggleTerms();
                    },
                    child: Container(
                      alignment: Alignment.center,
                      //height: 16.h,
                      //width: 16.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.r),
                        border: Border.all(
                          color: AppColors.borderColor,
                          width: 1,
                        ),
                        color: controller.terms
                            ? AppColors.primary
                            : AppColors.white,
                      ),
                      child: Icon(
                        Icons.check,
                        color: AppColors.white,
                        size: 15.w,
                      ),
                    ),
                  ),
                  horizontalSpace(10.w),
                  SizedBox(
                    width: Get.width * 0.8,
                    child: RichText(
                      text: TextSpan(
                        style: globalTextStyle(
                          fontSize: 12.sp,
                          color: AppColors.textGray,
                          fontWeight: FontWeight.w500,
                        ),
                        children: [
                          TextSpan(
                            text:
                                'Yes, I want to join thousands of Fantasy Bulls users to receive emails with exclusive content. I have read and accepted the '
                                    .tr,
                            style: globalTextStyle(
                                fontSize:
                                    AppSizing.isMobile(context) ? 12.sp : 8.sp,
                                color: AppColors.textGray,
                                fontWeight: FontWeight.w500),
                          ),
                          TextSpan(
                              text: 'newsletter terms'.tr,
                              style: globalTextStyle(
                                fontSize:
                                    AppSizing.isMobile(context) ? 12.sp : 8.sp,
                                color: AppColors.primary,
                                fontWeight: FontWeight.w500,
                              )),
                        ],
                      ),
                    ),
                  )
                ],
              );
            }),
            verticalSpace(20),
            GetBuilder<TwoFactorAuthController>(builder: (context) {
              return PrimaryButton(
                  buttonText: 'Confirm'.tr,
                  onPressed: () {
                    showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: AppColors.white,
                        context: Get.context!,
                        builder: (BuildContext context) {
                          return Container(
                            padding: const EdgeInsets.all(20),
                            height: AppSizing.isMobile(context)
                                ? Get.height * 0.7
                                : Get.height * 0.55,
                            width: Get.width,
                            child: Column(
                              spacing: 10,
                              children: [
                                Image.asset(
                                  AppImages.introModalImage,
                                  height: 100,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Text(
                                    'Stay up to date via email, SMS, phone or mail.'
                                        .tr,
                                    style: globalTextStyle2(
                                        fontSize: AppSizing.isMobile(context)
                                            ? 18.sp
                                            : 12.sp),
                                  ),
                                ),
                                verticalSpace(20),
                                Text(
                                  'Would you like to be posted about latest features and developments? Even if you prefer not to receive any such communication, we would still need to contact you by email, text message, phone or mail for certain matters, for example account opening or closing, or in case of trade execution.'
                                      .tr,
                                  style: globalTextStyle(
                                      letterSpacing: 5,
                                      fontSize: AppSizing.isMobile(context)
                                          ? 12.sp
                                          : 8.sp,
                                      color: AppColors.textGray,
                                      fontWeight: FontWeight.w400),
                                ),
                                const Spacer(),
                                PrimaryButton(
                                    buttonText: 'Keep me updated'.tr,
                                    onPressed: () {
                                      Get.to(() => const TwoFactorAuth());
                                    },
                                    isEnabled: true),
                                verticalSpace(10),
                                Text(
                                  'No I am not interested'.tr,
                                  style: globalTextStyle2(
                                      fontSize: AppSizing.isMobile(context)
                                          ? 14.sp
                                          : 10.sp,
                                      color: AppColors.primary),
                                )
                              ],
                            ),
                          );
                        });
                  },
                  isEnabled: context.terms);
            })
          ],
        ),
      ),
    );
  }
}
