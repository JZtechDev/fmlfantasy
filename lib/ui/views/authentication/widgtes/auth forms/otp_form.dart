import 'package:fmlfantasy/app/app_sizings.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/ui/views/authentication/controller/otp_controller.dart';
import 'package:pinput/pinput.dart';

class OtpForm extends GetView<OtpController> {
  const OtpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      double maxWidth = constraints.maxWidth;

      return Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 15.w, right: 15.w),
            child: Text(
              'Game On! Verify Playful Side'.tr,
              style: globalTextStyle(
                  fontSize: AppSizing.isMobile(context) ? 28.sp : 16.sp,
                  fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
          ),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: globalTextStyle2(
                  fontSize: AppSizing.isMobile(context) ? 12.sp : 8.sp,
                  color: AppColors.textGray),
              children: [
                TextSpan(
                    text: 'An OTP is sent to your Email'.tr,
                    style: globalTextStyle2(
                        fontSize: AppSizing.isMobile(context) ? 12.sp : 8.sp,
                        color: AppColors.textGray)),
                TextSpan(
                  text:
                      '${controller.email[0]}${controller.email[1]}${controller.email[2]}**********',
                  style: globalTextStyle2(
                      fontSize: AppSizing.isMobile(context) ? 12.sp : 8.sp,
                      color: AppColors
                          .primary), // Use a different color for the email
                ),
                TextSpan(
                    text: 'Please enter the OTP to continue'.tr,
                    style: globalTextStyle2(
                        fontSize: AppSizing.isMobile(context) ? 12.sp : 8.sp,
                        color: AppColors.textGray)),
              ],
            ),
          ),
          verticalSpace(40.h),
          Obx(
            () => controller.errorMessage.value.isEmpty
                ? Container()
                : Container(
                    margin: EdgeInsets.only(left: 20.w, right: 20.w),
                    alignment: Alignment.center,
                    height: 35.h,
                    width: Get.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      color: AppColors.errorRed.withOpacity(0.2),
                    ),
                    child: Text(
                      controller.errorMessage.value,
                      style: globalTextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.errorRed),
                    ),
                  ),
          ),
          verticalSpace(10.h),
          Form(
            key: controller.formKey,
            child: Center(
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
                      border:
                          Border.all(color: AppColors.borderColor, width: 1.w),
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
                            left: 10.w, right: 10.w, bottom: 13.h, top: 10.h),
                        width: 1.w,
                        height: 30.h,
                        decoration: BoxDecoration(
                            color: AppColors.dark.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(5.r)),
                      ),
                    ],
                  ),
                  focusedPinTheme: controller.defaultPinTheme.copyWith(
                    decoration: controller.defaultPinTheme.decoration!.copyWith(
                      borderRadius: BorderRadius.circular(5.r),
                      color: AppColors.grey,
                      border: Border.all(color: controller.focusedBorderColor),
                    ),
                  ),
                  submittedPinTheme: controller.defaultPinTheme.copyWith(
                    decoration: controller.defaultPinTheme.decoration!.copyWith(
                      color: AppColors.grey,
                      borderRadius: BorderRadius.circular(5.r),
                      border:
                          Border.all(color: AppColors.white.withOpacity(0.5)),
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
          ),
        ],
      );
    });
  }
}
