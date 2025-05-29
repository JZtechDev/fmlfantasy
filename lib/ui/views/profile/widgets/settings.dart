import 'package:flutter/cupertino.dart';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/ui/views/profile/controller/profile_controller.dart';

class SeetingsTiles extends GetView<ProfileController> {
  const SeetingsTiles({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProfileController());
    return Container(
      height: Get.height * 0.2,
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      width: Get.width,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.all(Radius.circular(5.r)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsetsGeometry.symmetric(
                horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
                color: const Color.fromRGBO(44, 86, 80, 1),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5.r),
                  bottomLeft: Radius.circular(5.r),
                )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(
                  'assets/new_images/details.png',
                  height: 24,
                  width: 24,
                ),
                // verticalSpace(40.h),
                Image.asset(
                  'assets/new_images/statment.png',
                  height: 24,
                  width: 24,
                )
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoutes.accountDetailsView, arguments: {
                      'details': controller.accountDetailsList,
                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Obx(
                          () => Text(
                            controller.local.value == '' ||
                                    controller.local.value == 'en'
                                ? 'English'
                                : 'Spanish',
                            style: globalTextStyle(
                                fontSize: 14.h, fontWeight: FontWeight.w700),
                          ),
                        ),
                        GestureDetector(
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
                                          Get.updateLocale(
                                              const Locale('en', 'US'));
                                          controller.setLocal('en');
                                          controller.local.value = 'en';
                                          Get.back();
                                        },
                                        title: Text(
                                          'English',
                                          style: globalTextStyle2(
                                              fontSize: 14.sp,
                                              color: AppColors.dark),
                                        ),
                                      ),
                                      ListTile(
                                        onTap: () {
                                          Get.updateLocale(
                                              const Locale('es', 'ES'));
                                          controller.setLocal('es');
                                          controller.local.value = 'es';
                                          Get.back();
                                        },
                                        title: Text(
                                          'Spanish',
                                          style: globalTextStyle2(
                                              fontSize: 14.sp,
                                              color: AppColors.dark),
                                        ),
                                      ),
                                    ]),
                                  );
                                });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: Get.width * 0.25,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: AppColors.secondary,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.r)),
                            ),
                            child: Text(
                              'Edit',
                              style: globalTextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.backgroud),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                verticalSpace(10.h),
                const Divider(
                  color: AppColors.white,
                ),
                verticalSpace(10.h),
                GestureDetector(
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
                                  style: globalTextStyle2(
                                      fontSize: 14.sp,
                                      color: AppColors.primary),
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
                                  style: globalTextStyle2(
                                      fontSize: 14.sp,
                                      color: AppColors.primary),
                                ),
                              ),
                            ]),
                          );
                        });
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Biometrics'.tr,
                          style: globalTextStyle(
                              fontSize: 14.h, fontWeight: FontWeight.w700),
                        ),
                        Obx(
                          () => Container(
                            alignment: Alignment.center,
                            width: Get.width * 0.25,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: controller.isBiometricEnabled.value
                                  ? Colors.green
                                  : AppColors.errorRed,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.r)),
                            ),
                            child: Text(
                                controller.isBiometricEnabled.value
                                    ? 'Enabled'.tr
                                    : 'Disabled'.tr,
                                style: globalTextStyle(
                                    fontSize: 12.sp, color: AppColors.white)),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
