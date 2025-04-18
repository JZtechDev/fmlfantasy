import 'package:fmlfantasy/app/app_images/app_images.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/ui/views/authentication/controller/forget_password_controller.dart';
import 'package:fmlfantasy/ui/views/team_name/widgets/team_name_lines.dart';
import 'package:fmlfantasy/ui/widgets/app_textfield.dart';
import 'package:fmlfantasy/ui/widgets/primary_button.dart';
import 'package:flutter_svg/svg.dart';

class ConfirmPasswordView extends GetView<ForgetPasswordController> {
  const ConfirmPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.white,
      body: LayoutBuilder(builder: (context, constraints) {
        final maxWidth = constraints.maxWidth;
        return Stack(
          children: [
            const LineContainer(),
            Align(
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  verticalSpace(maxWidth > 600 ? 50.h : 100.h),
                  SvgPicture.asset(
                    AppImages.logo,
                    height: maxWidth > 600 ? 65.h : 50.h,
                    width: maxWidth > 600 ? 65.w : 50.w,
                  ),
                  verticalSpace(maxWidth > 600 ? 30.h : 50.h),
                  Text(
                    'ForgetPassword'.tr,
                    style: globalTextStyle(
                      fontSize: maxWidth > 600 ? 23.sp : 28.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'Please Enter Further Details, Let us'.tr,
                    textAlign: TextAlign.center,
                    style: globalTextStyle2(
                      fontSize: maxWidth > 600 ? 10.sp : 12.sp,
                      color: AppColors.textGray,
                    ),
                  ),
                  verticalSpace(maxWidth > 600 ? 10.h : 20.h),
                  Padding(
                    padding: EdgeInsets.only(left: 15.w, right: 15.w),
                    child: Form(
                        key: controller.confrimFormKey,
                        child: Column(
                          children: [
                            AppTextField(
                              keyboardType: TextInputType.number,
                              controller: controller.otpController,
                              labelText: 'Enter OTP',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'First otp is Required';
                                }
                                return null;
                              },
                            ),
                            verticalSpace(10.h),
                            Obx(
                              () => AppTextField(
                                obscureText: controller.passwordObscure.value,
                                onVisibilityToggle:
                                    controller.toggleVisibilityPassword,
                                labelText: 'Password',
                                suffixIcon: true,
                                controller: controller.passwordController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Password is required";
                                  }

                                  bool hasUppercase =
                                      value.contains(RegExp(r'[A-Z]'));
                                  bool hasDigits =
                                      value.contains(RegExp(r'\d'));
                                  bool hasSpecialCharacters =
                                      value.contains(RegExp(r'[@$!%*?&]'));
                                  bool hasMinLength = value.length >= 8;

                                  if (!hasUppercase) {
                                    return "Password must contain at least one uppercase letter";
                                  }
                                  if (!hasDigits) {
                                    return "Password must contain at least one number";
                                  }
                                  if (!hasSpecialCharacters) {
                                    return "Password must contain at least one special character";
                                  }
                                  if (!hasMinLength) {
                                    return "Password must be at least 8 characters long";
                                  }

                                  return null;
                                },
                              ),
                            ),
                            verticalSpace(10.h),
                            Obx(
                              () => AppTextField(
                                suffixIcon: true,
                                obscureText:
                                    controller.confrimPasswordObscure.value,
                                onVisibilityToggle:
                                    controller.toggleVisibilityConfirmPassword,
                                labelText: 'Confrim Password',
                                controller:
                                    controller.confirmPasswordController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Password is required";
                                  }

                                  bool hasUppercase =
                                      value.contains(RegExp(r'[A-Z]'));
                                  bool hasDigits =
                                      value.contains(RegExp(r'\d'));
                                  bool hasSpecialCharacters =
                                      value.contains(RegExp(r'[@$!%*?&]'));
                                  bool hasMinLength = value.length >= 8;

                                  if (!hasUppercase) {
                                    return "Password must contain at least one uppercase letter";
                                  }
                                  if (!hasDigits) {
                                    return "Password must contain at least one number";
                                  }
                                  if (!hasSpecialCharacters) {
                                    return "Password must contain at least one special character";
                                  }
                                  if (!hasMinLength) {
                                    return "Password must be at least 8 characters long";
                                  }

                                  return null;
                                },
                              ),
                            ),
                          ],
                        )),
                  )
                ],
              ),
            ),
            Positioned(
              bottom: 20.h,
              left: 10.w,
              right: 10.w,
              child: Column(
                children: [
                  PrimaryButton(
                      buttonText: 'Submit'.tr,
                      onPressed: () {
                        controller.newPassword();
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
            )
          ],
        );
      }),
    );
  }
}
