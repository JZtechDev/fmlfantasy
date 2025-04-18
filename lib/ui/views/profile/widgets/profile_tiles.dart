import 'package:fmlfantasy/app/app%20routes/app_routes.dart';
import 'package:fmlfantasy/app/app_colors/app_colors.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/ui/helpers/commons.dart';
import 'package:fmlfantasy/ui/views/profile/controller/profile_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProfileTiles extends GetView<ProfileController> {
  const ProfileTiles({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProfileController());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 10.w, right: 10.w, bottom: 10.h),
          child: Text(
            'preferences'.tr,
            style: globalTextStyle(fontSize: 12.sp),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 10, right: 10),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.all(Radius.circular(10.r)),
          ),
          child: Column(
            //mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ListTile(
                onTap: () {
                  //  Get.to(() => const AccountDetails());
                  Get.toNamed(AppRoutes.accountDetailsView, arguments: {
                    'details': controller.accountDetailsList,
                  });
                },
                leading: const Icon(FlutterRemix.edit_2_line),
                trailing: const Icon(FlutterRemix.arrow_right_s_line),
                title: Text(
                  'acountDetails'.tr,
                  style: globalTextStyle(
                      fontSize: 10.h, fontWeight: FontWeight.w400),
                ),
              ),
              ListTile(
                onTap: () {
                  //  Get.to(() => const Statement());
                  Get.toNamed(AppRoutes.statementView,
                      arguments: {'details': controller.accountDetailsList});
                },
                leading: const Icon(FlutterRemix.account_box_fill),
                trailing: const Icon(FlutterRemix.arrow_right_s_line),
                title: Text(
                  'statement'.tr,
                  style: globalTextStyle(
                      fontSize: 10.h, fontWeight: FontWeight.w400),
                ),
              )
            ],
          ),
        ),
        verticalSpace(20),
        Padding(
          padding: EdgeInsets.only(left: 10.w, right: 10.w, bottom: 10.h),
          child: Text(
            'settings'.tr,
            style: globalTextStyle(fontSize: 12.sp),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 10, right: 10),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.all(Radius.circular(10.r)),
          ),
          child: Column(
            //mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ListTile(
                onTap: () {
                  showModalBottomSheet(
                      backgroundColor: Colors.white,
                      context: context,
                      builder: (context) {
                        return SizedBox(
                          height: 100.h,
                          child: Column(children: [
                            ListTile(
                              onTap: () {
                                Get.updateLocale(const Locale('en', 'US'));
                                controller.setLocal('en');
                                controller.local.value = 'en';
                                Get.back();
                              },
                              title: Text(
                                'English',
                                style: globalTextStyle2(fontSize: 14.sp),
                              ),
                            ),
                            ListTile(
                              onTap: () {
                                Get.updateLocale(const Locale('es', 'ES'));
                                controller.setLocal('es');
                                controller.local.value = 'es';
                                Get.back();
                              },
                              title: Text(
                                'Spanish',
                                style: globalTextStyle2(fontSize: 14.sp),
                              ),
                            ),
                          ]),
                        );
                      });
                },
                leading: const Icon(FlutterRemix.earth_fill),
                trailing: const Icon(FlutterRemix.arrow_right_s_line),
                title: Obx(
                  () => Text(
                    controller.local.value == '' ||
                            controller.local.value == 'en'
                        ? 'English'
                        : 'Spanish',
                    style: globalTextStyle(
                        fontSize: 10.h, fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              Obx(
                () => ListTile(
                  onTap: () {
                    showModalBottomSheet(
                        backgroundColor: Colors.white,
                        context: context,
                        builder: (context) {
                          return SizedBox(
                            height: 100.h,
                            child: Column(children: [
                              ListTile(
                                onTap: () {
                                  controller.enableBiometrics();
                                  Get.back();
                                },
                                trailing: controller.isBiometricEnabled.value
                                    ? Icon(
                                        CupertinoIcons.checkmark,
                                        size: 20.sp,
                                        color: AppColors.primary,
                                      )
                                    : null,
                                title: Text(
                                  'Enable',
                                  style: globalTextStyle2(fontSize: 14.sp),
                                ),
                              ),
                              ListTile(
                                onTap: () {
                                  controller.disableBiometrics();
                                  Get.back();
                                },
                                trailing: controller.isBiometricEnabled.value
                                    ? null
                                    : Icon(
                                        CupertinoIcons.checkmark,
                                        size: 20.sp,
                                        color: AppColors.primary,
                                      ),
                                title: Text(
                                  'Disable',
                                  style: globalTextStyle2(fontSize: 14.sp),
                                ),
                              ),
                            ]),
                          );
                        });
                  },
                  leading: const Icon(FlutterRemix.account_box_fill),
                  trailing: Text(controller.isBiometricEnabled.value
                      ? 'enabled'.tr
                      : 'disabled'.tr),
                  title: Text(
                    'Biometric'.tr,
                    style: globalTextStyle(
                        fontSize: 10.h, fontWeight: FontWeight.w400),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
