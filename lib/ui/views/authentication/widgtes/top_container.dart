import 'package:fmlfantasy/app/app_images/app_images.dart';
import 'package:fmlfantasy/app/app_sizings.dart';
import 'package:fmlfantasy/ui/views/authentication/controller/authentication_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:fmlfantasy/app/app_colors/app_colors.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class TopContainer extends GetView<AuthenticationController> {
  const TopContainer({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AuthenticationController());
    return LayoutBuilder(builder: (context, constraints) {
      final maxWidth = constraints.maxWidth;
      final maxHeight = constraints.maxHeight;
      return Stack(
        children: [
          AnimatedBuilder(
            animation: controller.animationController,
            builder: (context, child) {
              return Align(
                alignment: Alignment.center,
                child: Transform.scale(
                  scale: controller.scaleAnimation.value,
                  child: Transform.translate(
                    offset: Offset(
                        -Get.width *
                            (1 - controller.scaleAnimation.value / 0.75),
                        controller.screenWidth > 600
                            ? -Get.height *
                                (1 - controller.scaleAnimation.value / 1.5)
                            : -Get.height *
                                (1 - controller.scaleAnimation.value / 1.3)),
                    child: SvgPicture.asset(
                      AppImages.logo,
                      height: AppSizing.isMobile(context) ? 300.h : 150.h,
                    ),
                  ),
                ),
              );
            },
          ),
          Align(
            alignment: Alignment.topRight,
            child: Transform.rotate(
              origin: Offset(
                  maxWidth > 600 ? 200 : 180, maxWidth > 600 ? -280 : -250),
              angle: pi / 4.5, // Rotate 60 degrees clockwise
              child: Container(
                height: maxHeight > 600
                    ? 690.0
                    : 500, // 500.0 Adjust height of the bar
                width: maxWidth > 600 ? 120.0 : 70.0, // Adjust width of the bar
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.textGray.withOpacity(0.3),
                      AppColors.grey.withOpacity(0.01),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Transform.rotate(
              origin: Offset(
                  maxWidth > 600 ? -200 : -120, maxWidth > 600 ? -160 : -200),
              angle: pi / 4.5, // Rotate 60 degrees clockwise
              child: Container(
                height:
                    maxHeight > 600 ? 780.0 : 500, // Adjust height of the bar
                width: maxWidth > 600 ? 120.0 : 70.0, // Adjust width of the bar
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.textGray.withOpacity(0.3),
                      AppColors.grey.withOpacity(
                          0.01), // Adjust opacity or color as needed
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),
          ),
          // Positioned(
          //   top: maxWidth > 600 ? 12.h : 45.h,
          //   right: 0,
          //   child: SlideTransition(
          //     position: controller.slideAnimation,
          //     child: Image.asset(
          //       'assets/images/authentication_image.png',
          //       height: maxWidth > 600 ? 350.h : 338.h,
          //     ),
          //   ),
          // ),
          Positioned(
            top: controller.screenWidth > 600 ? 160.h : 180.h,
            left: 30,
            child: FadeTransition(
              opacity: controller.fadeAnimation,
              child: SizedBox(
                width: controller.screenWidth > 600
                    ? Get.width * 0.75
                    : Get.width * 0.65,
                child: Text(
                  'onBoardingLabel'.tr,
                  style: globalTextStyle(
                      fontSize: AppSizing.isMobile(context) ? 19.sp : 15.sp,
                      color: AppColors.dark,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          )
        ],
      );
    });
  }
}
