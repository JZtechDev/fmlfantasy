import 'package:animate_do/animate_do.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fmlfantasy/app/app_colors/app_colors.dart';
import 'package:fmlfantasy/app/app_images/app_images.dart';
import 'package:fmlfantasy/ui/views/splash_screen/controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:video_player/video_player.dart';

class SplashVIew extends GetView<SplashController> {
  const SplashVIew({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveBuilder(
        builder: (context, sizingInformation) {
          if (sizingInformation.deviceScreenType == DeviceScreenType.tablet) {
            return Padding(
              padding: EdgeInsets.only(left: 100.w, right: 100.w),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: AppColors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox.shrink(),
                    SvgPicture.asset(AppImages.logo, height: 150.h),
                  ],
                ),
              ),
            );
          }
          return Stack(
            fit: StackFit.expand,
            children: [
              Obx(() {
                return controller.isVideoInitialized.value &&
                        controller.videoPlayerController.value.isInitialized
                    ? Positioned.fill(
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: SizedBox(
                            width: controller
                                .videoPlayerController.value.size.width,
                            height: controller
                                .videoPlayerController.value.size.height,
                            child:
                                VideoPlayer(controller.videoPlayerController),
                          ),
                        ),
                      )
                    : Container(
                        color: AppColors.backgroud,
                        child: const Center(child: CircularProgressIndicator()),
                      );
              }),
              Center(
                child: Padding(
                  padding:
                      EdgeInsets.only(left: 100.w, right: 100.w, top: 20.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Hero(
                        tag: 'logo',
                        child: FadeIn(
                            duration: const Duration(seconds: 2),
                            child: Image.asset(AppImages.logo, height: 200.h)),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
