import 'package:fmlfantasy/app/app_colors/app_colors.dart';
import 'package:fmlfantasy/app/app_sizings.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/ui/components/home_appbar.dart';
import 'package:fmlfantasy/ui/helpers/commons.dart';
import 'package:fmlfantasy/ui/views/profile/controller/profile_controller.dart';
import 'package:fmlfantasy/ui/views/profile/widgets/profile_image.dart';
import 'package:fmlfantasy/ui/views/profile/widgets/profile_tiles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fmlfantasy/ui/widgets/dashboard_button.dart';
import 'package:get/get.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProfileController());
    return Scaffold(
        appBar: HomeAppBar(title: 'Profile'.tr),
        body: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              verticalSpace(10.h),
              const DashboardButton(),
              verticalSpace(30.h),
              const ProfileImage(),
              verticalSpace(10.h),
              const Divider(
                color: AppColors.secondary,
                thickness: 1.0,
              ),
              verticalSpace(10.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: GetBuilder<ProfileController>(builder: (controller) {
                  return Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            controller.isSeetingEnable = false;
                          },
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: controller.isSeetingEnable
                                  ? AppColors.backgroud
                                  : AppColors.secondary,
                              borderRadius: BorderRadius.circular(5.r),
                              border: Border.all(color: AppColors.secondary),
                            ),
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/new_images/prefs.png',
                                  height: 24,
                                  width: 24,
                                  color: controller.isSeetingEnable
                                      ? AppColors.secondary
                                      : AppColors.dark,
                                ),
                                horizontalSpace(10.w),
                                Text(
                                  'Preferences',
                                  style: globalTextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600,
                                      color: controller.isSeetingEnable
                                          ? AppColors.secondary
                                          : AppColors.dark),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      horizontalSpace(10.w),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            controller.isSeetingEnable = true;
                          },
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: controller.isSeetingEnable
                                  ? AppColors.secondary
                                  : AppColors.backgroud,
                              borderRadius: BorderRadius.circular(5.r),
                              border: Border.all(color: AppColors.secondary),
                            ),
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/new_images/seetings.png',
                                  height: 24,
                                  width: 24,
                                  color: controller.isSeetingEnable
                                      ? AppColors.dark
                                      : AppColors.secondary,
                                ),
                                horizontalSpace(10.w),
                                Text(
                                  'Settings',
                                  style: globalTextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600,
                                      color: controller.isSeetingEnable
                                          ? AppColors.dark
                                          : AppColors.secondary),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  );
                }),
              ),
              verticalSpace(20.h),
              const ProfileTiles(),
              const Spacer(),
              GestureDetector(
                onTap: () => controller.logout(),
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 20.w),
                  width: AppSizing.width(context),
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                  decoration: BoxDecoration(
                    color: AppColors.errorRed,
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  child: Text(
                    'Logout',
                    style: globalTextStyle(
                        fontSize: 16.sp,
                        color: AppColors.white,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
