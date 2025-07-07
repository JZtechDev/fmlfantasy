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
      backgroundColor: Color.fromRGBO(44, 86, 80, 1),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.only(top: 70.h, left: 20.w, right: 20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 10.h,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Image.asset(
                AppImages.logo,
                height: AppSizing.isMobile(context) ? 50.h : 40.h,
              ),
            ),
            Text('We respect your Privacy.'.tr,
                style: globalTextStyle(
                    fontSize: AppSizing.isMobile(context) ? 18.sp : 18.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.white)),
            Text(
              'At Fantasy Bulls, we value you are in control of your data.'.tr,
              style: globalTextStyle(
                  fontSize: AppSizing.isMobile(context) ? 12.sp : 10.sp,
                  color: AppColors.white,
                  fontWeight: FontWeight.w600),
            ),
            Text(
              'Please confirm that you have read and acknowledged the conditions and information.'
                  .tr,
              style: globalTextStyle(
                  fontSize: AppSizing.isMobile(context) ? 12.sp : 10.sp,
                  color: AppColors.white,
                  fontWeight: FontWeight.w600),
            ),
            verticalSpace(30.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  CupertinoIcons.link,
                  color: AppColors.secondary,
                  size: 15,
                ),
                Text(
                  'Data Privacy Declaration'.tr,
                  style: globalTextStyle(
                      fontSize: AppSizing.isMobile(context) ? 12.sp : 8.sp,
                      color: AppColors.secondary),
                )
              ],
            ),
            verticalSpace(10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  CupertinoIcons.link,
                  color: AppColors.secondary,
                  size: 15,
                ),
                Text(
                  'General Terms and Conditions'.tr,
                  style: globalTextStyle(
                      fontSize: AppSizing.isMobile(context) ? 12.sp : 8.sp,
                      color: AppColors.secondary),
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
                                color: AppColors.white,
                                fontWeight: FontWeight.w600),
                          ),
                          TextSpan(
                            text: 'newsletter terms'.tr,
                            style: globalTextStyle(
                                fontSize:
                                    AppSizing.isMobile(context) ? 12.sp : 8.sp,
                                color: AppColors.secondary,
                                fontWeight: FontWeight.w600),
                          ),
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
                        backgroundColor: AppColors.darkGreen,
                        context: Get.context!,
                        builder: (BuildContext context) {
                          return Container(
                            padding: const EdgeInsets.all(20),
                            height: AppSizing.isMobile(context)
                                ? Get.height * 0.55
                                : Get.height * 0.55,
                            width: Get.width,
                            child: Column(
                              spacing: 10,
                              children: [
                                verticalSpace(30),
                                Image.asset(
                                  'assets/logo/notification-white.png',
                                  height: 50,
                                ),
                                verticalSpace(20),
                                Text(
                                  'Would you like to be posted about latest features and developments? Even if you prefer not to receive any such communication, we would still need to contact you by email, text message, phone or mail for certain matters, for example account opening or closing, or in case of trade execution.'
                                      .tr,
                                  style: globalTextStyle(
                                      letterSpacing: 5,
                                      fontSize: AppSizing.isMobile(context)
                                          ? 14.sp
                                          : 8.sp,
                                      color: AppColors.white,
                                      fontWeight: FontWeight.w500),
                                ),
                                const Spacer(),
                                PrimaryButton(
                                    buttonText: 'Keep me updated'.tr,
                                    onPressed: () {
                                      Get.to(() => const TwoFactorAuth());
                                    },
                                    isEnabled: true),
                                PrimaryButton(
                                    backgroundColor: AppColors.darkGreen,
                                    borderColor: AppColors.secondary,
                                    textColor: AppColors.secondary,
                                    buttonText: 'No I am not interested'.tr,
                                    onPressed: () {
                                      Get.to(() => const TwoFactorAuth());
                                    },
                                    isEnabled: true),
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
