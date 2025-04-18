import 'package:fmlfantasy/app/app_colors/app_colors.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/ui/views/authentication/controller/authentication_controller.dart';
import 'package:fmlfantasy/ui/views/authentication/widgtes/auth%20forms/login_form.dart';
import 'package:fmlfantasy/ui/views/authentication/widgtes/auth%20forms/sign_up_form.dart';
import 'package:fmlfantasy/ui/views/authentication/widgtes/form_toggle_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FormsContainer extends GetView<AuthenticationController> {
  const FormsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomInsets = MediaQuery.of(context).viewInsets.bottom;
    bool isKeyboardOpen = bottomInsets != 0;
    Get.put(AuthenticationController());
    return LayoutBuilder(builder: (context, constraints) {
      double maxWidth = constraints.maxWidth;
      return DraggableScrollableSheet(
        maxChildSize: isKeyboardOpen ? 1.0 : 0.9,
        initialChildSize: controller.loginForm.value ? 0.82 : 0.8,
        minChildSize: 0.8,
        expand: true,
        builder: (BuildContext context, ScrollController scrollController) {
          return AnimatedBuilder(
            animation: controller.animationController,
            builder: (context, child) {
              return AnimatedContainer(
                transform: Matrix4.translationValues(
                    0, controller.loginanimation.value, 0),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.0.r),
                    topRight: Radius.circular(40.0.r),
                  ),
                ),
                duration: const Duration(milliseconds: 300),
                child: SingleChildScrollView(
                  physics: isKeyboardOpen
                      ? const ScrollPhysics()
                      : const NeverScrollableScrollPhysics(),
                  controller: scrollController,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 20.h),
                        child: Stack(
                          children: [
                            Obx(() {
                              final isLoggedIn = controller.loginForm.isTrue;
                              return AnimatedOpacity(
                                opacity: isLoggedIn ? 1.0 : 0.0,
                                duration: const Duration(seconds: 1),
                                curve: Curves.easeInOut,
                                child: Text(
                                  'loginContainerLabel'.tr,
                                  style: globalTextStyle(
                                    fontSize: maxWidth > 600 ? 18.sp : 21.sp,
                                  ),
                                ),
                              );
                            }),
                            Obx(() {
                              final isLoggedIn = controller.loginForm.isTrue;
                              return AnimatedOpacity(
                                opacity: isLoggedIn ? 0.0 : 1.0,
                                duration: const Duration(seconds: 1),
                                curve: Curves.easeIn,
                                child: Text(
                                  'signUpContainer'.tr,
                                  style: globalTextStyle(
                                    fontSize: maxWidth > 600 ? 18.sp : 21.sp,
                                  ),
                                ),
                              );
                            }),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 0.7.sw,
                        child: Padding(
                          padding: EdgeInsets.only(top: 5.h),
                          child: Stack(
                            children: [
                              Obx(() {
                                final isLoggedIn = controller.loginForm.isTrue;
                                return AnimatedOpacity(
                                  opacity: isLoggedIn ? 0.0 : 1.0,
                                  duration: const Duration(seconds: 1),
                                  curve: Curves.easeInOut,
                                  child: Text(
                                    textAlign: TextAlign.center,
                                    'signUpDescription'.tr,
                                    style: globalTextStyle2(
                                      fontSize: maxWidth > 600 ? 12.sp : 13.sp,
                                      color: AppColors.textGray,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                );
                              }),
                              Obx(() {
                                final isLoggedIn = controller.loginForm.isTrue;
                                return AnimatedOpacity(
                                  opacity: isLoggedIn ? 1.0 : 0.0,
                                  duration: const Duration(seconds: 1),
                                  curve: Curves.easeIn,
                                  child: Text(
                                    textAlign: TextAlign.center,
                                    'loginDescription'.tr,
                                    style: globalTextStyle2(
                                      fontSize: maxWidth > 600 ? 12.sp : 13.sp,
                                      color: AppColors.textGray,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                );
                              }),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      const FormToggleBar(),
                      Obx(
                        () => controller.loginForm.isTrue
                            ? const LoginForm()
                            : const SignUpForm(),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      );
    });
  }
}
