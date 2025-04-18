import 'package:fmlfantasy/app/app_sizings.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/ui/views/new_auth/controller/register_controller.dart';
import 'package:fmlfantasy/ui/widgets/app_textfield.dart';
import 'package:fmlfantasy/ui/widgets/primary_button.dart';
import 'package:flutter/cupertino.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(RegisterNewController());
    return GetBuilder<RegisterNewController>(builder: (controller) {
      return Form(
        key: controller.formKey,
        child: Column(
          children: [
            AppTextField(
              labelText: 'Email',
              controller: controller.emailController,
              fillColor: AppColors.white,
              validator: (value) {
                if (!GetUtils.isEmail(value!)) {
                  return "email seems invalid, please adjust.";
                } else {
                  return null;
                }
              },
            ),
            verticalSpace(10),
            AppTextField(
              suffixIcon: true,
              fillColor: AppColors.white,
              obscureText: controller.isObscure,
              onVisibilityToggle: controller.toggleVisibility,
              labelText: 'Password',
              controller: controller.passwordController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Password is required";
                }
                bool hasUppercase = value.contains(RegExp(r'[A-Z]'));
                bool hasDigits = value.contains(RegExp(r'\d'));
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
              onChanged: (p0) {
                controller.checkPassword(p0);
              },
            ),
            verticalSpace(10),
            Row(
              children: [
                Icon(
                  CupertinoIcons.check_mark,
                  color: controller.hasMinLength
                      ? Colors.green
                      : AppColors.textGray,
                  size: 15,
                ),
                horizontalSpace(10),
                Text('At least 8 characters',
                    style: globalTextStyle(
                        fontSize: AppSizing.isMobile(context) ? 12.sp : 8.sp,
                        color: controller.hasMinLength
                            ? Colors.green
                            : AppColors.textGray,
                        fontWeight: FontWeight.w400)),
              ],
            ),
            Row(
              children: [
                Icon(
                  CupertinoIcons.check_mark,
                  color:
                      controller.hasNumber ? Colors.green : AppColors.textGray,
                  size: 15,
                ),
                horizontalSpace(10),
                Text('At least 1 number',
                    style: globalTextStyle(
                        fontSize: AppSizing.isMobile(context) ? 12.sp : 8.sp,
                        color: controller.hasNumber
                            ? Colors.green
                            : AppColors.textGray,
                        fontWeight: FontWeight.w400)),
              ],
            ),
            verticalSpace(5),
            Row(
              children: [
                Icon(
                  CupertinoIcons.check_mark,
                  color: controller.hasSpecialChar
                      ? Colors.green
                      : AppColors.textGray,
                  size: 15,
                ),
                horizontalSpace(10),
                Text('At least 1 Special character',
                    style: globalTextStyle(
                        fontSize: AppSizing.isMobile(context) ? 12.sp : 8.sp,
                        color: controller.hasSpecialChar
                            ? Colors.green
                            : AppColors.textGray,
                        fontWeight: FontWeight.w400)),
              ],
            ),
            verticalSpace(5),
            Row(
              children: [
                Icon(
                  CupertinoIcons.check_mark,
                  color: controller.hasLowercase
                      ? Colors.green
                      : AppColors.textGray,
                  size: 15,
                ),
                horizontalSpace(10),
                Text('At least 1 Upper case letter',
                    style: globalTextStyle(
                        fontSize: AppSizing.isMobile(context) ? 12.sp : 8.sp,
                        color: controller.hasUppercase
                            ? Colors.green
                            : AppColors.textGray,
                        fontWeight: FontWeight.w400)),
              ],
            ),
            verticalSpace(10),
            FormField<String>(
              initialValue: controller.selectedcountryName,
              validator: (value) {
                if (controller.selectedcountryName.isEmpty ||
                    controller.selectedcountryName == '') {
                  return 'Please select a country';
                }
                return null;
              },
              builder: (FormFieldState<String> state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        controller.isCountryValidation = false;
                        controller.selectCountry(context);
                      },
                      child: Container(
                        padding: EdgeInsets.only(
                            left: 15.h, right: 15.h, top: 13.h, bottom: 13.h),
                        width: Get.width,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(5.r),
                          border: Border.all(
                            color: controller.isCountryValidation
                                ? AppColors.errorRed
                                : AppColors.borderColor,
                          ),
                        ),
                        child: Row(
                          children: [
                            Text(
                              controller.selectedcountryName == ''
                                  ? 'Country'
                                  : controller.selectedcountryName,
                              style: globalTextStyle(
                                  fontSize: AppSizing.isMobile(context)
                                      ? 12.sp
                                      : 8.sp,
                                  color: AppColors.textGray,
                                  fontWeight: FontWeight.w500),
                            ),
                            Expanded(child: Container()),
                            Icon(
                              CupertinoIcons.chevron_forward,
                              size: AppSizing.isMobile(context) ? 20.sp : 12.sp,
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (state.hasError)
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          state.errorText!,
                          style: TextStyle(
                            color: AppColors.errorRed,
                            fontSize:
                                AppSizing.isMobile(context) ? 12.sp : 8.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                  ],
                );
              },
            ),
            verticalSpace(100),
            PrimaryButton(
                isLoading: controller.isLoading,
                buttonText: 'register'.tr,
                onPressed: () {
                  if (controller.formKey.currentState!.validate()) {
                    controller.sendOTP();
                  }
                },
                isEnabled: true)
          ],
        ),
      );
    });
  }
}
