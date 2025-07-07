import 'package:fmlfantasy/app/app_images/app_images.dart';
import 'package:fmlfantasy/app/app_sizings.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/ui/views/authentication/controller/otp_controller.dart';
import 'package:fmlfantasy/ui/views/authentication/widgtes/auth%20forms/otp_form.dart';
import 'package:fmlfantasy/ui/views/team_name/widgets/team_name_lines.dart';
import 'package:fmlfantasy/ui/widgets/primary_button.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OtpView extends GetView<OtpController> {
  const OtpView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OtpController());
    return Scaffold(
      backgroundColor: Color.fromRGBO(44, 86, 80, 1),
      resizeToAvoidBottomInset: false,
      body: LayoutBuilder(builder: (context, constraints) {
        final maxWidth = constraints.maxWidth;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            verticalSpace(maxWidth > 600 ? 50.h : 100.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Image.asset(
                AppImages.logo,
              ),
            ),
            verticalSpace(20.h),
            const OtpForm(),
            verticalSpace(20.h),
            Obx(() {
              return controller.resenOtp.value == true
                  ? Column(
                      children: [
                        Text(
                          'Did not receive the OTP?'.tr,
                          style: globalTextStyle2(
                              fontSize:
                                  AppSizing.isMobile(context) ? 12.sp : 8.sp,
                              color: AppColors.white,
                              fontWeight: FontWeight.w600),
                        ),
                        Obx(
                          () => RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Request New one in '.tr,
                                  style: globalTextStyle2(
                                      fontSize: AppSizing.isMobile(context)
                                          ? 12.sp
                                          : 8.sp,
                                      color: AppColors.white,
                                      fontWeight: FontWeight.w600),
                                ),
                                TextSpan(
                                  text: controller.countdown.value.toString(),
                                  style: globalTextStyle2(
                                      fontSize: AppSizing.isMobile(context)
                                          ? 12.sp
                                          : 8.sp,
                                      color: AppColors.secondary,
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
                      controller.signUp();
                    },
                    isEnabled: true),
                verticalSpace(10.h),
              ],
            ),
          ],
        );
      }),
    );
  }
}
