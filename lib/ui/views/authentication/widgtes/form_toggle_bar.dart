import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:fmlfantasy/app/app_colors/app_colors.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/ui/views/authentication/controller/authentication_controller.dart';

class FormToggleBar extends GetView<AuthenticationController> {
  const FormToggleBar({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AuthenticationController());
    return LayoutBuilder(
      builder: (context, constraints) {
        double width =
            constraints.maxWidth > 600 ? Get.width * 0.7 : Get.width * 0.9;
        double buttonWidth = (width - 20.w) / 2; // Adjusting width for padding
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Container(
            width: width,
            height: 55.h,
            decoration: BoxDecoration(
              color: AppColors.grey,
              border: Border.all(
                color: AppColors.borderColor,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(5.r),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(
                    () => GestureDetector(
                      onTap: () {
                        controller.loginForm.value = true;
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        alignment: Alignment.center,
                        height: 45.h,
                        width: buttonWidth,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.r),
                          color: controller.loginForm.value
                              ? AppColors.white
                              : AppColors.grey,
                        ),
                        child: AnimatedDefaultTextStyle(
                          duration: const Duration(milliseconds: 300),
                          style: globalTextStyle(
                            fontSize: 12.sp,
                            color: AppColors.dark,
                          ),
                          child: Text(
                            'Login'.tr,
                            style: globalTextStyle(
                                fontSize: 12.sp, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Obx(
                    () => GestureDetector(
                      onTap: () {
                        controller.loginForm.value = false;
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        alignment: Alignment.center,
                        height: 45.h,
                        width: buttonWidth,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.r),
                          color: controller.loginForm.value
                              ? AppColors.grey
                              : AppColors.white,
                        ),
                        child: AnimatedDefaultTextStyle(
                          duration: const Duration(milliseconds: 300),
                          style: globalTextStyle(
                            fontSize: 12.sp,
                            color: AppColors.dark,
                          ),
                          child: Text(
                            'Sign Up'.tr,
                            style: globalTextStyle(
                                fontSize: 12.sp, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
