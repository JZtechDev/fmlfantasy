import 'dart:developer';

import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/ui/views/authentication/controller/resgister_controller.dart';
import 'package:fmlfantasy/ui/widgets/primary_button.dart';
import 'package:pinput/pinput.dart';

class VerifyNumberOtp extends StatelessWidget {
  const VerifyNumberOtp({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ResgisterController>();
    return Dialog(
      insetAnimationCurve: Curves.easeInOutCubicEmphasized,
      insetAnimationDuration: const Duration(seconds: 3),
      backgroundColor: AppColors.white,
      surfaceTintColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0.r),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: 10.w,
          right: 10.w,
          bottom: 15.h,
          top: 15.h,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.r),
                color: AppColors.grey,
                border: Border.all(color: AppColors.borderColor, width: 1),
              ),
              padding: EdgeInsets.only(
                  left: 10.w, right: 10.w, top: 5.h, bottom: 5.h),
              child: Text(
                "Verify Number".tr,
                style: globalTextStyle(
                    fontSize: 16.sp, fontWeight: FontWeight.w600),
              ),
            ),
            verticalSpace(10.h),
            Column(
              children: [
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: globalTextStyle2(
                        fontSize: 12.sp, color: AppColors.textGray),
                    children: [
                      TextSpan(
                          text: 'An OTP is sent to your Email'.tr,
                          style: globalTextStyle2(
                              fontSize: 12.sp, color: AppColors.textGray)),
                      TextSpan(
                        text: controller.phoneController.text,
                        style: globalTextStyle2(
                            fontSize: 12.sp,
                            color: AppColors
                                .primary), // Use a different color for the email
                      ),
                      TextSpan(
                          text: 'Please enter the OTP to continue'.tr,
                          style: globalTextStyle2(
                              fontSize: 12.sp, color: AppColors.textGray)),
                    ],
                  ),
                ),
                verticalSpace(10.h),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(left: 15.w, right: 15.w),
                    child: Pinput(
                      length: 6,
                      showCursor: true,
                      controller: controller.otpController,
                      keyboardType: TextInputType.number,
                      focusNode: controller.focusNode,
                      enabled: true,
                      defaultPinTheme: controller.defaultPinTheme.copyWith(
                          decoration: BoxDecoration(
                              color: AppColors.grey,
                              border: Border.all(
                                  color: AppColors.borderColor, width: 1.w),
                              borderRadius: BorderRadius.circular(5.r))),
                      separatorBuilder: (index) => Container(
                        width: 5.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.r),
                          border: Border.all(
                              color: AppColors.borderColor, width: 1.w),
                        ),
                      ),
                      hapticFeedbackType: HapticFeedbackType.lightImpact,
                      onCompleted: (pin) {
                        debugPrint('onCompleted: $pin');
                      },
                      onChanged: (value) {
                        debugPrint('onChanged: $value');
                      },
                      cursor: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                left: 10.w,
                                right: 10.w,
                                bottom: 13.h,
                                top: 10.h),
                            width: 1.w,
                            height: 30.h,
                            decoration: BoxDecoration(
                                color: AppColors.dark.withValues(alpha: 0.5),
                                borderRadius: BorderRadius.circular(5.r)),
                          ),
                        ],
                      ),
                      focusedPinTheme: controller.defaultPinTheme.copyWith(
                        decoration:
                            controller.defaultPinTheme.decoration!.copyWith(
                          borderRadius: BorderRadius.circular(5.r),
                          color: AppColors.grey,
                          border:
                              Border.all(color: controller.focusedBorderColor),
                        ),
                      ),
                      submittedPinTheme: controller.defaultPinTheme.copyWith(
                        decoration:
                            controller.defaultPinTheme.decoration!.copyWith(
                          color: AppColors.grey,
                          borderRadius: BorderRadius.circular(5.r),
                          border: Border.all(
                              color: AppColors.white.withValues(alpha: 0.5)),
                        ),
                      ),
                      errorPinTheme: controller.defaultPinTheme.copyBorderWith(
                        border: Border.all(color: Colors.redAccent),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a valid OTP'.tr;
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                verticalSpace(10.h),
                Obx(() {
                  return controller.resenOtp.value == true
                      ? Column(
                          children: [
                            Text(
                              'Did not receive the OTP?'.tr,
                              style: globalTextStyle2(
                                  fontSize: 12.sp, color: AppColors.textGray),
                            ),
                            Obx(
                              () => RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Request New one in'.tr,
                                      style: globalTextStyle2(
                                          fontSize: 12.sp,
                                          color: AppColors.textGray),
                                    ),
                                    TextSpan(
                                      text:
                                          controller.countdown.value.toString(),
                                      style: globalTextStyle2(
                                          fontSize: 12.sp,
                                          color: AppColors.dark,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        )
                      : Container();
                }),
                verticalSpace(10.h),
                Column(
                  children: [
                    Obx(
                      () {
                        return controller.resenOtp.value == false
                            ? PrimaryButton(
                                buttonText: 'Resend'.tr,
                                onPressed: () {
                                  controller.resendOTP();
                                },
                                isEnabled: true,
                                backgroundColor: AppColors.grey,
                                textColor: AppColors.dark,
                              )
                            : Container();
                      },
                    ),
                    verticalSpace(10.h),
                    PrimaryButton(
                        buttonText: 'Submit'.tr,
                        onPressed: () {
                          log(controller.otpController.text);
                          controller.verifyNumber();
                        },
                        isEnabled: true),
                    verticalSpace(10.h),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Facing Issue?'.tr,
                            style: globalTextStyle2(
                                fontSize: 12.sp, color: AppColors.textGray),
                          ),
                          TextSpan(
                            text: 'Contact us'.tr,
                            style: globalTextStyle2(
                                fontSize: 12.sp,
                                color: AppColors.dark,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
