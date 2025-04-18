import 'package:fmlfantasy/app/app_images/app_images.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/ui/helpers/validation_text.dart';
import 'package:fmlfantasy/ui/views/authentication/controller/resgister_controller.dart';
import 'package:fmlfantasy/ui/widgets/app_textfield.dart';

class RegistrationForm extends GetView<ResgisterController> {
  const RegistrationForm({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ResgisterController());
    return LayoutBuilder(builder: (context, constraints) {
      double maxWidth = constraints.maxWidth;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'You’re just a few details away'.tr,
            style: globalTextStyle(
              fontSize: maxWidth > 600 ? 23.sp : 28.sp,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            'Please Enter Further Details, Let us\nget to know you better.'.tr,
            textAlign: TextAlign.center,
            style: globalTextStyle2(
              fontSize: maxWidth > 600 ? 10.sp : 12.sp,
              color: AppColors.textGray,
            ),
          ),
          verticalSpace(maxWidth > 600 ? 10.h : 20.h),
          Form(
            key: controller.formKey,
            child: Padding(
              padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 10.h),
              child: Column(
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: AppTextField(
                          controller: controller.firstNameController,
                          labelText: 'First Name',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'First Name is Required';
                            }
                            return null;
                          },
                        ),
                      ),
                      horizontalSpace(10.w),
                      Flexible(
                        child: AppTextField(
                          controller: controller.lastNameController,
                          labelText: 'Last Name',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Last Name is Required';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  verticalSpace(10.h),
                  AppTextField(
                    obscureText: controller.isObscure.value,
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
                  ),
                  verticalSpace(10.h),
                  Obx(
                    () => GestureDetector(
                      onTap: () {
                        controller.isCountryValidation.value = false;
                        controller.selectCountry(context);
                      },
                      child: Container(
                        padding: EdgeInsets.only(
                            left: 15.h, right: 15.h, top: 10.h, bottom: 10.h),
                        height: 45,
                        width: Get.width,
                        decoration: BoxDecoration(
                          color: AppColors.grey,
                          borderRadius: BorderRadius.circular(5.r),
                          border: Border.all(
                            color: controller.selectedcountryName.value.isEmpty
                                ? AppColors.errorRed
                                : AppColors.borderColor,
                          ),
                        ),
                        child: Row(
                          children: [
                            Text(
                              // ignore: unrelated_type_equality_checks
                              controller.selectedcountryName == ''
                                  ? 'Country'
                                  : controller.selectedcountryName.value,
                              style: globalTextStyle(
                                  fontSize: maxWidth > 600 ? 12.sp : 12.sp,
                                  color: AppColors.textGray,
                                  fontWeight: FontWeight.w500),
                            ),
                            Expanded(child: Container()),
                            Image.asset(
                              AppImages.downIcon,
                              height: 10,
                              width: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Obx(() => controller.isCountryValidation.value
                      ? Obx(() {
                          return controller.selectedcountryName.value.isEmpty
                              ? const ValidationText(
                                  text: 'Please select country')
                              : Container(); // Empty container when no error
                        })
                      : Container()),
                  verticalSpace(10.h),
                  AppTextField(
                    labelText: 'Phone Number',
                    controller: controller.phoneController,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Phone number is required";
                      } else {
                        return null;
                      }
                    },
                    prefixIcon: Container(
                      //height: 60.h,
                      width: 75.w,
                      alignment: Alignment.center,
                      child: Obx(() => Text(
                            '${controller.countryP.value.flagEmoji} + ${controller.countryP.value.phoneCode}',
                            style: globalTextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.textGray),
                          )),
                    ),
                  ),
                  verticalSpace(10.h),
                  GetBuilder<ResgisterController>(
                    builder: (controller) => Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            controller.showVerifyOtp();
                          },
                          child: Text('Verify Your Number',
                              style: globalTextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w500,
                                  color: controller.isNumberVarified
                                      ? Colors.greenAccent
                                      : AppColors.textGray)),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      );
    });
  }
}
